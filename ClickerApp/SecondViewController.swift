//
//  SecondViewController.swift
//  ClickerApp
//
//  Created by ElenaL on 10.01.2023.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var pinkBtn: UIButton!
    @IBOutlet weak var yelloBtn: UIButton!
    @IBOutlet weak var mintBtn: UIButton!
    
    var massivBtns: [UIButton] = []
    var countTap = 0
    
    var counter = 30
    
    var timer: Timer?
    
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
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.startTimer), userInfo: nil, repeats: true)
        updateCounter()
    }
    
    @objc func startTimer() {
            counter -= 1
        if counter == 0 {
            performSegue(withIdentifier: "showThird", sender: nil)
        }
        updateCounter()
    }
    
    func updateScore() {
        scoreLabel.text = "Score: \(countTap)"
    }
    
    func updateCounter() {
        timerLabel.text = "Timer: \(counter)"
    }
    
    
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "showThird" else { return }
            guard let destVC = segue.destination as? ThirdViewController else { return }
            destVC.selectedValue = countTap
            updateScore()
        }
    

}
