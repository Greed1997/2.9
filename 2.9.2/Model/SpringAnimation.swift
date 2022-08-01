//
//  SpringAnimation.swift
//  2.9.2
//
//  Created by Александр on 01.08.2022.
//

import Foundation
import Spring

struct RandomAnimation {
   
    let present: String
    let curve: String
    let force: Float
    let duration: Float
    let delay: Float
    
    static func getRandomAnimation() -> RandomAnimation {
        RandomAnimation(
            present: DataManager.shared.animations.randomElement()?.rawValue ?? "slideLeft",
            curve: DataManager.shared.curves.randomElement()?.rawValue ?? "easeIn",
            force: Float.random(in: 0.5...1.5),
            duration: Float.random(in: 0.5...2.5),
            delay: Float.random(in: 0...1))
    }
    
}
