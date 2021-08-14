//
//  totalAmountCell.swift
//  iChange
//
//  Created by Alice Kim on 2021-08-14.
//

import UIKit

class totalAmountCell: UITableViewCell {
    
    @IBOutlet weak var chargeDueLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            let newWidth = frame.width * 0.90
            let space = (frame.width - newWidth) / 2
            frame.size.width = newWidth
            frame.origin.x += space

            super.frame = frame

        }
    }
}
