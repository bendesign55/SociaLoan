//
//  ExploreTableViewCell.swift
//  SocioLoan
//
//  Created by Udvardy Zsombor on 2016. 06. 25..
//  Copyright © 2016. uk.co.benormos.firstapp. All rights reserved.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {
    

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameOfPerson: UILabel!
    @IBOutlet weak var nameOfProject: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
