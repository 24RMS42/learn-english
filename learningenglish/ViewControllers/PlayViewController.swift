//
//  PlayViewController.swift
//  learningenglish
//
//  Created by YakovAlexey on 1/8/18.
//  Copyright © 2018 coindevelopment. All rights reserved.
//

import UIKit
import Cosmos
import AVFoundation
import GoogleMobileAds

class PlayViewController: UIViewController, GADRewardBasedVideoAdDelegate {
 
    @IBOutlet weak var imageGroup0: UIView!
    @IBOutlet weak var image00: UIImageView!
    @IBOutlet weak var image01: UIImageView!
    
    @IBOutlet weak var imageGroup1: UIView!
    @IBOutlet weak var image10: UIImageView!
    @IBOutlet weak var image11: UIImageView!
    @IBOutlet weak var image12: UIImageView!
    
    @IBOutlet weak var imageGroup2: UIView!
    @IBOutlet weak var image20: UIImageView!
    @IBOutlet weak var image21: UIImageView!
    @IBOutlet weak var image22: UIImageView!
    @IBOutlet weak var image23: UIImageView!
    
    @IBOutlet weak var imageGroup3: UIView!
    @IBOutlet weak var image30: UIImageView!
    @IBOutlet weak var image31: UIImageView!
    @IBOutlet weak var image32: UIImageView!
    @IBOutlet weak var image33: UIImageView!
    @IBOutlet weak var image34: UIImageView!
    
    @IBOutlet weak var imageGroup4: UIView!
    @IBOutlet weak var image40: UIImageView!
    @IBOutlet weak var image41: UIImageView!
    @IBOutlet weak var image42: UIImageView!
    @IBOutlet weak var image43: UIImageView!
    @IBOutlet weak var image44: UIImageView!
    @IBOutlet weak var image45: UIImageView!
    
    @IBOutlet weak var cvRating: CosmosView!
    @IBOutlet weak var winDialog: UIView!
    
    var imageGroups = Array<UIView>()
    var images = Array<Array<UIImageView>>()
    
    var audioPlayer : AVAudioPlayer?
    
    var winInPrevious = false
    
    var finished = false
    var adsShown = false
    
    var imageSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageGroups.append(imageGroup0)
        imageGroups.append(imageGroup1)
        imageGroups.append(imageGroup2)
        imageGroups.append(imageGroup3)
        imageGroups.append(imageGroup4)
        
        images.append([image00, image01])
        images.append([image10, image11, image12])
        images.append([image20, image21, image22, image23])
        images.append([image30, image31, image32, image33, image34])
        images.append([image40, image41, image42, image43, image44, image45])
        
        for subimages in images {
            for image in subimages {
                image.isUserInteractionEnabled = true
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PlayViewController.onSelectImage(_:)))
                image.addGestureRecognizer(tapGestureRecognizer)
            }
        }
        
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: "ca-app-pub-1368614258949399/5409479637")
    }
    
    var currentStage = 0
    var correctIndex = 0
    var correctName : String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cvRating.settings.totalStars = LevelSelectionViewController.level * 2 + 1
        cvRating.rating = 0
        
        currentStage = 0
        
        upgradeStage()
        createNewImages()
    }
    
    @objc
    func onSelectImage(_ sender: UITapGestureRecognizer) {
        guard finished == false && imageSelected == false else {
            return
        }
        imageSelected = true
        
        let tag = sender.view!.tag
        if tag == correctIndex {
            cvRating.rating += 1
            
            if (Int(self.cvRating.rating) == self.cvRating.settings.totalStars) {
                if self.winInPrevious {
                    self.currentStage += 1
                    if self.currentStage == 5 {
                        self.congratulateWin()
                        return
                    } else {
                        playActionSound(ofType: 2)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                            self.cvRating.rating = 0
                            self.upgradeStage()
                            self.createNewImages()
                        })
                    }
                } else {
                    self.winInPrevious = true
                    
                    playActionSound(ofType: 2)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        self.cvRating.rating = 0
                        self.createNewImages()
                    })
                }
                
            } else {
                playActionSound(ofType: 0)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.createNewImages()
                })
            }
        } else {
            playActionSound(ofType: 1)
            if cvRating.rating > 0 {
                cvRating.rating -= 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.createNewImages()
                })
            } else {
                if winInPrevious {
                    winInPrevious = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        self.createNewImages()
                    })
                } else {
                    currentStage -= 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        self.upgradeStage()
                        self.createNewImages()
                    })
                }
            }
        }
        
        if adsShown == false && GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
            adsShown = true
        }
    }
    
    func playActionSound(ofType: Int) {
        do {
            if let url = Info.getActionSoundURL(ofType: ofType) {
                audioPlayer = try AVAudioPlayer(contentsOf:url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            }
        } catch {
            print(error)
        }
    }
    
    func congratulateWin() {
        finished = true
        winDialog.isHidden = false
        playActionSound(ofType: 3)
    }
    
    func upgradeStage() {
        if currentStage < 0 {
            currentStage = 0
        } else {
            for group in imageGroups {
                group.isHidden = true
            }
            imageGroups[currentStage].isHidden = false
        }
    }
    
    func createNewImages() {
        if MainViewController.adsShowFlag == true && MainViewController.adsHelper?.adsDisplyed == false && (MainViewController.adsHelper?.interstitial.isReady)! {
            MainViewController.adsHelper?.interstitial.present(fromRootViewController: self)
            MainViewController.adsHelper?.adsDisplyed = true
        }
        
        imageSelected = false
        var nameArray = Array<String>()
        var allNames = Info.getAllNames()
        var i = 0
        repeat {
            let rand = Int(drand48() * 500) % allNames.count
            nameArray.append(allNames[rand])
            images[currentStage][i].image = Info.getImage(name: allNames[rand])
            allNames.remove(at: rand)
            i = i + 1
        } while (i < currentStage + 2)
        
        correctIndex = Int(drand48() * 500) % nameArray.count
        correctName = nameArray[correctIndex]
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: Info.getSoundURLByName(correctName!, type: 1))
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onActionButtonPress(_ sender: UIButton) {
        guard finished == false || sender.tag == 4 else {
            return
        }
        switch (sender.tag) {
        case 0: // SKIP button
            createNewImages()
            break
        case 1: // English
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: Info.getSoundURLByName(correctName!, type: 1))
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                print(error)
            }
            break
        case 2: //Persian
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: Info.getSoundURLByName(correctName!, type: 2))
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                print(error)
            }
            break
        case 3: //Voice
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: Info.getSoundURLByName(correctName!, type: 0))
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                print(error)
            }
            break
        case 4: //Replay
            if GADRewardBasedVideoAd.sharedInstance().isReady == true {
                GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
                adsShown = true
            } else {
                if MainViewController.adsShowFlag == true && (MainViewController.adsHelper?.interstitial.isReady)! {
                    MainViewController.adsHelper?.interstitial.present(fromRootViewController: self)
                }
                replay()
            }
        default:
            break
        }
    }
    
    func replay() {
        if audioPlayer != nil && audioPlayer!.isPlaying {
            audioPlayer?.pause()
        }
        winDialog.isHidden = true
        currentStage = 0
        cvRating.rating = 0
        upgradeStage()
        createNewImages()
        finished = false
        adsShown = false
    }

    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func onExit(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            Darwin.exit(0)
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: Info.getActionSoundURL(ofType: 4)!)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print(error)
        }
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd:GADRewardBasedVideoAd) {
        print("Reward based video ad is received.")
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Opened reward based video ad.")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad started playing.")
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad is closed.")
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: "ca-app-pub-1368614258949399/5409479637")
        if finished {
            replay()
        }
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad will leave application.")
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: "ca-app-pub-1368614258949399/5409479637")
        if finished {
            replay()
        }
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        print("Reward based video ad failed to load.")
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: "ca-app-pub-1368614258949399/5409479637")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

