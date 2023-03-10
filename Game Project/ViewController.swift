//
//  ViewController.swift
//  Game Project
//
//  Created by HARSHID PATEL on 16/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pgBar: UIProgressView!
    @IBOutlet weak var playgameLb: UILabel!
    var time = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pgBar.progress = 0.0
        //progress()
        playButton.layer.cornerRadius = 10
        pgBar.layer.isHidden = true
        playgameLb.layer.isHidden = true
        
        
    }
    
    func progress(){
        var a : Float = 0.0
        time = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true, block: { _ in
            a += 0.01
            self.pgBar.progress = a
            if self.pgBar.progress == 1.0{
                self.navigation()
                self.time.invalidate()
                self.pgBar.progress = 0.0
            }
        })
    }
    
    func navigation(){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        //pgBar.progress = 0.0
        progress()
        pgBar.layer.isHidden = false
        playgameLb.layer.isHidden = false
    }
    
}

