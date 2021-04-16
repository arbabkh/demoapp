//
//  CMHome.swift
//  DemoApp
//
//  Created by Arbab Ahmed Khan on 16/04/21.
//

struct CMHome: Codable {
	
	var teamA : CMTeam?
	var teamB : CMTeam?
	var itemList: [CMItem]?

	enum CodingKeys: String, CodingKey {
		
		case teamA
		case teamB
		case itemList
	}
	
}

