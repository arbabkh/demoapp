//
//  CMResponse.swift
//  DemoApp
//
//  Created by Arbab Ahmed Khan on 16/04/21.
//
import UIKit


struct CMResponse : Codable {
	
	var serverTime: String?
	var msg: String?
	var status = false

	var encodedResposeStr:String?
	private enum CodingKeys: String, CodingKey {
	   
//        case requestId
		case serverTime
		case msg
		case status
		case encodedResposeStr = "response"//renaming of property
	}
	
	var decodedResposeStr:String{
		
		guard encodedResposeStr != nil else {
			return "*** Not foud Response String ***"
		}
		return encodedResposeStr!
		//UtilsCryptor.decryptString(encodedResposeStr!)
	}
	var responseDataDict : [String : Any] {
		let data =  decodedResposeStr.getData()
		if let respDict = data.getResponseDataDict() {
			return respDict
		}
		return ["":""]
	}

	
}

extension  CMResponse{
	
	func getJsonDataFromLocal(inJsonFileName:String) throws -> (Data?){
		
		guard let filePath =  Bundle.main.path(forResource: inJsonFileName, ofType: "json") else {
			return nil
		}
		
		let url = URL(fileURLWithPath: filePath)
		
		do {
			let data = try Data(contentsOf: url)
			return data
		} catch  {
			
			let nserror = error as NSError
			fatalError("*** error trying to convert data to JSON *** \(nserror), \(nserror.userInfo)")
		}
	}
}

