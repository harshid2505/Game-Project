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
    var ans = 0
    var score = 0
    var point = 0
    var life = 1
    var highscore = UserDefaults.standard.integer(forKey: "highscore")
    

    
    
    @IBOutlet weak var lifeline3: UIImageView!
    @IBOutlet weak var lifeline2: UIImageView!
    @IBOutlet weak var lifeline1: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var lbOfOpretor: UILabel!
    @IBOutlet weak var lable2: UILabel!
    @IBOutlet weak var lable1: UILabel!
    @IBOutlet weak var pgbar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pgbar.progress = 1.0
        progress()
        genret()
        buttonInText()
        scoreLbSet()
        scoreUpdate()
        score = point
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
                self.alert()
            }
        })
    }
    
    func alert(){
        scoreUpdate()
        let alert = UIAlertController.init(title: "Game Over\n", message: "Score : \(score)\n High Score : \(highscore)", preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "Home", style: .default, handler: { _ in
            self.navigation()
            //self.scoreUpdate()
            
        }))
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
            self.lifeline1.image = UIImage(systemName: "star.fill")
            self.lifeline2.image = UIImage(systemName: "star.fill")
            self.lifeline3.image = UIImage(systemName: "star.fill")
            self.life = 1
            self.progress()
            self.genret()
            self.buttonInText()
            self.score = 0
            self.scoreLabel.text = "0"
            self.point = 0
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
        lable1.text = "\(firstNumber)"
        lable2.text = "\(secondNumber)"
        lbOfOpretor.text = opretor
        
        if lbOfOpretor.text == "+"{
            ans = firstNumber + secondNumber
        } else {
            ans = firstNumber - secondNumber
        }
    }
    
    func buttonInText() {
        var bbutton2 = Int.random(in: -100...100)
        var bbutton3 = Int.random(in: -100...100)
        var arr = [ans,bbutton2,bbutton3]
        arr.shuffle()
        button1.setTitle("\(arr[1])", for: .normal)
        button2.setTitle("\(arr[0])", for: .normal)
        button3.setTitle("\(arr[2])", for: .normal)
    }
    
    func scoreUpdate(){
        if score > highscore{
            highscore = score
            //UserDefaults.standard.set(score, forKey: "highscore")
        }
    }
    
    @IBAction func button1(_ sender: UIButton) {
        if let str = sender.currentTitle, let intData = Int(str), ans == intData {
            score = score + 1
            scoreLabel.text = "\(score)"
            progress()
            self.genret()
            buttonInText()
        }
        else if life == 1{
            lifeline1.image = UIImage(systemName: "star")
            life += 1
            genret()
            progress()
            buttonInText()
        }
        else if life == 2{
            lifeline2.image = UIImage(systemName: "star")
            life += 1
            genret()
            progress()
            buttonInText()
        }
        else if life == 3{
            lifeline3.image = UIImage(systemName: "star")
            alert()
        }
    }
    
}

