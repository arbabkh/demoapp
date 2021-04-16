//
//  HomeDetailVC.swift
//  DemoApp
//
//  Created by Arbab Ahmed Khan on 16/04/21.
//

import UIKit

class HomeDetailVC: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	var team: CMTeam?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initialSetup()
	}
	
	func initialSetup() {
		tableView.register(UINib.init(nibName: "PlayersBoardTC", bundle: nil), forCellReuseIdentifier: "PlayersBoardTC")
		tableView.register(UINib.init(nibName: "SquadTC", bundle: nil), forCellReuseIdentifier: "SquadTC")
		tableView.reloadData()
	}
	
	// MARK: Actions
	@IBAction func btnBackAction(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
}

// MARK: TableView Datasource and Delegates
extension HomeDetailVC: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.section == 1 {
			let aCell = tableView.dequeueReusableCell(withIdentifier: "PlayersBoardTC", for: indexPath) as! PlayersBoardTC
			aCell.updateCellWithData(inTeam: team ?? CMTeam())
			return aCell
		} else {
			let aCell = tableView.dequeueReusableCell(withIdentifier: "SquadTC", for: indexPath) as! SquadTC
			return aCell
		}
	}
}

extension HomeDetailVC: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.section == 1 {
			guard var count = team?.playerList?.count else { return 0 }
			count = count + 1
			return CGFloat(count * 30)
		} else {
			return 64
		}
	}
}

