//
//  ThirdViewController.swift
//  ClickerApp
//
//  Created by ElenaL on 10.01.2023.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var scoreLabelThird: UILabel!
    
    var selectedValue: Int?
    var countTap = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let value = selectedValue {
            scoreLabelThird.text = "Your score: \(value)"
        } else {
            scoreLabelThird.text = "Your score: 0"
        }
    }
    
}
