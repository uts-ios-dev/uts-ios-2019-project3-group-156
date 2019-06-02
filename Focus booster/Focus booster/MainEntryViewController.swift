//
//  MainEntryViewController.swift
//  Focus booster
//
//  Created by lvino on 23/5/19.
//  Copyright © 2019 Theron Ann. All rights reserved.
//



import UIKit
import JOCircularSlider

class MainEntryViewController: UIViewController {
    public static let fontName = "ChalkboardSE-Bold"
    @IBOutlet weak var beginBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var giveUpBtn: UIButton!
    @IBOutlet weak var sentenceLabel: UILabel!
    
    var tag : String = "Working"
    var circularSlider : CircularSlider?
    var timer : Timer?
    var timerSentence : Timer?
    var timeRemaining = 0  // seconds
    var timeSetted = 0 // mins
    var score = 0 {
        didSet{
            //setSentence()
        }
    }
    
    var sentences = ["Don't give up!",
                     "Focus! Focus!",
                     "Almost done!",
                     "Don't play your phone!",
                     "Take time to finish your work!",
                     "Don't Look at me!",
                     "Drop your cell phone!",
                     "Drop your cell phone now!"
                     ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupUI()
        
        // set tag
        let currentTag = UserDefaults.standard.object(forKey: "currentTag")
        if(currentTag != nil){
            self.tag = String(describing: currentTag!)
        }
        
        
    }
    
    func setupUI(){
        
        self.giveUpBtn.isEnabled = false
        self.giveUpBtn.isHidden = true
       
        
        // set color
        self.view.backgroundColor = UIColor.gray
        self.timeLabel.textColor = UIColor.white
        self.timeLabel.font = UIFont(name: MainEntryViewController.fontName , size: 30)
        self.sentenceLabel.font = UIFont(name: MainEntryViewController.fontName , size: 20)
        self.sentenceLabel.textColor = UIColor.white
        
        // set position
        self.sentenceLabel.frame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: 40)
        self.timeLabel.frame = CGRect(x: 0, y: 510, width: self.view.frame.width, height: 30)
        self.beginBtn.titleLabel?.font =  UIFont(name: MainEntryViewController.fontName , size: 20)
        self.beginBtn.setTitleColor(UIColor.black, for: .normal)
        self.giveUpBtn.titleLabel?.font =  UIFont(name: MainEntryViewController.fontName , size: 20)
        self.giveUpBtn.setTitleColor(UIColor.black, for: .normal)
        
        // set slider
        let sliderFrame = CGRect(x: 0, y:100, width: self.view.frame.width, height: 400)
        circularSlider = CircularSlider(frame: sliderFrame)
        if let circularSlider = circularSlider{
            circularSlider.startAngle = 230
            circularSlider.endAngle = 310
            circularSlider.minimumValue = 0
            circularSlider.maximumValue = 120
            circularSlider.isClockwise = false
            circularSlider.color2 = UIColor.blue
            circularSlider.color3 = UIColor.black
      
          
            
            circularSlider.backgroundColor = UIColor.gray
            self.view.addSubview(circularSlider)
        }
        
    }

    
    func setTimer(){
        if (timer == nil){
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        }
        
        if (timerSentence == nil){
            timerSentence = Timer.scheduledTimer(timeInterval: 15.0, target: self, selector: #selector(setSentence), userInfo: nil, repeats: true)
            
            setSentence()
        }
        
    }
    
    // change time label text
    @objc func timerFunc(){
        
        // check if is end
        if(timeRemaining == 0){
            self.score += 1
            timer?.invalidate()
            timer = nil
            
            timerSentence?.invalidate()
            timerSentence = nil
            
            alertFinish()
            return
        }
        
        // count down
        timeRemaining -= 1
        let minutesLeft = Int(timeRemaining) / 60 % 60
        let secondsLeft = Int(timeRemaining) % 60
        let minStr = String(format: "%.2d", minutesLeft)
        let secStr = String(format: "%.2d", secondsLeft)
        timeLabel.text = "\(minStr):\(secStr)"
        
        // score
        self.score = timeSetted - minutesLeft - 1
        circularSlider?.setLabelText("Your socre:\n \(score)")
        circularSlider?.setLabelFont(named: MainEntryViewController.fontName , textColor: UIColor.black, multiplier: 1.0)
        
    }
    
    @objc func setSentence() {
        if self.sentences.isEmpty { return }
        let index = Int(arc4random_uniform(UInt32(self.sentences.count)))
        let sentence = self.sentences[index]
        
        self.sentenceLabel.text = sentence
        
    }
    
    func checkBeginTime() -> Bool{
        
        if(self.timeRemaining < 60){
            
            let alert = UIAlertController(title: "Time should be more than 1 min", message: nil, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            present(alert, animated: true)
            
            return false
        }
        
        return true
    }
    
    
    
    @IBAction func tappedBegin(_ sender: Any) {
        print("\(Int(circularSlider?.value ?? 0))")
        
        // set time data
        timeRemaining = Int(circularSlider?.value ?? 0) * 60
        timeSetted = Int(circularSlider?.value ?? 0)
        
        if(!checkBeginTime()){
            return
        }
        
        circularSlider?.isEnabled = false
        // get value and start timer to count down
        setTimer()
        
        // set give up button
        beginBtn.isEnabled = false
        beginBtn.isHidden = true
        giveUpBtn.isEnabled = true
        giveUpBtn.isHidden = false
    
        
    }
    
    @IBAction func tappedGiveup(_ sender: Any) {
        alertGiveUp()
    }
    
    func pushToNext(){
        // push to next page
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        let authVC = storyboard.instantiateViewController(withIdentifier: "FinishedViewController") as? FinishedViewController
        self.present(authVC!, animated: true, completion: nil)
        
    }
    
    func endGame(){
        
        self.giveUpBtn.isHidden = true
        
        // end timer
        timer?.invalidate()
        timer = nil
        timerSentence?.invalidate()
        timerSentence = nil
        
        // store data
        let timeToStore = timeSetted * 60 - timeRemaining
        if (timeToStore >= 0 && tag != nil && self.score != nil){
            FireBaseManager.shares.saveGameTime(time: timeToStore, tag: tag, score: self.score)
        }
        
    }
    
    func alertGiveUp(){
        let alert = UIAlertController(title: "Will you Give Up?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "NO", style: .cancel, handler: { (UIAlertAction) in
            
        }))
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (UIAlertAction) in
            self.endGame()
            self.pushToNext()
        }))
        present(alert, animated: true)
    }
    
    
    func alertFinish(){
        let alert = UIAlertController(title: "Game is Over", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
            self.endGame()
            self.pushToNext()
        }))
        present(alert, animated: true)
        
    }
    
    
}
