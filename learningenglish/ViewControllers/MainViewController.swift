//
//  MainViewController.swift
//  learningenglish
//
//  Created by YakovAlexey on 1/5/18.
//  Copyright © 2018 coindevelopment. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {

    @IBOutlet weak var ivPolicy: UIImageView!
    
    static var adsHelper : AdsHelper?
    static var adsShowFlag = false;
    
    var audioPlayer : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if MainViewController.adsHelper == nil {
            MainViewController.adsHelper = AdsHelper()
        }
        
        if UserDefaults.standard.bool(forKey: "FirstTimeOpened") {
            ivPolicy.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onAgreePolicy(_ sender: UITapGestureRecognizer) {
        ivPolicy.isHidden = true
        UserDefaults.standard.set(true, forKey: "FirstTimeOpened")
    }
    
    @IBAction func onBack(_ sender: Any) {
        Darwin.exit(0)
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
