//
//  TaskWordPuzzleController.swift
//  hackathonOne
//
//  Created by Evan Callia on 9/9/16.
//  Copyright © 2016 Evan Callia. All rights reserved.
//

import Foundation

import UIKit

class TaskWordPuzzleController: UIViewController {
    
    var timerCount = difficulty[1]
    let wordList = ["hello", "mouse", "puzzle", "butt", "hair", "onyx", "fluke", "railroad", "dojo", "program", "bubble", "supercalifragilisticexpialidocious", "southwest", "jump"]
    var scrambledWord = ""
    var word = String()
    var nsTimer = NSTimer()
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var homeLabel: UIButton!
    @IBOutlet weak var winLoseLabel: UILabel!
    @IBOutlet weak var scrambledWordLabel: UILabel!
    
    @IBAction func userInput(sender: UITextField) {
        if sender.text == word{ //They guessed it!
            nsTimer.invalidate()
            winLoseLabel.text = "You Won"
            winLoseLabel.hidden = false
            homeLabel.hidden = false
            difficulty[1] -= 3
            if difficulty[1] <= 3{
                difficulty[1] = 3
            }
        }
    }
    
    func selectWord(){
        var ran = arc4random_uniform(UInt32(wordList.count))
        word = wordList[Int(ran)]
        var wordCharacters = word.characters.map { String($0) }
        for i in 0..<wordCharacters.count{
            ran = arc4random_uniform(UInt32(wordCharacters.count))
            let temp = wordCharacters[i]
            wordCharacters[i] = wordCharacters[Int(ran)]
            wordCharacters[Int(ran)] = temp
        }
        scrambledWord = String()
        for i in 0..<wordCharacters.count{
            scrambledWord += wordCharacters[i]
        }
        scrambledWordLabel.text = scrambledWord
    }
    
    func updateTime(){
        if timerCount > 0{
            timerCount -= 1
            timerLabel.text = String(timerCount)
        }else{ // they lost
            winLoseLabel.text = "You Lost"
            winLoseLabel.hidden = false
            homeLabel.hidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        homeLabel.hidden = true
        winLoseLabel.hidden = true
        timerLabel.text = String(timerCount)
        selectWord()
        nsTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

