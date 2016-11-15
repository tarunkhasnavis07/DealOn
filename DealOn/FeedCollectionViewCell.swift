//
//  FeedCollectionViewCell.swift
//  DealOn
//
//  Created by Akkshay Khoslaa on 3/13/16.
//  Copyright © 2016 Akkshay Khoslaa. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    var dealImageView: UIImageView!
    var dealNameLabel: UILabel!
    var dealPriceLabel: UILabel!
    var dealVendorLabel: UILabel!
    var dealVendorImageView: UIImageView!
    var dealTimeAgoLabel: UILabel!
    var dealDescriptionLabel: UILabel!
    var darkFilter: UIView!
    
    //NOTE: Remember to take care of dynamic widths for price and deal name later
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        dealImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: 150))
        dealImageView.contentMode = .ScaleAspectFill
        dealImageView.clipsToBounds = true
        self.contentView.addSubview(dealImageView)
        
        darkFilter = UIView(frame: CGRect(x: 0, y: 120, width: self.contentView.frame.width, height: 30))
        darkFilter.backgroundColor = UIColor.blackColor()
        darkFilter.alpha = 0.6
        self.contentView.addSubview(darkFilter)
        
        dealNameLabel = UILabel(frame: CGRect(x: 8, y: 120, width: 200, height: 30))
        dealNameLabel.textColor = UIColor.whiteColor()
        dealNameLabel.font = UIFont(name: "Gujarati Sangam MN", size: 16)
        self.contentView.addSubview(dealNameLabel);
        
        dealPriceLabel = UILabel(frame: CGRect(x: self.contentView.frame.maxX - 100, y: 120, width: 100, height: 30))
        dealPriceLabel.textColor = Constants.secondaryBlueColor
        dealPriceLabel.font = UIFont(name: "GujaratiSangamMN-Bold", size: 16)
        self.contentView.addSubview(dealPriceLabel)
        
        dealVendorImageView = UIImageView(frame: CGRect(x: 4, y: 150, width: 45, height: 45))
        dealVendorImageView.layer.cornerRadius = dealVendorImageView.frame.width/2
        dealVendorImageView.contentMode = .ScaleAspectFill
        dealVendorImageView.clipsToBounds = true
        self.contentView.addSubview(dealVendorImageView)
        
        dealVendorLabel = UILabel(frame: CGRect(x: 55, y: 155, width: 180, height: 20))
        dealVendorLabel.textColor = UIColor.blackColor()
        dealVendorLabel.font = UIFont(name: "GujaratiSangamMN-Bold", size: 13)
        self.contentView.addSubview(dealVendorLabel)
        
        dealTimeAgoLabel = UILabel(frame: CGRect(x: self.contentView.frame.maxX - 64, y: 155, width: 60, height: 20))
        dealTimeAgoLabel.font = UIFont(name: "Gujarati Sangam MN", size: 11)
        dealTimeAgoLabel.textAlignment = .Right
        dealTimeAgoLabel.textColor = DealOnUtils.hexToUIColor("#b7b7b7")
        self.contentView.addSubview(dealTimeAgoLabel)
        
        dealDescriptionLabel = UILabel(frame: CGRect(x: 55, y: 175, width: self.contentView.frame.width - 8 - dealVendorImageView.frame.width - dealVendorImageView.frame.minX - 6, height: 40))
        dealDescriptionLabel.textColor = DealOnUtils.hexToUIColor("#999999")
        dealDescriptionLabel.font = UIFont(name: "Gujarati Sangam MN", size: 12)
        dealDescriptionLabel.numberOfLines = 2
        self.contentView.addSubview(dealDescriptionLabel)
        
        self.contentView.bringSubviewToFront(darkFilter)
        self.contentView.bringSubviewToFront(dealNameLabel)
        self.contentView.bringSubviewToFront(dealPriceLabel)
        self.contentView.sendSubviewToBack(dealImageView)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
