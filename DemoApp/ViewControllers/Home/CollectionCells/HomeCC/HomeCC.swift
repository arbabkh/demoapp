//
//  HomeCC.swift
//  DemoApp
//
//  Created by Arbab Ahmed Khan on 15/04/21.
//

import UIKit

class HomeCC: UICollectionViewCell {
	
	@IBOutlet weak var imgIcon: UIImageView!
	@IBOutlet weak var lblTitle: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	func updateCellWithData(inItem: CMItem) {
		imgIcon.image = UIImage(named: inItem.icon ?? "")
		lblTitle.text = inItem.title
	}
}
