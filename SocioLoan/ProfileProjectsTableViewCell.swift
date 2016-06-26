//
//  ProfileProjectsTableViewCell.swift
//  SocioLoan
//
//  Created by Ben Ormos on 25/06/2016.
//  Copyright © 2016 uk.co.benormos.firstapp. All rights reserved.
//

import UIKit

class ProfileProjectsTableViewCell: UITableViewCell {
    @IBOutlet weak var projectLabel: UILabel!

    @IBOutlet weak var creditRatingCollectionView: UICollectionView!
    @IBOutlet weak var usersCollectionView: UICollectionView!
    @IBOutlet weak var profileProjectImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var projectDescription: UITextView!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

extension ProfileProjectsTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: protocol<UICollectionViewDataSource, UICollectionViewDelegate>>(dataSourceDelegate: D, forRow row: Int) {
        
        creditRatingCollectionView.delegate = dataSourceDelegate
        creditRatingCollectionView.dataSource = dataSourceDelegate
        creditRatingCollectionView.tag = row
        creditRatingCollectionView.setContentOffset(creditRatingCollectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        creditRatingCollectionView.reloadData()
}

}
