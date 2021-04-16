//
//  CMItem.swift
//  DemoApp
//
//  Created by Arbab Ahmed Khan on 16/04/21.
//

struct CMItem:  Codable {
	
	var title : String?
	var icon : String?

	enum CodingKeys: String, CodingKey {
		
		case title
		case icon
	}
	
}
