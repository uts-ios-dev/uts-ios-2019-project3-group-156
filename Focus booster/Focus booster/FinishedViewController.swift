//
//  File.swift
//  Focus booster
//
//  Created by lvino on 23/5/19.
//  Copyright © 2019 Theron Ann. All rights reserved.
//


import UIKit
let score = 25

class FinishedViewController: UIViewController {
    
    @IBOutlet weak var awards: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scoreLabel.text = "\(score)"
        
        if(score <= 10){
            awards.image = UIImage(named:"zero")
        }else if (score <= 20){
            awards.image = UIImage(named:"one")
        }else if (score <= 40){
            awards.image = UIImage(named:"two")
        }else if (score <= 70){
            awards.image = UIImage(named:"three")
        }else if (score <= 110){
            awards.image = UIImage(named:"four")
        }else if (score > 110){
            awards.image = UIImage(named:"five")
        }
       
    }
    
    @IBAction func taskLabelButton(_ sender: Any) {
        
    
        
    }
}
