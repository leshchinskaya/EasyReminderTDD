//
//  CustomTableViewCell.swift
//  EasyReminderTDD
//
//  Created by Marie on 10.01.18.
//  Copyright © 2018 Mariya. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func checkChange(_ sender: Any) {
        print("Check")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
