//
//  Speech.swift
//  Dictionary
//
//  Created by admin on 05/10/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import UIKit
import AVFoundation

class Speech {
    class func speechAWord(_ text:String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
}
