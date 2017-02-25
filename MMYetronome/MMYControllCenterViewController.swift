//
//  MMYControllCenterViewController.swift
//  MMYetronome
//
//  Created by PaoYo Ding on 2017/1/2.
//  Copyright © 2017年 PeoYao Ding. All rights reserved.
//

import UIKit
import SWRevealViewController

class MMYControllCenterViewController: UIViewController {
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var frequencySlider: UISlider!
    @IBOutlet weak var startButton: UIButton!
    private var metronome : MMYetronome?
    private var isStart = false
    private var isSetlistShow = false
// MARK: - Life Cycle
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

    
// MARK: - Action
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
    @IBAction func setlistDidPress(_ sender: UIBarButtonItem) {
        self.revealViewController()!.rightRevealToggle(animated: true)
    }
}

