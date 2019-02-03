//
//  lifecounterScreen.swift
//  lifecounter
//
//  Created by Rio Ishii on 2/2/19.
//  Copyright © 2019 Rio Ishii. All rights reserved.
//

import UIKit

class lifecounterScreen: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var players: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        players = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func createArray() -> [Player] {
        var tempPlayers: [Player] = []
        
        let player1 = Player(playerName: "P1", hp: 20)
        let player2 = Player(playerName: "P2", hp: 20)
        let player3 = Player(playerName: "P3", hp: 20)
        let player4 = Player(playerName: "P4", hp: 20)
        
        tempPlayers.append(player1)
        tempPlayers.append(player2)
        tempPlayers.append(player3)
        tempPlayers.append(player4)
    
        return tempPlayers
    }
    
    @IBAction func removePlayer(_ sender: UIBarButtonItem) {
        deletePlayer()
    }
    
    func deletePlayer() {
        if (players.count > 2) {
            players.removeLast()
            
            let indexPath = IndexPath(row: players.count, section: 0)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    
    @IBAction func addPlayer(_ sender: UIBarButtonItem) {
        insertNewPlayer()
    }
    
    func insertNewPlayer() {
        if (players.count < 8) {
            let playerName = "P\(players.count + 1)"
            let newPlayer = Player(playerName: playerName, hp: 20)
            players.append(newPlayer)
            
            let indexPath = IndexPath(row: players.count - 1, section: 0)
            tableView.beginUpdates()
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
}

extension lifecounterScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = players[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "lifecounterCell") as! lifecounterCell
        
        cell.setPlayer(player: player)
        
        return cell
    }
    
}
