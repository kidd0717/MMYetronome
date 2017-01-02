//
//  ViewController.swift
//  MMYetronome
//
//  Created by PaoYo Ding on 2017/1/2.
//  Copyright © 2017年 PeoYao Ding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var frequencySlider: UISlider!
    @IBOutlet weak var startButton: UIButton!
    var metronome : MMYetronome?
    var isStart = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        metronome = MMYetronome()
        metronome?.frequence = Double(frequencySlider.value)
        frequencyLabel.text = String(format: "%.0f BPM", frequencySlider.value)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderValueDidChange(_ sender: UISlider) {
        metronome?.frequence = Double(sender.value)
        frequencyLabel.text = String(format: "%.0f BPM", frequencySlider.value)
    }
    
    @IBAction func startButtonDidPress(_ sender: UIButton) {
        if !isStart {
            isStart = true
            sender.setTitle("Stop", for: .normal)
            metronome?.start()
        } else {
            isStart = false
            sender.setTitle("Start", for: .normal)
            metronome?.stop()
        }
    }
}

