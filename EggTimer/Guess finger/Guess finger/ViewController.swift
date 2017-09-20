//
//  ViewController.swift
//  Guess finger
//
//  Created by Simon on 8/7/17.
//  Copyright © 2017 Simon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var guess: UILabel!
    
   
    @IBOutlet weak var answer: UITextField!
    
    
    @IBAction func tap(_ sender: Any) {
        
        let guessNumber = answer.text
        let randomNumber = String(arc4random_uniform(6))
        if guessNumber == randomNumber{
            guess.text = "Your are right!"
        }else{
            guess.text = "Sorry, it is \(randomNumber)"
        }
        
        
        
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

