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
            firstImage.image = UIImage(named:"zero")
            secondImage.image = UIImage(named:"unknow")
            trdImage.image = UIImage(named:"unknow")
            forthImage.image = UIImage(named:"unknow")
            fifthImage.image = UIImage(named:"unknow")
            sixthImage.image = UIImage(named:"unknow")
        }else if (score <= 20){
            firstImage.image = UIImage(named:"zero")
            secondImage.image = UIImage(named:"one")
            trdImage.image = UIImage(named:"unknow")
            forthImage.image = UIImage(named:"unknow")
            fifthImage.image = UIImage(named:"unknow")
            sixthImage.image = UIImage(named:"unknow")
        }else if (score <= 40){
            firstImage.image = UIImage(named:"zero")
            secondImage.image = UIImage(named:"one")
            trdImage.image = UIImage(named:"two")
            forthImage.image = UIImage(named:"unknow")
            fifthImage.image = UIImage(named:"unknow")
            sixthImage.image = UIImage(named:"unknow")
        }else if (score <= 70){
            firstImage.image = UIImage(named:"zero")
            secondImage.image = UIImage(named:"one")
            trdImage.image = UIImage(named:"two")
            forthImage.image = UIImage(named:"three")
            fifthImage.image = UIImage(named:"unknow")
            sixthImage.image = UIImage(named:"unknow")
        }else if (score <= 110){
            firstImage.image = UIImage(named:"zero")
            secondImage.image = UIImage(named:"one")
            trdImage.image = UIImage(named:"two")
            forthImage.image = UIImage(named:"three")
            fifthImage.image = UIImage(named:"four")
            sixthImage.image = UIImage(named:"unknow")
        }else if (score > 110){
            firstImage.image = UIImage(named:"zero")
            secondImage.image = UIImage(named:"one")
            trdImage.image = UIImage(named:"two")
            forthImage.image = UIImage(named:"three")
            fifthImage.image = UIImage(named:"four")
            sixthImage.image = UIImage(named:"five")
        }
                }
            }
        }
    )
}
        // Do any additional setup after loading the view.
}

