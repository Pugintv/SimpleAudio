//
//  ViewController.swift
//  SimpleAudio
//
//  Created by Victor Rosas on 10/12/18.
//  Copyright © 2018 Victor Rosas. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        do{
            audioPlayer = try AVAudioPlayer(contentsOf:URL.init(fileURLWithPath:Bundle.main.path(forResource: "sample", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            
            //For Background play
            var audioSession = AVAudioSession.sharedInstance()
            
            do{
            try audioSession.setCategory(.playback, mode: .default, options: [])
            }catch{
                
            }
            
        }catch{
            print(error)
        }
        
    }
    
    @IBAction func pause(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.stop()
        }else{
            
        }
    }
    
    @IBAction func play(_ sender: Any) {
        audioPlayer.play()
    }
    
    
    @IBAction func restart(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.currentTime = 0
            audioPlayer.play()
        }else{
            audioPlayer.play()
        }
    }
    
    
}

