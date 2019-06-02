//
//  File.swift
//  Focus booster
//
//  Created by lvino on 23/5/19.
//  Copyright © 2019 Theron Ann. All rights reserved.
//


import UIKit


class FinishedViewController: UIViewController {
    
    @IBOutlet weak var awards: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FireBaseManager.shares.getGameTime(completion: { (data) in
            for result in data{
                if (result["score"] != nil){
                    
                    let score = result["score"] as! Int
                    self.scoreLabel.text = "\(score)"
                    
                    
                    if(score <= 10){
                        self.awards.image = UIImage(named:"zero")
                    }else if (score <= 20){
                        self.awards.image = UIImage(named:"one")
                    }else if (score <= 40){
                        self.awards.image = UIImage(named:"two")
                    }else if (score <= 70){
                        self.awards.image = UIImage(named:"three")
                    }else if (score <= 110){
                        self.awards.image = UIImage(named:"four")
                    }else if (score > 110){
                        self.awards.image = UIImage(named:"five")
                    }
                
            }
            }
        })
        
        
       
    }
    
    @IBAction func taskLabelButton(_ sender: Any) {
        
    
        
    }
}
