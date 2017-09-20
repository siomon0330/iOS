//
//  ViewController.swift
//  EggTimer
//
//  Created by Simon on 8/7/17.
//  Copyright © 2017 Simon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UITextField!
    var time = 210
    var timer = Timer()
    
    func updateTimer(){
    
        if time > 0{
          time -= 1
          result.text = String(time)
         
        }
    
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func play(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        
    }
    @IBAction func minusTen(_ sender: Any) {
        if time > 10{
          time -= 10
          result.text = String(time)
        }
    }
    
    @IBAction func plusTen(_ sender: Any) {
        time += 10
        result.text = String(time)
    }
    
    @IBAction func restart(_ sender: Any) {
        time = 210
        result.text = String(time)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

