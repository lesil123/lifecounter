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
        return 180.0
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowHistory" {
            let hisVC = segue.destination as! HistoryViewController
            hisVC.history = "\(history)"
        }
    }
    
    @IBAction func addPlayerFuc(_ sender: Any) {
        playersList.append("Player \(playersList.count + 1)")
        tableView.reloadData()
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
        history.append("Player gain 1 life \n")
    }

    func okBtnTapped(_ sender: Any) {
        addPlayerBtn.isEnabled = false
    }

}

