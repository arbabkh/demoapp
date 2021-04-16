//
//  GExtensions.swift
//  DemoApp
//
//  Created by Arbab Ahmed Khan on 16/04/21.
//

import Foundation

extension String {
	
	func getData() -> Data {
		return Data(self.utf8)
		
	}
	func getHomeDataModel() -> CMHome? {
		
		var response:CMHome?
		do{
			response = try JSONDecoder().decode(CMHome.self,from: self.getData())
		}
		catch  {
			let nserror = error as NSError
			print("*** CMHome data model is not created  *** \(nserror), \(nserror.userInfo)")
//			fatalError("*** CMHome data model is not created  *** \(nserror), \(nserror.userInfo)")
			
		}
		return response;
	}

}

extension Data {
		
	func getString() -> String {
		return String(data:  self, encoding: .utf8) ?? "not formated"
	}
	
	func getResponseDataModel() -> CMResponse? {
		
		var response:CMResponse?
		do{
			response = try JSONDecoder().decode(CMResponse.self,from: self)
		}
		catch  {
			let nserror = error as NSError
			print("*** CMResponse data model is not created  *** \(nserror), \(nserror.userInfo)")
//			fatalError("*** CMResponse data model is not created  *** \(nserror), \(nserror.userInfo)")
		}
		return response;
	}
	
	func getResponseDataDict() -> [String : Any]? {
		
		var aResponseDataDict:[String : Any]?
		
		do {
			guard let  aDataDict = try JSONSerialization.jsonObject(with: self, options: []) as? [String : Any]
				else {
					print("*** json is not in correct format ***")
					return nil
			}
			aResponseDataDict = aDataDict
			
		} catch  {
			let nserror = error as NSError
			print("*** error trying to convert data to JSON *** \(nserror), \(nserror.userInfo)")
//			fatalError("*** error trying to convert data to JSON *** \(nserror), \(nserror.userInfo)")
			
		}
		return  aResponseDataDict
	}
}
