//
//  CMTeam.swift
//  DemoApp
//
//  Created by Arbab Ahmed Khan on 16/04/21.
//

import UIKit

struct CMTeam: Codable {
	
	var logo : String?
	var sponsorLogo : String?
	var teamName : String?
	var matchDateTime : String?
	var vsTeamName : String?
	var playerList : [CMPlayer]?

	enum CodingKeys: String, CodingKey {
		
		case logo
		case sponsorLogo
		case teamName
		case matchDateTime
		case vsTeamName
		case playerList
	}
	
	var formattedMatchDateTime : String {
		guard matchDateTime != nil && matchDateTime != "0" && matchDateTime != "" else {
			return ""
		}
		let date = Utils.convertUnixTimestampIntoDate(inString: matchDateTime)
		guard let dateStr = Utils.getRelativeMMMDDYYDate(inDate: date).components(separatedBy: ",").first else { return "" }
		return dateStr + " - " + Utils.getRelativeTime(inDate: date, addAmPm: false)
	}
	
	var formattedAttrDate : NSMutableAttributedString {
		if formattedMatchDateTime.count == 0 {
			let myAttrString = NSMutableAttributedString(string: formattedMatchDateTime)
			return myAttrString
		} else {
			let mainString = "Next Match " + formattedMatchDateTime
			guard let stringToColor = mainString.components(separatedBy: "-").first else {
				let myAttrString = NSMutableAttributedString(string: "")
				return myAttrString
			}
			let range = (mainString as NSString).range(of: stringToColor)
			
			let style = NSMutableParagraphStyle()
			style.alignment = .center
			let attributes = [NSAttributedString.Key.paragraphStyle : style]
			let myAttrString = NSMutableAttributedString(string: mainString, attributes: attributes)
			myAttrString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 88/255, green: 90/255, blue: 98/255, alpha: 1.0), range: range)

			return myAttrString
		}
		
	}
	
}

struct CMPlayer: Codable {
	
	var profilePic : String?
	var name : String?
	var points : String?
	var win : String?
	var loss : String?
	var pd : String?
	var plus : String?
	var tb : String?
	var lb : String?
	var pts : String?

	enum CodingKeys: String, CodingKey {
		
		case profilePic
		case name
		case points
		case win
		case loss
		case pd
		case plus
		case tb
		case lb
		case pts

	}

}
