//
//  TaskPushTheButtonController.swift
//  hackathonOne
//
//  Created by Evan Callia on 9/9/16.
//  Copyright © 2016 Evan Callia. All rights reserved.
//

import Foundation

import UIKit

class TaskPushTheButtonController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var homeLabel: UIButton!
    @IBOutlet weak var winLoseLabel: UILabel!
    @IBOutlet weak var numberTimesLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var timerCount = 10
    var times = difficulty[2]
    var nsTimer = NSTimer()
    
    @IBAction func buttonPushed(sender: UIButton) {
        times -= 1
        if times == 0{
            nsTimer.invalidate()
            winLoseLabel.text = "You Win"
            winLoseLabel.hidden = false
            homeLabel.hidden = false
            button.hidden = true
            difficulty[2] += 5
        }
        numberTimesLabel.text = String(times)
    }
    
    
    func updateTime(){
        if timerCount > 0{
            timerCount -= 1
            timerLabel.text = String(timerCount)
        }else{ // they lost
            winLoseLabel.text = "You Lost"
            winLoseLabel.hidden = false
            homeLabel.hidden = false
            button.hidden = true
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        homeLabel.hidden = true
        winLoseLabel.hidden = true
        timerLabel.text = String(timerCount)
        numberTimesLabel.text = String(times)
        nsTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
