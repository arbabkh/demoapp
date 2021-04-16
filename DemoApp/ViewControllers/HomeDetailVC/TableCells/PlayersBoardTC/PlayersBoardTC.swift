//
//  PlayersBoardTC.swift
//  DemoApp
//
//  Created by Arbab Ahmed Khan on 16/04/21.
//

import UIKit

class PlayersBoardTC: UITableViewCell {
	@IBOutlet weak var tableView: UITableView!
	
	var mTeam: CMTeam?
	
	lazy var playerScoreHV : PlayerScoreHV = {
		var playerScoreHV = Bundle.main.loadNibNamed("PlayerScoreHV", owner: nil, options: nil)?.first as? PlayerScoreHV
		return playerScoreHV!
	}()
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		tableView.register(UINib.init(nibName: "PlayerScoreTC", bundle: nil), forCellReuseIdentifier: "PlayerScoreTC")
		
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
	func updateCellWithData(inTeam: CMTeam) {
		mTeam = inTeam
		tableView.reloadData()
	}
	
}

// MARK: TableView Datasource and Delegates
extension PlayersBoardTC: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return mTeam?.playerList?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let aCell = tableView.dequeueReusableCell(withIdentifier: "PlayerScoreTC", for: indexPath) as! PlayerScoreTC
		guard let player = mTeam?.playerList?[indexPath.row] else { return aCell }
		aCell.updateCellWithData(inPlayer: player)
		return aCell
	}
}
extension PlayersBoardTC: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 30
	}
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 30
	}
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		// set up your footer view
		return playerScoreHV
		
	}
}

