//
//  ViewController2.swift
//  Game Project
//
//  Created by HARSHID PATEL on 16/02/23.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var midumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    @IBOutlet weak var easyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonSape()
    }
    
    func buttonSape(){
        easyButton.layer.cornerRadius = 10
        easyButton.layer.masksToBounds = true
        
        hardButton.layer.cornerRadius = 10
        hardButton.layer.masksToBounds = true
        
        midumButton.layer.cornerRadius = 10
        midumButton.layer.masksToBounds = true
    }
    
    @IBAction func easyButton(_ sender: UIButton) {
        navigation()
    }
    
    @IBAction func mediumButton(_ sender: Any) {
        navigation2()
    }
    
    @IBAction func hardButton(_ sender: Any) {
        navigation3()
    }
    
    func navigation(){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        navigate.freq = 0.10
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    func navigation2(){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        navigate.freq = 0.05
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    func navigation3(){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        navigate.freq = 0.03
        navigationController?.pushViewController(navigate, animated: true)
    }
}
