//
//  TaskGridColorsController.swift
//  hackathonOne
//
//  Created by Evan Callia on 9/9/16.
//  Copyright © 2016 Evan Callia. All rights reserved.
//

import Foundation

import UIKit

class TaskGridColorsController: UIViewController {
    
    var timerCount = difficulty[0]
    var color = UIColor()
    var colorCount = 0
    var nsTimer = NSTimer()
    
    @IBOutlet var gridButtons: [UIButton]!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var winLoseLabel: UILabel!
    @IBOutlet weak var homeLabel: UIButton!
    
    @IBAction func colorClicked(sender: UIButton) {
        if sender.backgroundColor == color{
            colorCount -= 1
            sender.enabled = false
            sender.alpha = 0.4
            if colorCount == 0{ //person won
                nsTimer.invalidate()
                winLoseLabel.text = "You Won!"
                winLoseLabel.hidden = false
                homeLabel.hidden = false
                difficulty[0] -= 3
                if difficulty[0] <= 3{
                    difficulty[0] = 3
                }
            }
        }else{//Person Lost!!
            nsTimer.invalidate()
            winLoseLabel.text = "You Lost!"
            winLoseLabel.hidden = false
            homeLabel.hidden = false
        }
    }
    
    func createBoard(){
        var runAgain = true
        for square in gridButtons{
            let ran = arc4random_uniform(5)
            if ran == 0{
                if UIColor.redColor() == color{
                    runAgain = false
                }
                square.backgroundColor = UIColor.redColor()
                if color == UIColor.redColor(){
                    colorCount += 1
                }
            }else if ran == 1{
                if UIColor.greenColor() == color{
                    runAgain = false
                }
                square.backgroundColor = UIColor.greenColor()
                if color == UIColor.greenColor(){
                    colorCount += 1
                }
            }else if ran == 2{
                if UIColor.blueColor() == color{
                    runAgain = false
                }
                square.backgroundColor = UIColor.blueColor()
                if color == UIColor.blueColor(){
                    colorCount += 1
                }
            }else if ran == 3{
                if UIColor.yellowColor() == color{
                    runAgain = false
                }
                square.backgroundColor = UIColor.yellowColor()
                if color == UIColor.yellowColor(){
                    colorCount += 1
                }
            }else if ran == 4{
                if UIColor.grayColor() == color{
                    runAgain = false
                }
                square.backgroundColor = UIColor.grayColor()
                if color == UIColor.grayColor(){
                    colorCount += 1
                }
            }
        }
        if runAgain{
            createBoard()
        }
    }
    
    func selectColor(){
        let ran = arc4random_uniform(5)
        if ran == 0{
            color = UIColor.redColor()
            colorLabel.text = "Tap all of this color: red"
        }else if ran == 1{
            color = UIColor.greenColor()
            colorLabel.text = "Tap all of this color: green"
        }else if ran == 2{
            color = UIColor.blueColor()
            colorLabel.text = "Tap all of this color: blue"
        }else if ran == 3{
            color = UIColor.yellowColor()
            colorLabel.text = "Tap all of this color: yellow"
        }else if ran == 4{
            color = UIColor.grayColor()
            colorLabel.text = "Tap all of this color: gray"
        }else{
        }
    }
    
    func updateTime(){
        if timerCount > 0{
            timerCount -= 1
            timeLabel.text = String(timerCount)
        }else{ // they lost
            winLoseLabel.text = "You Lost"
            winLoseLabel.hidden = false
            homeLabel.hidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        selectColor()
        createBoard()
        homeLabel.hidden = true
        winLoseLabel.hidden = true
        timeLabel.text = String(timerCount)
         nsTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

