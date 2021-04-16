//
//  PlayerScoreTC.swift
//  DemoApp
//
//  Created by Arbab Ahmed Khan on 16/04/21.
//

import UIKit

class PlayerScoreTC: UITableViewCell {
	
	@IBOutlet weak var imgProfilePic: UIImageView!
	@IBOutlet weak var lblName: UILabel!
	
	@IBOutlet weak var lblPoints: UILabel!
	@IBOutlet weak var lblWin: UILabel!
	@IBOutlet weak var lblLoss: UILabel!
	@IBOutlet weak var lblPd: UILabel!
	@IBOutlet weak var lblPlus: UILabel!
	@IBOutlet weak var lblTb: UILabel!
	@IBOutlet weak var lblLb: UILabel!
	@IBOutlet weak var lblPts: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
	func updateCellWithData(inPlayer: CMPlayer) {
		imgProfilePic.image = UIImage(named: inPlayer.profilePic ?? "")
		lblName.text = inPlayer.name
		lblPoints.text = inPlayer.points
		lblWin.text = inPlayer.win
		lblLoss.text = inPlayer.loss
		lblPd.text = inPlayer.pd
		lblPlus.text = inPlayer.plus
		lblTb.text = inPlayer.tb
		lblLb.text = inPlayer.lb
		lblPts.text = inPlayer.pts
	}
	
}
