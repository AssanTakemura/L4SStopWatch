//
//  ViewController.swift
//  L4SStopWatch
//
//  Created by 竹村明日香 on 2020/09/03.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var hanteilabel: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        if count <= 10.20, count >= 9.80{
            hanteilabel.text = "PERFECT"
        }else if count <= 10.30, count >= 9.70{
            hanteilabel.text = "GREAT"
        }else if count <= 10.50, count >= 9.50{
            hanteilabel.text = "GOOD"
        }else {
            hanteilabel.text = "BAD"
        }
    }


    @IBAction func start(){
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
        }
        
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
            self.hantei()
        }
    }
}

