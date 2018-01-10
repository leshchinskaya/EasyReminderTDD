//
//  CustomTableViewCell.swift
//  EasyReminderTDD
//
//  Created by Marie on 10.01.18.
//  Copyright © 2018 Mariya. All rights reserved.
//

import UIKit
import CheckBox

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var chk: CheckBox!
    
    var check = 0
    var kolCheck = 1
    
    @IBAction func checkChange(_ sender: Any) {
        print("Check")
        kolCheck += 1
        if (kolCheck % 2 == 0) {
            check = 1
            chk.isChecked = true
        } else {
            check = 0
            chk.isChecked = false
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        check = 0
        kolCheck = 1
        chk.isChecked = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
