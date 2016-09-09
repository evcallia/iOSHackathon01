//
//  ViewController.swift
//  hackathonOne
//
//  Created by Evan Callia on 9/9/16.
//  Copyright © 2016 Evan Callia. All rights reserved.
//

import UIKit

var difficulty = [25,25,25]

class ViewController: UIViewController {
    
    @IBOutlet var starts: [UIButton]!
    
    @IBAction func resetClicked(sender: UIButton) {
        difficulty = [25,25,25]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var ran = arc4random_uniform(UInt32(starts.count))
        for start in starts{
            if start.hidden == false{
                start.hidden = true
                start.setTitle("Start", forState: .Normal)
            }
        }
        starts[Int(ran)].hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

