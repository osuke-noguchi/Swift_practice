//
//  SoundViewController.swift
//  SwiftMousouLINE
//
//  Created by 野口央介 on 2019/07/27.
//  Copyright © 2019 Osuke Noguchi. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var imageView2: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
    
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView2.isHidden = true
        
        timeLabel.isHidden = true
        
        if let url = Bundle.main.url(forResource: "callMusic", withExtension: "mp3"){
            do {
            audioPlayer = try AVAudioPlayer
                (contentsOf: url)
                audioPlayer?.play()
            } catch {
                
            audioPlayer = nil
            }
            
            
        } else {
            
        fatalError("url is nil.")
            
        }
   
    }
    
    
    @IBAction func tap(_ sender: AnyObject) {
        imageView2.isHidden = false
        
        timeLabel.isHidden = false
        
        Timer.scheduledTimer(timeInterval: 1.0,
                             target: self, selector: #selector(timercountUp), userInfo: nil, repeats: true)
        
        timeLabel.text = String(count)
        
        playBabySound()
        
    }
    
    func palyBabySound(){
        
        if let url = Bundle.main.url(forResource: "callMusic", withExtension: "mp3"){
            do {
                audioPlayer = try AVAudioPlayer
                (contentsOf: url)
                audioPlayer?.play()
            } catch {
                
                audioPlayer = nil
            }
            
            
        } else {
            
            fatalError("url is nil.")
            
        }
    }
    
    @objc func timercountUp(){
        count = count + 1
    }
    
    @IBAction func deny(_ sender: AnyObject) {
        
        audioPlayer.stop()
      
        dismiss(animated: true, completion: nil)
        
    }
    
 

}
