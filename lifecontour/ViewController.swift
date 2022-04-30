//
//  ViewController.swift
//  LifeContour
//
//  Created by 李乐思 on 4/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var addPlayerBtn: UIButton!
    
    var playersList : [String] = ["Player 1", "Player 2", "Player 3", "Player 4"]
        
    override func viewDidLoad() {
        super.viewDidLoad();
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowHistory" {
            let hisVC = segue.destination as! HistoryViewController
            hisVC.history = "\(history)"
        }
    }
    
    @IBAction func addPlayerFuc(_ sender: Any) {
        playersList.append("Player \(playersList.count + 1)")
        if playersList.count <= 8 {
        tableView.reloadData()
        }
    }
    
    @IBAction func gameRestart(_ sender: Any) {
        gameReload()
    }
    
    func gameReload() {
        playersList = ["Player 1", "Player 2", "Player 3", "Player 4"]
        tableView.reloadData()
        addPlayerBtn.isEnabled = true
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.playerName.text = playersList[indexPath.row]
        cell.delegate = self
        return cell
    }
}

 
var history : String = ""

extension ViewController: TableViewCellProtocol {
    func lifeNumber(_ sender: String) {
        history.append(sender)
    }
    
    func minusBtnTouchUpInside(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        history.append("Player lost 1 life \n")
    }
    
    func addBtnTouchUpInside(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        history.append("Player gained 1 life \n")
    }

    func okBtnTapped(_ sender: Any) {
        addPlayerBtn.isEnabled = false
    }
    func checkLife(_ life: Int) {
        if life < 0 {
            let alert = UIAlertController(title: "Game Over" , message: "Player \(playersList.count)" , preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_) in self.gameReload()
            }))
            self.present(alert, animated:true, completion: nil)
            addPlayerBtn.isEnabled = true
            history.append("Player \(playersList.count) game over! \n")
            
        }
    }
}

