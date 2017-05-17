//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Stefano Pernat on 17/05/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    let speechSynthesizer = NSSpeechSynthesizer()
    
    @IBOutlet var textView: NSTextView!
    @IBOutlet var speakButton: NSButton!
    @IBOutlet var stopButton: NSButton!
    @IBOutlet var wordsVoiceHasToSpeak: NSProgressIndicator!
    
    var contents: String? {
        get {
            return textView.string
        }
        
        set {
            textView.string = newValue
        }
    }
    
    let defaultText = "Non so cosa dire"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialUIState()
        wordsVoiceHasToSpeak.isHidden = true
        self.speechSynthesizer.delegate = self
        
    }
    
    private func setInitialUIState() {
        speakButton.isEnabled = true
        stopButton.isEnabled = false
    }
    
    fileprivate func toggleUIButtonsState() {
        speakButton.isEnabled = !speakButton.isEnabled
        stopButton.isEnabled = !stopButton.isEnabled
    }
    
    fileprivate func setWordsToSpeak() {
        wordsVoiceHasToSpeak.minValue = 0
        
        if let speachText = contents, speachText.isEmpty {
            wordsVoiceHasToSpeak.maxValue = Double(speachText.characters.count)
        } else {
            wordsVoiceHasToSpeak.maxValue = Double(defaultText.characters.count)
        }
    }
    
    @IBAction func speakButtonClicked(_ sender: NSButton) {
        wordsVoiceHasToSpeak.isHidden = false
        toggleUIButtonsState()
        setWordsToSpeak()
        if let contents = textView.string, !contents.isEmpty {
            speechSynthesizer.startSpeaking(contents)
        } else {
            speechSynthesizer.startSpeaking(defaultText)
        }
    }
    
    @IBAction func stopButtonClicked(_ sender: NSButton) {
        if speechSynthesizer.isSpeaking {
            //toggleUIButtonsState()
            speechSynthesizer.stopSpeaking()
        }
    }
}

extension ViewController: NSSpeechSynthesizerDelegate {
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        toggleUIButtonsState()
    }
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, willSpeakWord: NSRange, of: String) {
        wordsVoiceHasToSpeak.increment(by: Double(willSpeakWord.length))
    }
        
}
