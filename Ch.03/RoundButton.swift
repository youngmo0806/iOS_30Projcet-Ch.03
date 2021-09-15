//
//  RoundButton.swift
//  Ch.03
//
//  Created by hklife_mo on 2021/09/15.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false {
        didSet{
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
//                self.layer.cornerRadius = self.bounds.size.width * 0.5
            }
        }
    }
}
