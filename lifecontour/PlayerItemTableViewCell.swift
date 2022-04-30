//
//  PlayerItemTableViewCell.swift
//  lifecontour
//
//  Created by 李乐思 on 4/26/22.
//

import UIKit

class PlayerItemTableViewCell: UITableViewCell {

    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var playerMinus: UIButton!
    
    @IBOutlet weak var lifeInput: UITextField!
    @IBOutlet weak var playerplus: UIButton!
    
    @IBOutlet weak var lifecountChange: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
