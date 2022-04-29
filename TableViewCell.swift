//
//  TableViewCell.swift
//  lifecontour
//
//  Created by 李乐思 on 4/27/22.
//

import UIKit
protocol TableViewCellProtocol: AnyObject {
    func minusBtnTouchUpInside(_ sender: Any)
    func addBtnTouchUpInside(_ sender: Any)
    func okBtnTapped(_ sender: Any)
    func lifeNumber(_ sender: String)
    
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerSubBtn: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!    
    @IBOutlet weak var playerAddBtn: UIButton!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var changeCountBtn: UISegmentedControl!
    @IBOutlet weak var countSetFinish: UIButton!
    @IBOutlet weak var conutInputValue: UITextField!
    
    //var player: Player!
    weak var delegate: TableViewCellProtocol?
    var playerLife = 20
    
    func configureCell() {
        //scoreLabel.text = "\(player.count)"
        scoreLabel.text = "playerLife"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
         //Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
       // player = nil
    }
    
    @IBAction func addBtnTouchUpInside(_ sender: Any) {
        playerLife += 1
        scoreLabel.text = "\(playerLife)"
        self.delegate?.addBtnTouchUpInside(sender)
    }
    
    @IBAction func minusBtnTouchUpInside(_ sender: Any) {
        playerLife -= 1
        scoreLabel.text = "\(playerLife)"
        self.delegate?.minusBtnTouchUpInside(sender)
    }
    
    // 这个是update life
    @IBAction func okBtnTapped(_ sender: Any) {
        let number = Int(conutInputValue.text!)
        
        if number != nil{
            if changeCountBtn.selectedSegmentIndex == 0 {
                playerLife -= number!
                scoreLabel.text = "\(playerLife)"
                self.delegate?.lifeNumber("Player lost \(number!) life \n")
            } else {
                playerLife += number!
                scoreLabel.text = "\(playerLife)"
                self.delegate?.lifeNumber("Player gained \(number!) life \n")
            }
        } else {
            print("enter value to click OK")
        }
    }
}
