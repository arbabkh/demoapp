//
//  AKShadowView.swift
//  MyWedding
//
//  Created by ArbabAhmedKhan on 27/07/20.
//  Copyright © 2020 Shakir Husain. All rights reserved.
//

import UIKit

@IBDesignable open class AKShadowView: UIView {

	@IBInspectable var shadowColor: UIColor? {
		get {
		   return UIColor(cgColor: self.layer.shadowColor!)
		} set {
		   self.layer.shadowColor = newValue?.cgColor
		}
	}
	@IBInspectable var cornerRadius: Double {
		 get {
		   return Double(self.layer.cornerRadius)
		 } set {
		   self.layer.cornerRadius = CGFloat(newValue)
		 }
	}
	@IBInspectable var shadowRadius : CGFloat = 0.0
	@IBInspectable var shadowOpacity : Float = 0.0
	override public func layoutSubviews() {
		super.layoutSubviews()
		shadow()
	}
	func shadow() {
		self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
		self.layer.shadowRadius = shadowRadius
		self.layer.shadowOffset = CGSize(width: 0, height: 0)
		self.layer.shadowOpacity = shadowOpacity
	}

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
