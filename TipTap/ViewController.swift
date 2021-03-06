//
//  ViewController.swift
//  TipTap
//
//  Created by Ashish Nagavaram on 9/6/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var finalAmountLabel: UILabel!
    @IBOutlet weak var tipSegmentControll: UISegmentedControl!
    @IBOutlet weak var customTipPercentage: UITextField!
    
    @IBOutlet weak var perPersonAmount: UILabel!
    @IBOutlet var tapGestureListener: UITapGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
         var defaults = NSUserDefaults.standardUserDefaults()
         tipSegmentControll.selectedSegmentIndex = defaults.integerForKey("selectedIndex")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
       var defaults = NSUserDefaults.standardUserDefaults()
       tipSegmentControll.selectedSegmentIndex = defaults.integerForKey("selectedIndex")
        calculateTip()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateTip(){
        var billAmount = NSString(string: billTextField.text).doubleValue;
        var tip :Double = 0
        switch tipSegmentControll.selectedSegmentIndex{
        case 0:
            tip = 10
            break
        case 1:
            tip = 15
            break
        case 2:
            tip = 20
            break
        default:
            break
        }
        
        tipAmountLabel.text = "$ \((billAmount * tip / 100))"
        
        var finalAmount = billAmount + (billAmount * tip / 100)
        
        finalAmountLabel.text = "$ "+"\(finalAmount)";
        
        var numPersons = NSString(string: customTipPercentage.text).doubleValue
        if numPersons==0 {
            perPersonAmount.text = "$ "+"0"
            return
        }
        
        perPersonAmount.text = "$ "+"\(finalAmount/numPersons)"
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        calculateTip();
        view.endEditing(true);
    }
    
    @IBAction func billAmountChanged(sender: AnyObject) {
        calculateTip()
    }

    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        calculateTip();
    }
    
    @IBAction func numPersonsChanged(sender: AnyObject) {
        
        calculateTip()
    }
    
    
    

}

