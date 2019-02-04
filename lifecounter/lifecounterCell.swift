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
    
}
