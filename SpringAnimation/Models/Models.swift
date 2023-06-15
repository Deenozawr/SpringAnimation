//
//  Models.swift
//  SpringAnimationApp
//
//  Created by Денис on 14/06/2023.
//

struct Animation {
    let presets: [String]
    let curves: [String]
    var force: [Float]
    var duration: [Float]
    var delay: [Float]
    
}

extension Animation {
    static func createRandomAnimation() -> Animation {
        var animation = Animation(
            presets: DataStore.shared.presets.shuffled(),
            curves: DataStore.shared.curves.shuffled(),
            force: [],
            duration: [],
            delay: []
        )
        
        let iterationCount = min(
            animation.presets.count,
            animation.curves.count
        )
        
        for _ in 0..<iterationCount {
            let randomForceValue = Float.random(in: 1...3)
            let randomDurationValue = Float.random(in: 1...3)
            let randomDelayValue = Float.random(in: 0.1...1)
            
            animation.force.append(randomForceValue)
            animation.duration.append(randomDurationValue)
            animation.delay.append(randomDelayValue)
        }
        
        return animation
    }
}
