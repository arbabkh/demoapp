//
//  HomeVC.swift
//  teamer
//
//  Created by Arbab Ahmed Khan on 15/04/21.
//

import UIKit

class HomeVC: UIViewController {
	@IBOutlet weak var collectionView: UICollectionView!

	let colPadding: CGFloat = 60
	let colItemSpacing: CGFloat = 16

	lazy var presenter: HomePresenter = {
		let aPresenter = HomePresenter(inView: self)
		return  aPresenter
	}()
	var mHome :CMHome?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		initialSetup()
		
	}
	
	func initialSetup() {
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: colPadding/2, bottom: 0, right: colPadding/2)
		collectionView.collectionViewLayout = layout
		collectionView.register(UINib.init(nibName: "HomeCC", bundle: nil), forCellWithReuseIdentifier: "HomeCC")
		presenter.fetchHomeDetail()
	}
	
	func gotoHomeDetail() {
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyTeamVC") as! MyTeamVC
		vc.team = mHome?.teamA
		navigationController?.pushViewController(vc, animated: true)
	}
	
	//MARK: Actions
	@IBAction func btnDetailAction(_ sender: Any) {
		gotoHomeDetail()
	}
	
	

}

	//MARK: Presenter delegate
extension HomeVC: HomePresenterView {
   
	func didFetchHomeDetail(inStatus: Bool, inHome: CMHome?, inMsg: String?) {
		mHome = inHome
		collectionView.reloadData()
	}

}

//MARK: UICollectionView datasource and delegates

extension HomeVC: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return mHome?.itemList?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let aCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCC", for: indexPath as IndexPath) as! HomeCC
		guard let item = mHome?.itemList?[indexPath.item] else { return aCell }
		aCell.updateCellWithData(inItem: item)
		return aCell
	}
	
	
}
extension HomeVC: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		gotoHomeDetail()
	}
}
	
extension HomeVC: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		switch kind {
		case UICollectionView.elementKindSectionHeader:
			guard
				let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeCollectionHeaderView", for: indexPath) as? HomeCollectionHeaderView else {
				fatalError("Invalid view type")
			}
			headerView.updateCellWithData(inHome: mHome ?? CMHome())
			return headerView
		default:
			let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier:"footerView", for: indexPath)
			return footerView
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let itemSize = (collectionView.frame.width - (colPadding + 16)) / 2
		return CGSize(width: itemSize, height: itemSize + 20)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return colItemSpacing * 2 - 8
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return colItemSpacing
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: (collectionView.frame.width - colPadding), height: 321)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		return CGSize(width: (collectionView.frame.width - colPadding), height: 46)
	}
	
}

