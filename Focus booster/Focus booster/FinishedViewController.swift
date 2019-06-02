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

        var totalScore = 0
        FireBaseManager.shares.getGameTime(completion: { (data) in
            for result in data{
                if (result["score"] != nil){
                    
                    let score = result["score"] as! Int
                    //self.scoreLabel.text = "\(score)"
                    totalScore += score
                    
                   
                
                }
            }
            
            if(totalScore <= 10){
                self.awards.image = UIImage(named:"zero")
            }else if (totalScore <= 20){
                self.awards.image = UIImage(named:"one")
            }else if (totalScore <= 40){
                self.awards.image = UIImage(named:"two")
            }else if (totalScore <= 70){
                self.awards.image = UIImage(named:"three")
            }else if (totalScore <= 110){
                self.awards.image = UIImage(named:"four")
            }else if (totalScore > 110){
                self.awards.image = UIImage(named:"five")
            }
            
            self.scoreLabel.text = "\(totalScore)"
        })
        
        
       
    }
    
    @IBAction func taskLabelButton(_ sender: Any) {
        
    
        
    }
}
