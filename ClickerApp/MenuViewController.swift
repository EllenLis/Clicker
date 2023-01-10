//
//  ViewController.swift
//  ClickerApp
//
//  Created by ElenaL on 10.01.2023.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var labelScore: UILabel!
    
    var countTap = 0
    var selectedValueFirst: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let value = selectedValueFirst {
            labelScore.text = "Your score: \(value)"
        } else {
            labelScore.text = "Your score: 0"
        }
        
        updateScore()
    
    }
    
    @IBAction func menuBtn(_ segue: UIStoryboardSegue) {
        if let secondVC = segue.source as? SecondViewController {
            labelScore.text = "Last score: \(secondVC.countTap)"
            } else if let thirdVC = segue.source as? ThirdViewController {
            labelScore.text = "Last score: \(thirdVC.selectedValue!)"
        }
    }
    
    func updateScore() {
        labelScore.text = "Last score: \(countTap)"
    }

}

