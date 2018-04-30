//
//  LevelSelectionViewController.swift
//  learningenglish
//
//  Created by YakovAlexey on 1/8/18.
//  Copyright © 2018 coindevelopment. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds
//import HYParentalGate

class LevelSelectionViewController: UIViewController {

    static var level = 0
    var audioPlayer : AVAudioPlayer?
    
    var gateShowed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MainViewController.adsShowFlag = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        if gateShowed == false {
//            MainViewController.adsShowFlag = false
//            let parentalGate = HYParentalGate.sharedGate
//            parentalGate.show(successHandler: {
//                // Code was entered correctly. Handle this properly.
//                MainViewController.adsShowFlag = true
//                if (MainViewController.adsHelper?.interstitial.isReady)! {
//                    MainViewController.adsHelper?.interstitial.present(fromRootViewController: self)
//                    MainViewController.adsHelper?.adsDisplyed = true
//                }
//            })
//        }
//
//        gateShowed = true
        if MainViewController.adsShowFlag == false && (MainViewController.adsHelper?.interstitial.isReady)! {
            MainViewController.adsHelper?.interstitial.present(fromRootViewController: self)
            MainViewController.adsHelper?.adsDisplyed = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSelectLevel(_ sender: UIButton) {
        LevelSelectionViewController.level = sender.tag
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "play")
        present(viewController, animated: false, completion: nil)
    }
    
    @IBAction func onBack(_ sender: Any) {
        MainViewController.adsHelper?.adsDisplyed = false
        MainViewController.adsShowFlag = false
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
