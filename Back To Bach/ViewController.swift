//
//  ViewController.swift
//  Back To Bach
//
//  Created by Jorge Gallardo on 8/7/15.
//  Copyright © 2015 Jorge Gallardo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var scrubSlider: UISlider!
    var player: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!))
                scrubSlider.maximumValue = Float(player.duration)
        } catch {
            // it didn't work
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateScrubSlider"), userInfo: nil, repeats: true)
    }

    @IBAction func adjustVolume(sender: AnyObject) {
        player.volume = volumeSlider.value
    }

    @IBAction func scrub(sender: AnyObject) {
        player.currentTime = NSTimeInterval(scrubSlider.value)
    }
    
    func updateScrubSlider() {
        scrubSlider.value = Float(player.currentTime)
    }
    
    @IBAction func play(sender: AnyObject) {
        player.volume = volumeSlider.value
        player.play()
    }

    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    
    @IBAction func stop(sender: AnyObject) {
        player.pause()
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!))
        } catch {
            // it didn't work
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}