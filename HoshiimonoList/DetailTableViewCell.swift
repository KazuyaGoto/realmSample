//
//  DetailTableViewCell.swift
//  HoshiimonoList
//
//  Created by 後藤和也 on 2020/10/07.
//  Copyright © 2020 gotokazuya. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var URLTextView: UITextView!
    @IBOutlet weak var Picture: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
