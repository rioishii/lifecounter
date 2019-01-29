//
//  ViewController.swift
//  lifecounter
//
//  Created by Rio Ishii on 1/27/19.
//  Copyright © 2019 Rio Ishii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var HPs = [20, 20, 20, 20]
    var loserText = ""
    
    @IBOutlet weak var Player1HP: UILabel!
    @IBOutlet weak var Player2HP: UILabel!
    @IBOutlet weak var Player3HP: UILabel!
    @IBOutlet weak var Player4HP: UILabel!
    @IBOutlet weak var Loser: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeHP(_ sender: UIButton) {
        let tag = sender.tag - 1
        var labelArray = [Player1HP, Player2HP, Player3HP, Player4HP]
        switch sender.titleLabel?.text {
        case "+":
            HPs[tag] += 1
        case "-":
            HPs[tag] -= 1
        case "+5":
            HPs[tag] += 5
        default:
            HPs[tag] -= 5
        }
        labelArray[tag]?.text = String(HPs[tag])
        for HP in HPs {
            if (HP <= 0) {
                loserText = "Player \(tag + 1) LOSES!"
                Loser.text = loserText
                break
            } else {
                loserText = ""
                Loser.text = loserText
            }
        }
    }
}

