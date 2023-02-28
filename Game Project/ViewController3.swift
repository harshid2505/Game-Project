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
    
    var firstNumber = 0
    var secondNumber = 0
    var a = 0
    var ans = 0
   
    //var buttonArray = [button1 , bu]
    

    @IBOutlet weak var ansLb: UILabel!
    @IBOutlet weak var button3Lb: UILabel!
    @IBOutlet weak var button2Lb: UILabel!
    @IBOutlet weak var button1Lb: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
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
        button1Lb.layer.cornerRadius = 10
        buttonInText()
        
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
                self.atert()
            }
        })
    }
    
    func atert(){
        let alert = UIAlertController.init(title: "Game Over", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Home", style: .default, handler: { _ in
            self.navigation()
        }))
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
            self.progress()
            self.genret()
            self.buttonInText()
        }))
        present(alert, animated: true)
    }
    
    func navigation(){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.popViewController(animated: false)
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
        
        button2.setTitle(String(Int.random(in: -50...50)), for: .normal)

        //button2Lb.text = "\(Int.random(in: -50...50))"
        
        button3.setTitle(String(Int.random(in: -100...100)), for: .normal)
        
        //button3Lb.text = "\(Int.random(in: -100...100))"
    }
    
    @IBAction func button1(_ sender: UIButton) {
        self.genret()
        buttonInText()
        progress()
        
    }
    @IBAction func button2(_ sender: UIButton) {
        self.genret()
        buttonInText()
        progress()
    }
    
    @IBAction func button3(_ sender: UIButton) {
        self.genret()
        buttonInText()
        progress()
    }
    
}
