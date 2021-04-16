//
//  HomeCollectionHeaderView.swift
//  DemoApp
//
//  Created by Arbab Ahmed Khan on 15/04/21.
//

import UIKit

class HomeCollectionHeaderView: UICollectionReusableView {
	
	@IBOutlet weak var imgTeamAlogo: UIImageView!
	@IBOutlet weak var lblTeamAName: UILabel!
	@IBOutlet weak var lblTeamADate: UILabel!
	@IBOutlet weak var lblTeamAVSTeamName: UILabel!
	@IBOutlet weak var imgTeamASponserLogo: UIImageView!
	
	@IBOutlet weak var imgTeamBlogo: UIImageView!
	@IBOutlet weak var lblTeamBName: UILabel!
	@IBOutlet weak var lblTeamBDate: UILabel!
	@IBOutlet weak var lblTeamBVSTeamName: UILabel!
	@IBOutlet weak var imgTeamBSponserLogo: UIImageView!
	
	func updateCellWithData(inHome: CMHome) {
		
		imgTeamAlogo.image = UIImage(named: inHome.teamA?.logo ?? "")
		lblTeamAName.text = inHome.teamA?.teamName
		lblTeamADate.attributedText = inHome.teamA?.formattedAttrDate
		lblTeamAVSTeamName.text = inHome.teamA?.vsTeamName
		imgTeamASponserLogo.image = UIImage(named: inHome.teamA?.sponsorLogo ?? "")
		
		imgTeamBlogo.image = UIImage(named: inHome.teamB?.logo ?? "")
		lblTeamBName.text = inHome.teamB?.teamName
		lblTeamBDate.attributedText = inHome.teamB?.formattedAttrDate
		lblTeamBVSTeamName.text = inHome.teamB?.vsTeamName
		imgTeamBSponserLogo.image = UIImage(named: inHome.teamB?.sponsorLogo ?? "")
		
	}
	
}
