//
//  SpeechDelegate.swift
//  Scrying Mirror
//
//  Created by Sam Kronick on 2/6/16.
//  Copyright © 2016 Disk Cactus. All rights reserved.
//

import Foundation
import AVFoundation


class SpeechDelegate : NSObject, AVSpeechSynthesizerDelegate {
    var isSpeaking = false
    
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didFinishSpeechUtterance utterance: AVSpeechUtterance) {
        self.isSpeaking = false
    }
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didStartSpeechUtterance utterance: AVSpeechUtterance) {
        self.isSpeaking = true
    }
}