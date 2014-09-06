//
//  SettingsViewController.swift
//  TipTap
//
//  Created by Ashish Nagavaram on 9/6/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var segmentedControll: UISegmentedControl!
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        var defaults = NSUserDefaults.standardUserDefaults()
        
        segmentedControll.selectedSegmentIndex = defaults.integerForKey("selectedIndex")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(segmentedControll.selectedSegmentIndex, forKey: "selectedIndex")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSaveClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
