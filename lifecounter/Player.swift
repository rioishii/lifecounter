//
//  Player.swift
//  lifecounter
//
//  Created by Rio Ishii on 2/2/19.
//  Copyright © 2019 Rio Ishii. All rights reserved.
//

import Foundation

class Player {
    
    var playerName: String
    var hp: Int
    
    init(playerName: String, hp: Int) {
        self.playerName = playerName
        self.hp = hp
    }
}
