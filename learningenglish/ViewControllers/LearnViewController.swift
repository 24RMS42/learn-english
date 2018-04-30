//
//  LearnViewController.swift
//  learningenglish
//
//  Created by YakovAlexey on 1/5/18.
//  Copyright © 2018 coindevelopment. All rights reserved.
//

import UIKit
import BMPlayer
import AVFoundation
import NVActivityIndicatorView
import GoogleMobileAds
//import HYParentalGate

class LearnViewController: UIViewController, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate, BMPlayerDelegate, GADBannerViewDelegate {

    let AVAILABLE_VIDEO_COUNT_IDENTIFIER = "AVAILABLE_VIDEO_COUNT_IDENTIFIER"

    var p = SKProduct()
    
    @IBOutlet weak var ivBackground: UIImageView!
    
    @IBOutlet weak var btnWild: UIButton!
    @IBOutlet weak var btnDomestic: UIButton!
    @IBOutlet weak var btnBirds: UIButton!
    @IBOutlet weak var btnAquatic: UIButton!
    @IBOutlet weak var btnTransports: UIButton!
    @IBOutlet weak var btnVerb: UIButton!
    @IBOutlet weak var btnMusical: UIButton!
    @IBOutlet weak var btnVideo: UIButton!
    
    @IBOutlet weak var ivVideoListBackground: UIImageView!
    var buttons : Array<UIButton>?
    var currentType = 0
    
    var audioPlayer : AVAudioPlayer?
    
    @IBOutlet weak var cvCollectionView: UICollectionView!
    @IBOutlet weak var tvVideoList: UITableView!
    
    var gateShowed = false
    var player: BMPlayer!
    var videoBackgroundImageView : UIImageView?
    
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttons = Array()
        buttons?.append(btnWild)
        buttons?.append(btnDomestic)
        buttons?.append(btnBirds)
        buttons?.append(btnAquatic)
        buttons?.append(btnTransports)
        buttons?.append(btnVerb)
        buttons?.append(btnMusical)
        buttons?.append(btnVideo)
        
        currentType = 0
        
        cvCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        let width = cvCollectionView.frame.width * 0.4
        layout.itemSize = CGSize(width: width, height: width * 1.5 + 5)
        cvCollectionView.setCollectionViewLayout(layout, animated: false)

        tvVideoList.isHidden = true
        ivVideoListBackground.isHidden = true
        
        tvVideoList.dataSource = self
        tvVideoList.delegate = self
        // Do any additional setup after loading the view.
   
        preparePlayer()
        player.isHidden = true
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(applicationDidEnterBackground),
                                               name: NSNotification.Name.UIApplicationDidEnterBackground,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(applicationWillEnterForeground),
                                               name: NSNotification.Name.UIApplicationWillEnterForeground,
                                               object: nil)
        

        bannerView = GADBannerView(adSize: kGADAdSizeBanner )
        bannerView.delegate = self
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-1368614258949399/2085791225"
        bannerView.rootViewController = self
        let request = GADRequest()
        request.tag(forChildDirectedTreatment: true)
        bannerView.load(request)
        
//        bannerView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ivBackground.image = Info.getBackgroundImageBy(Category: currentType)
        
//        if gateShowed == false {
//            let parentalGate = HYParentalGate.sharedGate
//            parentalGate.show(successHandler: {
//                // Code was entered correctly. Handle this properly.
//                self.bannerView.isHidden = false
//            })
//        }
//        gateShowed = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Info.getCount(category: currentType)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let animalCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "animalCell", for: indexPath) as! AnimalCollectionViewCell
        
        guard currentType < 7 else {
            return animalCollectionViewCell
        }
        let eName = Info.getEName(category: currentType, index: indexPath.row)
        let pName = Info.getPName(category: currentType, index: indexPath.row)
        
        animalCollectionViewCell.lblEName.text = eName
        animalCollectionViewCell.lblPName.text = pName
        
        animalCollectionViewCell.ivAnimal.image = Info.getImage(name: eName)
        animalCollectionViewCell.ivAnimal.tag = 0000 + indexPath.row
        animalCollectionViewCell.btnEName.tag = 1000 + indexPath.row
        animalCollectionViewCell.btnPName.tag = 2000 + indexPath.row
        
        animalCollectionViewCell.btnEName.addTarget(self, action: #selector(playSound(_:)), for: .touchUpInside)
        animalCollectionViewCell.btnPName.addTarget(self, action: #selector(playSound(_:)), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(playSound(_:)))
        animalCollectionViewCell.ivAnimal.addGestureRecognizer(tapGesture)

        return animalCollectionViewCell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc
    func playSound(_ sender: Any) {
        let senderTag : Int
        if sender is UIView {
            senderTag = (sender as! UIView).tag
        } else if sender is UITapGestureRecognizer {
            senderTag = (sender as! UITapGestureRecognizer).view!.tag
        } else {
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: Info.getSoundURL(category: currentType, index: senderTag % 1000, type: senderTag / 1000))
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print(error)
        }
    }
    
    @IBAction func onSelectType(_ sender: UIButton) {
        if (currentType != sender.tag) {
            ivBackground.image = Info.getBackgroundImageBy(Category: currentType)
            for btn in buttons! {
                btn.isSelected = btn.tag == sender.tag
            }
            currentType = sender.tag
            cvCollectionView.isHidden = currentType == 7
            tvVideoList.isHidden = currentType < 7
            ivVideoListBackground.isHidden = currentType < 7
            if currentType < 7 {
                player.isHidden = true
                videoBackgroundImageView?.isHidden = true
                player.pause()
                cvCollectionView.reloadData()
            } else if player != nil {
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Info.vS_Names.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let videoCell = tableView.dequeueReusableCell(withIdentifier: "videoname") as! VideoTableViewCell
        
        videoCell.lblTitle.text = Info.vS_Names[indexPath.row]

        videoCell.selectionStyle = .none
        return videoCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        videoBackgroundImageView?.isHidden = false
        setupPlayerResoucre(indexPath.row)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard videoBackgroundImageView == nil else {
            return
        }
        videoBackgroundImageView = UIImageView(image: UIImage(named: "background_video_default"))
        videoBackgroundImageView?.backgroundColor = UIColor.white
        
        let height = cvCollectionView.frame.width * 9.0 / 16.0
        
        videoBackgroundImageView?.frame = CGRect(x: cvCollectionView.frame.origin.x, y: cvCollectionView.frame.origin.y + (cvCollectionView.frame.height - height)/2.0, width: cvCollectionView.frame.width, height: height)
        
        view.addSubview(videoBackgroundImageView!)
        
        videoBackgroundImageView?.isHidden = true
    }

    // Codes for Video Play
    func preparePlayer() {
        let controller: BMPlayerControlView? = nil

        player = BMPlayer(customControlView: controller)
        view.addSubview(player)
        
        player.snp.makeConstraints { (make) in
            make.centerY.equalTo(cvCollectionView.snp.centerY)
            make.left.equalTo(cvCollectionView.snp.left)
            make.right.equalTo(cvCollectionView.snp.right)
            make.height.equalTo(cvCollectionView.snp.width).multipliedBy(9.0/16.0).priority(500)
        }
        
        player.delegate = self
        player.backBlock = { [unowned self] (isFullScreen) in
            self.player.isHidden = true
            self.player.pause()
        }

        self.view.layoutIfNeeded()
    }
    
    func setupPlayerResoucre(_ index: Int) {
        var urlString = "https://promoletter.com/learnenglish/videos/"
        if index >= 10 {
            urlString += "p_1_lesson_\(index-9).mp4"
        } else {
            urlString += "e_1_lesson_\(index+1).mp4"
        }
        let url = URL(string: urlString)!
        
    //    let subtitle = BMSubtitles(url: url)
        
        let asset = BMPlayerResource(url: url, name: Info.vS_Names[index], cover: nil, subtitle: nil)
        
        player.setVideo(resource: asset)
        player.autoPlay()
    }
    
    func bmPlayer(player: BMPlayer, playerStateDidChange state: BMPlayerState) {
        if state == BMPlayerState.readyToPlay {
            if videoBackgroundImageView!.isHidden == false {
                videoBackgroundImageView?.isHidden = true
                player.isHidden = false
            } else {
                player.pause()
            }
        }
    }
    
    func bmPlayer(player: BMPlayer, loadedTimeDidChange loadedDuration: TimeInterval, totalDuration: TimeInterval) {
        
    }
    
    func bmPlayer(player: BMPlayer, playTimeDidChange currentTime: TimeInterval, totalTime: TimeInterval) {
        
    }
    
    func bmPlayer(player: BMPlayer, playerIsPlaying playing: Bool) {
        
    }
    
    func bmPlayer(player: BMPlayer, playerOrientChanged isFullscreen: Bool) {
        
    }

    @objc func applicationWillEnterForeground() {
    }
    
    @objc func applicationDidEnterBackground() {
        if player.isPlaying {
            player.pause(allowAutoPlay: false)
        }
        if audioPlayer != nil && (audioPlayer?.isPlaying)! {
            audioPlayer?.pause()
        }
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
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: -10),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
    
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
//        bannerView.load(GADRequest())
        let request = GADRequest()
        request.tag(forChildDirectedTreatment: true)
        bannerView.load(request)
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
    
    }
//
//    func showAlert(title : String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
//        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
//        alert.addAction(ok)
//        present(alert, animated: true, completion: nil)
//    }
}
