//
//  MyTableViewCell.swift
//  KurCepMobil
//
//  Created by Apple on 28.08.2024.
//

import Foundation
import UIKit

class MyTableViewCell:UITableViewCell {
    @IBOutlet weak var currencyIcon: UIImageView!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var changeRateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 1, left: 1, bottom: 3, right: 1)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
}
