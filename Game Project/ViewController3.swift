//
//  ViewController3.swift
//  Game Project
//
//  Created by HARSHID PATEL on 17/02/23.
//

import UIKit

class ViewController3: UIViewController {
    
    var time = Timer()
    var freq = 0.0
    
    
    
    //var firstNumber = Int.random(in: 1...50)
    //var secondNumber = Int.random(in: 21...70)
    
    
    var ans = 0
    //    var a = Int.random(in: -50...50)
    //    var b = Int.random(in: -100...100)
    var score = 0
    var point = 0
    //var highscore = UserDefaults.standard.integer(forKey: "highscore")
    var highscore = 0
    
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var buttton2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var lbOfOpretor: UILabel!
    @IBOutlet weak var lb2: UILabel!
    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var pgbar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pgbar.progress = 1.0
        progress()
        genret()
        buttonInText()
        scoreLbSet()
        scoreUpdate()
       
        score = point
        //highscore = score
        self.scoreUpdate()
    }
    
    
    func progress(){
        var a : Float = 1.0
        time.invalidate()
        time = Timer.scheduledTimer(withTimeInterval: freq, repeats: true, block: { _ in
            a -= 0.01
            self.pgbar.progress = a
            if self.pgbar.progress == 0.0{
                self.pgbar.progress = 1.0
                self.time.invalidate()
                self.scoreUpdate()
                self.atert()
            }
        })
    }
    
    func atert(){
        scoreUpdate()
        let alert = UIAlertController.init(title: "Game Over\n", message: "Score : \(score)\n High Score : \(highscore)", preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "Home", style: .default, handler: { _ in
            self.navigation()
        }))
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
            self.progress()
            self.genret()
            self.buttonInText()
            self.score = 0
            self.scoreLabel.text = "0"
            self.point = 0
            //self.highscore = 0
            self.scoreUpdate()
        }))
        present(alert, animated: true)
    }
    
    func navigation(){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.popViewController(animated: false)
    }
    
    func scoreLbSet(){
        scoreLabel.layer.cornerRadius = 10
        scoreLabel.layer.masksToBounds = true
    }
    
    func genret(){
                var firstNumber = Int.random(in: 1...50)
                var secondNumber = Int.random(in: 21...70)
        
        
        var array = ["+" , "-"]
        var opretor = array.randomElement()
        
        lb1.text = "\(firstNumber)"
        lb2.text = "\(secondNumber)"
        lbOfOpretor.text = opretor
        
        if lbOfOpretor.text == "+"{
            ans = firstNumber + secondNumber
            
        }
        
        else {
            ans = firstNumber - secondNumber
        }
        
        
        //ansLb.text = "\(ans)"
    }
    
    
    func buttonInText(){
        
        
        //ansLb.text = "\(ans)"
        
        button1.setTitle(String(ans), for: .normal)
        
        
        //button2.setTitle(String(Int.random(in: -100...100)), for: .normal)
        buttton2.setTitle(String(Int.random(in: -100...100)),for : .normal)
        
        //button2Lb.text = "\(Int.random(in: -50...50))"
        
        button3.setTitle(String(Int.random(in: -100...100)), for: .normal)
        
        //button3Lb.text = "\(Int.random(in: -100...100))"
    }
    

    
    func scoreUpdate(){
        if score > highscore{
            highscore = score
            //UserDefaults.standard.set(highscore, forKey: "hidhscore")
        }
    }
    
    
    @IBAction func button1(_ sender: UIButton) {
        
        progress()
        self.genret()
        buttonInText()
        
        if let score2 = NumberFormatter().number(from: scoreLabel.text!) {
            var playerScore = score2.intValue
                score = score + 1
                scoreLabel.text = "\(score)"
            } else {
                
                scoreLabel.text = "0"
            }
    }
    @IBAction func button2(_ sender: UIButton) {
        self.genret()
        buttonInText()
        progress()
        atert()
        
    }
    
    @IBAction func button3(_ sender: UIButton) {
        self.genret()
        buttonInText()
        progress()
        atert()
        
    }
    
}

