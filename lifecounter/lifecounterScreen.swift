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
    @IBOutlet weak var loserText: UILabel!
    
    var players: [Player] = []
    var history: [String] = []
    
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
        if (players.count > 2) {
            players.removeLast()
            
            let indexPath = IndexPath(row: players.count, section: 0)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    
    @IBAction func addPlayer(_ sender: UIBarButtonItem) {
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
    
    @objc func incrementFive(_ sender: UIButton) {
        let increasedHp = players[sender.tag].hp + 5
        history.append("Player\(sender.tag + 1) gained five life")
        self.players[sender.tag].hp = increasedHp
        self.tableView.reloadData()
    }
    
    @objc func decrementFive(_ sender: UIButton) {
        let increasedHp = players[sender.tag].hp - 5
        history.append("Player\(sender.tag + 1) lost five life")
        self.players[sender.tag].hp = increasedHp
        checkLoser(sender.tag)
        self.tableView.reloadData()
    }
    
    @objc func increment(_ sender: UIButton) {
        let increasedHp = players[sender.tag].hp + 1
        history.append("Player\(sender.tag + 1) gained one life")
        self.players[sender.tag].hp = increasedHp
        self.tableView.reloadData()
    }
    
    @objc func decrement(_ sender: UIButton) {
        let increasedHp = players[sender.tag].hp - 1
        history.append("Player\(sender.tag + 1) lost one life")
        self.players[sender.tag].hp = increasedHp
        checkLoser(sender.tag)
        self.tableView.reloadData()
    }
    
    func checkLoser(_ tag: Int) {
        if (players[tag].hp <= 0) {
            loserText.text = "Player \(tag + 1) LOSES!"
            history.append("Player\(tag + 1) died")
        }
        gameOver()
    }
    
    func check() {
        var count = 0
        for player in players {
            if player.hp > 0 {
                count += 1
            }
        }
        
        if (count == players.count) {
            loserText.text = ""
        }
    }
    
    func gameOver() {
        var count = 0
        var winner: [String] = []
        for player in players {
            if player.hp <= 0 {
                count += 1
            } else {
                winner.append(player.playerName)
            }
        }
        
        if (count == players.count - 1) {
            loserText.text = "GAME OVER \(winner[0]) Wins!"
            history.append("Player\(winner[0].last!) Won")
            players.removeAll()
            players = createArray()
            self.tableView.reloadData()
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        players.removeAll()
        players = createArray()
        loserText.text = ""
        history.append("Reset Game")
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let historyView = segue.destination as! historyViewController
        historyView.history = history
    }
    
}

extension lifecounterScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = players[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "lifecounterCell") as! lifecounterCell
        
        cell.minusFive.tag = indexPath.row
        cell.minusFive.addTarget(self, action: #selector(self.decrementFive(_:)), for: .touchUpInside)
        cell.plusFive.tag = indexPath.row
        cell.plusFive.addTarget(self, action: #selector(self.incrementFive(_:)), for: .touchUpInside)
        cell.minus.tag = indexPath.row
        cell.minus.addTarget(self, action: #selector(self.decrement(_:)), for: .touchUpInside)
        cell.plus.tag = indexPath.row
        cell.plus.addTarget(self, action: #selector(self.increment(_:)), for: .touchUpInside)
        
        cell.setPlayer(player: player)
        
        return cell
    }
    
}
