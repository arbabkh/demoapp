//
//  HomePresenter.swift
//  DemoApp
//
//  Created by Arbab Ahmed Khan on 16/04/21.
//

import UIKit

protocol HomePresenterView : class  {
	
	func didFetchHomeDetail(inStatus: Bool, inHome: CMHome?, inMsg: String?)
	
}

@objc class HomePresenter: NSObject {
	
	private weak var view: HomePresenterView?
	
	init(inView: HomePresenterView) {
		super.init()
		view =  inView
		
	}
	func fetchHomeDetail()  {
		let respone = CMResponse()
		let data =  try? respone.getJsonDataFromLocal(inJsonFileName: "home")
		guard (data != nil) else {
			return
		}
		let homeJson = data?.getString()
		let home = homeJson?.getHomeDataModel()
		view?.didFetchHomeDetail(inStatus: true, inHome: home, inMsg: nil)
	}
	
	func handleHomeDataResponse(inResponse:[String:Any]) {
		
	}
	
}
