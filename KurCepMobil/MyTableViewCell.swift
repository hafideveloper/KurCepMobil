//
//  MyTableViewCell.swift
//  KurCepMobil
//
//  Created by Apple on 28.08.2024.
//

import Foundation
import UIKit

class MyTableViewCell:UITableViewCell {
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var changeRateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyIcon: UIImageView!
    @IBOutlet weak var iconLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
         let margins = UIEdgeInsets(top: 0, left: 1, bottom: 2, right: 1)
        contentView.frame = contentView.frame.inset(by: margins)
        
        currencyIcon?.image = UIImage(named: "circle")
        currencyIcon.frame = CGRect(x: 10, y: 0, width: 55, height: 50)
        
    }
    
}
