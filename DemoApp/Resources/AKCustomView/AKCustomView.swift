//
//  AKCustomView.swift
//  DemoApp
//
//  Created by Arbab Ahmed Khan on 16/04/21.
//

import UIKit

@IBDesignable open class AKCustomView: UIView {

	@IBInspectable var cornerRadius: Double {
		 get {
		   return Double(self.layer.cornerRadius)
		 } set {
		   self.layer.cornerRadius = CGFloat(newValue)
		 }
	}
	@IBInspectable var borderWidth: Double {
		  get {
			return Double(self.layer.borderWidth)
		  } set {
		   self.layer.borderWidth = CGFloat(newValue)
		  }
	}
	@IBInspectable var borderColor: UIColor? {
		 get {
			return UIColor(cgColor: self.layer.borderColor!)
		 } set {
			self.layer.borderColor = newValue?.cgColor
		 }
	}
	
	@IBInspectable var startColor: UIColor = UIColor.clear
	@IBInspectable var midColor: UIColor = UIColor.clear
	@IBInspectable var endColor: UIColor = UIColor.clear
	@IBInspectable var isShowGradient: Bool = false
	@IBInspectable var isBottomGradient: Bool = false

	
	
	override public func layoutSubviews() {
		super.layoutSubviews()
		self.layer.masksToBounds = true
		if isShowGradient {
			createGradientLayer()
		}
	}
	func createGradientLayer() {
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame = self.bounds
		gradientLayer.colors = [startColor.cgColor, midColor.cgColor, endColor.cgColor]
		gradientLayer.startPoint = self.isBottomGradient ? CGPoint(x: 0.5, y: 1.0) : CGPoint(x: 0.5, y: 0.0)
		gradientLayer.endPoint = self.isBottomGradient ? CGPoint(x: 0.5, y: 0.0) : CGPoint(x: 0.5, y: 1.0)
		self.layer.addSublayer(gradientLayer)
	}
}
private let animationDuration: TimeInterval = 1.0
private let deleyTime: TimeInterval = 0
private let springDamping: CGFloat = 0.25
private let lowSpringDamping: CGFloat = 0.50
private let springVelocity: CGFloat = 8.00

extension AKCustomView {
    
    //MARK:- Default Animation here
    public func AnimateView(){
        provideAnimation(animationDuration: animationDuration, deleyTime: deleyTime, springDamping: springDamping, springVelocity: springVelocity)
    }
    
    //MARK:- Custom Animation here
    public func AnimateViewWithSpringDuration(_ name:UIView, animationDuration:TimeInterval, springDamping:CGFloat, springVelocity:CGFloat){
        provideAnimation(animationDuration: animationDuration, deleyTime: deleyTime, springDamping: springDamping, springVelocity: springVelocity)
    }
    
    //MARK:- Low Damping Custom Animation here
    public func AnimateViewWithSpringDurationWithLowDamping(_ name:UIView, animationDuration:TimeInterval, springVelocity:CGFloat){
        provideAnimation(animationDuration: animationDuration, deleyTime: deleyTime, springDamping: lowSpringDamping, springVelocity: springVelocity)
    }
    
    private func provideAnimation(animationDuration:TimeInterval, deleyTime:TimeInterval, springDamping:CGFloat, springVelocity:CGFloat){
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: animationDuration,
                       delay: deleyTime,
                       usingSpringWithDamping: springDamping,
                       initialSpringVelocity: springVelocity,
                       options: .allowUserInteraction,
                       animations: {
                       self.transform = CGAffineTransform.identity
        })
    }
}
