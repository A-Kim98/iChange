//
//  addPaidCell.swift
//  iChange
//
//  Created by Alice Kim on 2021-08-14.
//

import UIKit


class addPaidCell: UITableViewCell {

    @IBOutlet weak var addPaidLabel: UILabel!
    @IBOutlet weak var addPaidButton: UIButton!
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            let newWidth = frame.width * 0.90 // get 80% width here
            let space = (frame.width - newWidth) / 2
            frame.size.width = newWidth
            frame.origin.x += space

            super.frame = frame

        }
    }
}

