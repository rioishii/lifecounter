//
//  lifecounterCell.swift
//  lifecounter
//
//  Created by Rio Ishii on 2/2/19.
//  Copyright © 2019 Rio Ishii. All rights reserved.
//

import UIKit

class lifecounterCell: UITableViewCell {

    @IBOutlet weak var playerView: UILabel!
    @IBOutlet weak var playerHP: UILabel!
    @IBOutlet weak var minusFive: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var plusFive: UIButton!
    
    var playerItem: Player!
    
    func setPlayer(player: Player) {
        playerItem = player
        playerView.text = player.playerName
        playerHP.text = String(player.hp)
    }
    
    func didClick(_ sender: UIButton) {
        let text = sender.titleLabel!.text;
        switch text {
        case "-5":
            playerItem.hp -= 5
        case "+5":
            playerItem.hp += 5
        case "+":
            playerItem.hp += 1
        default:
            playerItem.hp -= 1
        }
        playerHP.text = String(playerItem.hp)
    }
    
    func setListeners() {
        minusFive.addTarget(self, action: Selector(("didClick")), for: .touchUpInside);
        minus.addTarget(self, action: Selector(("didClick")), for: .touchUpInside);
        plus.addTarget(self, action: Selector(("didClick")), for: .touchUpInside);
        plusFive.addTarget(self, action: Selector(("didClick")), for: .touchUpInside);
    }
}
