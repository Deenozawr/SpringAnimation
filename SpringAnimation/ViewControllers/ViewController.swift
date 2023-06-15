//
//  ViewController.swift
//  SpringAnimation
//
//  Created by Денис on 14/06/2023.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    @IBOutlet var animationView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    let animation = Animation.createRandomAnimation()
    var currentIndex = 0
    
        override func viewDidLoad() {
            presetLabel.text = animation.presets[currentIndex]
            curveLabel.text = animation.curves[currentIndex]
            forceLabel.text = String(animation.force[currentIndex].rounded())
            delayLabel.text = String(animation.delay[currentIndex].rounded())
            durationLabel.text = String(animation.duration[currentIndex].rounded())
        }
    
    
    
    
    @IBAction func startSpringAnimation(_ sender: UIButton) {
        guard currentIndex < animation.presets.count else {
            return
        }
        
        let currentPreset = animation.presets[currentIndex]
        let currentCurve = animation.curves[currentIndex]
        let currentForce = String(format: "%.1f", animation.force[currentIndex])
        let currentDuration = String(format: "%.1f", animation.duration[currentIndex])
        let currentDelay = String(format: "%.1f", animation.delay[currentIndex])
        
        presetLabel.text = currentPreset
        curveLabel.text = currentCurve
        forceLabel.text = currentForce
        durationLabel.text = currentDuration
        delayLabel.text = currentDelay
        
        let nextIndex = currentIndex + 1
            if nextIndex < animation.presets.count {
                let nextPreset = animation.presets[nextIndex]
                sender.setTitle("Run \(nextPreset)", for: .normal)
            }
        
        currentIndex += 1
        
        animationView.animation = currentPreset
        animationView.curve = currentCurve
        animationView.force = CGFloat(Float(currentForce) ?? 0)
        animationView.duration = CGFloat(Float(currentDuration) ?? 0)
        animationView.delay = CGFloat(Float(currentDelay) ?? 0)
        animationView.animate()
    }
}



