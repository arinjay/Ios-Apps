//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate{
    
    var audioPlayer: AVAudioPlayer!
    var musicArray = ["note1","note2","note3","note4","note5","note6","note7"]
    var currentIndex: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        currentIndex = musicArray[sender.tag - 1]
        playMusic()
        
    }
    
  
    func playMusic(){                           // "currentIndex" which was already a string so getting an error
        let sound = Bundle.main.url(forResource: currentIndex, withExtension: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound!)
            
        } catch {
            print(error)
        }
        audioPlayer.play()
    }

}

