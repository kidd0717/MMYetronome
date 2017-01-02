//
//  MMYetronome.swift
//  MMYetronome
//
//  Created by PaoYo Ding on 2017/1/2.
//  Copyright © 2017年 PeoYao Ding. All rights reserved.
//

import UIKit
import AudioKit

class MMYetronome: NSObject {
    
    public var frequence : Double = 60.0 {
        didSet {
            generator?.parameters[0] = frequence
        }
    }
    private var generator : AKOperationGenerator?

    override init() {
        generator = AKOperationGenerator() { parameters in
            
            let metronome = AKOperation.metronome(frequency: parameters[0] / 60)
            
            let count = metronome.count(maximum: 4, looping: true)
            
            let beep = AKOperation.sineWave(frequency: 480 * (2 - (count / 4 + 0.49).round()))
            
            let beeps = beep.triggeredWithEnvelope(
                trigger: metronome,
                attack: 0.01, hold: 0, release: 0.05)
            return beeps
        }
        
        generator?.parameters = [frequence]
        AudioKit.output = generator
        AudioKit.start()
    }
    
    func start() {
        generator?.start()
    }
    
    func stop() {
        generator?.stop()
    }
}
