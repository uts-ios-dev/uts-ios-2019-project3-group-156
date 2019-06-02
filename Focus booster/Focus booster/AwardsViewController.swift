//
//  AwardsViewController.swift
//  Focus booster
//
//  Created by Theron Ann on 1/6/19.
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
     let score = 0
        
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
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
