//
//  CreditRatingCollectionView.swift
//  SocioLoan
//
//  Created by Ben Ormos on 26/06/2016.
//  Copyright © 2016 uk.co.benormos.firstapp. All rights reserved.
//

import UIKit

class CreditRatingCollectionView: UICollectionView, UICollectionViewDataSource {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("creditRatingCell", forIndexPath: indexPath)
        return cell
    }
    
}
