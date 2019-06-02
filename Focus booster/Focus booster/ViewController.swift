//
//  ViewController.swift
//  Focus booster
//
//  Created by Theron Ann on 22/5/19.
//  Copyright © 2019 Theron Ann. All rights reserved.
//

import UIKit
var defaults:UserDefaults?
var saveNameFromDefaults:String?

class ViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var inputTag: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func handleButtonClick(_ sender: Any) {
        defaults = UserDefaults.standard
        self.labelName.text = inputTag.text;
        if (labelName.text != "") {
            defaults!.set(labelName.text,forKey: "Tag")
            //detect if the "currentName" is invalid
            if (defaults!.object(forKey: "Tag") != nil) {
                saveNameFromDefaults = defaults!.object(forKey: "Tag") as? String
                UserDefaults.standard.set(saveNameFromDefaults, forKey: "currentTag")
            } else {
                saveNameFromDefaults = "default"
                UserDefaults.standard.set(saveNameFromDefaults, forKey: "currentTag")
            }
    }
    
}

}
