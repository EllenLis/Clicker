//
//  SecondViewController.swift
//  ClickerApp
//
//  Created by ElenaL on 10.01.2023.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var pinkBtn: UIButton!
    @IBOutlet weak var yelloBtn: UIButton!
    @IBOutlet weak var mintBtn: UIButton!
    
    var massivBtns: [UIButton] = []
    var countTap = 0
    
    var selectedValueSec: Int?
    
    func randomTap() {
        self.massivBtns = [self.pinkBtn, self.yelloBtn, self.mintBtn]
        pinkBtn.isHidden = true
        yelloBtn.isHidden = true
        mintBtn.isHidden = true
        let randomBtn = massivBtns.randomElement()!
        randomBtn.isHidden = false
    }
    
    @IBAction func pinkTapBtn(_ sender: UIButton) {
        pinkBtn.isHidden = true
        countTap += 1
        updateScore()
        randomTap()
    }
    
    @IBAction func yellowTapBtn(_ sender: UIButton) {
        yelloBtn.isHidden = true
        countTap += 1
        updateScore()
        randomTap()
    }
    
    @IBAction func mintTapBtn(_ sender: UIButton) {
        mintBtn.isHidden = true
        countTap += 1
        updateScore()
        randomTap()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomTap()
        updateScore()
        
        if let value = selectedValueSec {
            scoreLabel.text = "Your score: \(value)"
        } else {
            scoreLabel.text = "Your score: 0"
        }
    }
    
    func updateScore() {
        scoreLabel.text = "Score: \(countTap)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showThird" else { return }
        guard let destVC = segue.destination as? ThirdViewController else { return }
        destVC.selectedValue = countTap
        updateScore()
    }

}
