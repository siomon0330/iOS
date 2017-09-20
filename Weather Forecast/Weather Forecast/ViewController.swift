//
//  ViewController.swift
//  Weather Forecast
//
//  Created by Simon on 8/8/17.
//  Copyright © 2017 Simon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func submit(_ sender: Any) {
        
        print("jinlai")
        var message = ""

        
        let inputMessage = input.text!.replacingOccurrences(of: " ", with: "-")
        
        if let url = URL(string: "http://www.weather-forecast.com/locations/"+inputMessage+"/forecasts/latest"){
            
            let request = NSMutableURLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request as URLRequest){
            
                data, response, error in
                
                if error != nil{
                    
                    print("error")
                
                    print(error!)
                }else{
                    
                    if let unwarppedData = data{
                    
                        let dataString = NSString(data: unwarppedData, encoding: String.Encoding.utf8.rawValue)
                        
                        if let webContent = dataString?.components(separatedBy: "Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"){
                        
                            if(webContent.count > 1){
                            
                               let newWebContent = webContent[1].components(separatedBy: "</span></span></span>")
                                
                                    if newWebContent.count > 1{
                                        
                                    
                                        message = newWebContent[0].replacingOccurrences(of: "&deg;", with:"°" )
                                        print("dsfaf"+message)
                                    
                                    }
                            }
                        }
                    }
                }
                if message == ""{
                    message = "Sorry, the weather cant't be found from the place you have entered, please try again"
                    
                }
                
                
                DispatchQueue.main.sync(execute:{
                    
                    
                    self.output.text = message
                }
                    
                )
                
            }
            
           
            
            task.resume()
            
        
        }else{
        
            message = "Sorry, the weather cant't be found from the place you have entered, please try again"

        
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

