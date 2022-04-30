//
//  ViewController.swift
//  LifeContour
//
//  Created by 李乐思 on 4/19/22.
//

import UIKit

class ViewController: UIViewController {

    //player`1
    @IBOutlet weak var playerLabel1: UILabel!
    @IBOutlet weak var minusButton1p1: UIButton!
    @IBOutlet weak var minusButton5P1: UIButton!
    @IBOutlet weak var plusButton1p1: UIButton!
    @IBOutlet weak var plusButton5p1: UIButton!
    
    //player`2
    @IBOutlet weak var playerLabel2: UILabel!
    @IBOutlet weak var minusButton1p2: UIButton!
    @IBOutlet weak var minusButton5P2: UIButton!
    @IBOutlet weak var plusButton1p2: UIButton!
    @IBOutlet weak var plusButton5p2: UIButton!
    
    //scores
    var scorep1 = 20
    var scorep2 = 20
    
    //let dataScoure = DataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        checkLose()
        
    }
    
    @IBAction func minusFivePlayerOne(_ sender: Any) {
        scorep1 -= 5
        checkLose()
    }
    
    
    @IBAction func minusOnePlayerOne(_ sender: Any) {
        scorep1 -= 1
        checkLose()
    }
    
    
    @IBAction func plusOnePlayerOne(_ sender: Any) {
        scorep1 += 1
        checkLose()
    }
    
    
    @IBAction func plusFivePlayerOne(_ sender: Any) {
        scorep1 += 5
        checkLose()
    }
    
    
    @IBAction func minusFivePlayerTwo(_ sender: Any) {
        scorep2 -= 5
        checkLose()
    }
    
    
    @IBAction func minusOnePlayerTwo(_ sender: Any) {
        scorep2 -= 1
        checkLose()
    }
    
    
    @IBAction func plusOnePlayerTwo(_ sender: Any) {
        scorep2 += 1
        checkLose()
    }
    
    
    @IBAction func plusFivePlayerTwo(_ sender: Any) {
        scorep2 += 5
        checkLose()
    }
    
    func checkLose() {
        if scorep1 <= 0 {
            playerLabel1.text = "Player 1 LOSES!"
        } else {
            playerLabel1.text = "\(scorep1)"
        }
        
        if scorep2 <= 0 {
            playerLabel2.text = "Player 2 LOSES!"
        } else {
            playerLabel2.text = "\(scorep2)"
        }
    }
}

