//
//  BackgroundVideo.swift
//  StarWars
//
//  Created by --=_t0tep_=-- on 27/02/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class BackgroundVideo: UIViewController {
    
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackground()
    }
    
    
    func playBackground() {
        
        // Load the video from the app bundle.
        let videoURL: NSURL = NSBundle.mainBundle().URLForResource("bg_vid", withExtension: "mov")!
        
        player = AVPlayer(URL: videoURL)
        player?.actionAtItemEnd = .None
        player?.muted = true
//        player?.volume = 1.0
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        
        playerLayer.frame = view.frame
        
        view.layer.addSublayer(playerLayer)
        
        player?.play()
        
        //loop video
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loopVideo", name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
        
        
        let blurEffect = UIBlurEffect(style: .Light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.frame
        view.addSubview(blurView)
        
    }
    
    func loopVideo() {
        player?.seekToTime(kCMTimeZero)
        player?.play()
    }
    
}
