//
//  AdsHelper.swift
//  learningenglish
//
//  Created by YakovAlexey on 2/21/18.
//  Copyright © 2018 coindevelopment. All rights reserved.
//

import Foundation
import GoogleMobileAds

class AdsHelper: NSObject, GADInterstitialDelegate {
    var interstitial: GADInterstitial
    var adsDisplyed = false
    
    override init() {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-1368614258949399/5997405050")
        
        super.init()
        
        interstitial.delegate = self
        interstitial.load(GADRequest())
    }

    /// Tells the delegate an ad request succeeded.
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("interstitialDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        print("interstitial:didFailToReceiveAdWithError: \(error.localizedDescription)")
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-1368614258949399/5997405050")
        interstitial.delegate = self
        interstitial.load(GADRequest())
    }
    
    /// Tells the delegate that an interstitial will be presented.
    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
        print("interstitialWillPresentScreen")
    }
    
    /// Tells the delegate the interstitial is to be animated off the screen.
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        print("interstitialWillDismissScreen")
    }
    
    /// Tells the delegate the interstitial had been animated off the screen.
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        print("interstitialDidDismissScreen")
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-1368614258949399/5997405050")
        interstitial.delegate = self
        interstitial.load(GADRequest())
    }
    
    /// Tells the delegate that a user click will open another app
    /// (such as the App Store), backgrounding the current app.
    func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
        print("interstitialWillLeaveApplication")
    }
}
