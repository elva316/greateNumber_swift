//
//  ViewController.swift
//  great number
//
//  Created by elva wang on 10/31/17.
//  Copyright © 2017 elva wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let randomN = Int(arc4random_uniform(UInt32(100)))

    @IBOutlet weak var textInput: UITextField!
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        print(randomN,"xxxxxxxxxxxxx")
        print(textInput, "YYYYYYYYYYYYYYYYY")
        print(randomN == Int(textInput.text!))
        
        if let input = Int(textInput.text!) {
            if input == randomN {
                ShowAlert(title: "Correct", message: "\(String(describing: textInput.text!)) Was correct", BackgroundColor: UIColor.green)
            } else if input > randomN {
                ShowAlert(title: "Incorrect", message: "\(String(describing: textInput.text!)) was too high", BackgroundColor: UIColor.red)
            } else {
                ShowAlert(title: "Incorrect", message: "\(String(describing: textInput.text!)) was too low", BackgroundColor: UIColor.red)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textInput.text = ""
        // Do any additional setup after loading the view, typically from a nib.
        //var someTitle = correctNumber ?? "Correct" : "Wrong"
    }
    
    func ShowAlert(title: String, message: String, BackgroundColor: UIColor) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let subview = alert.view.subviews.first! as UIView
        let alertView = subview.subviews.first! as UIView
        alertView.backgroundColor = BackgroundColor
        
        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

}

