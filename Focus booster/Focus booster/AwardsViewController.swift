//
//  AwardsViewController.swift
//  Focus booster
//
//  Created by Theron Ann on 2/6/19.
//  Copyright © 2019 Theron Ann. All rights reserved.
//

import UIKit

class AwardsViewController: UIViewController {
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var trdImage: UIImageView!
    
    @IBOutlet weak var forthImage: UIImageView!
    
    @IBOutlet weak var fifthImage: UIImageView!
    @IBOutlet weak var sixthImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FireBaseManager.shares.getGameTime(completion: { (data) in
            for result in data{
                let score = result["score"] as! Int
                
                if (score != nil){

        if(score <= 10){
            self.firstImage.image = UIImage(named:"zero")
            self.secondImage.image = UIImage(named:"unknow")
            self.trdImage.image = UIImage(named:"unknow")
            self.forthImage.image = UIImage(named:"unknow")
            self.fifthImage.image = UIImage(named:"unknow")
            self.sixthImage.image = UIImage(named:"unknow")
        }else if (score <= 20){
            self.firstImage.image = UIImage(named:"zero")
            self.secondImage.image = UIImage(named:"one")
            self.trdImage.image = UIImage(named:"unknow")
            self.forthImage.image = UIImage(named:"unknow")
            self.fifthImage.image = UIImage(named:"unknow")
            self.sixthImage.image = UIImage(named:"unknow")
        }else if (score <= 40){
            self.firstImage.image = UIImage(named:"zero")
            self.secondImage.image = UIImage(named:"one")
            self.trdImage.image = UIImage(named:"two")
            self.forthImage.image = UIImage(named:"unknow")
            self.fifthImage.image = UIImage(named:"unknow")
            self.sixthImage.image = UIImage(named:"unknow")
        }else if (score <= 70){
            self.firstImage.image = UIImage(named:"zero")
            self.secondImage.image = UIImage(named:"one")
            self.trdImage.image = UIImage(named:"two")
            self.forthImage.image = UIImage(named:"three")
            self.fifthImage.image = UIImage(named:"unknow")
            self.sixthImage.image = UIImage(named:"unknow")
        }else if (score <= 110){
            self.firstImage.image = UIImage(named:"zero")
            self.secondImage.image = UIImage(named:"one")
            self.trdImage.image = UIImage(named:"two")
            self.forthImage.image = UIImage(named:"three")
            self.fifthImage.image = UIImage(named:"four")
            self.sixthImage.image = UIImage(named:"unknow")
        }else if (score > 110){
            self.firstImage.image = UIImage(named:"zero")
            self.secondImage.image = UIImage(named:"one")
            self.trdImage.image = UIImage(named:"two")
            self.forthImage.image = UIImage(named:"three")
            self.fifthImage.image = UIImage(named:"four")
            self.sixthImage.image = UIImage(named:"five")
        }
                }
            }
        }
    )
}
        // Do any additional setup after loading the view.
}

