//
//  HistoryViewController.swift
//  lifecontour
//
//  Created by 李乐思 on 4/27/22.
//

import UIKit

class HistoryViewController: UIViewController {
    var history = ""
    
    @IBOutlet weak var historyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyLabel.text = history
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
