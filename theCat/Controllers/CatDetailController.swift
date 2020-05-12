//
//  CatDetailController.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 10.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class CatDetailController: UIViewController {
	
	private enum CellType {
		case main
		case feature
	}
	
	@IBOutlet weak var detailTableView: UITableView!
	
	private let mainCellId = "CatInfoCell"
	private let featureCellId = "CatsFeatureCell"
	private var features: [(String, Int)] = []
	private var cells: [CellType] = []
	var cat: Cat!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setTitle()
		getFeatures()
		setCells()
		self.detailTableView.delegate = self
		self.detailTableView.dataSource = self
	}
	
	private func setTitle() {
		navigationItem.title = cat.name
	}
	
	private func getFeatures() {
		self.features = self.cat.createFeatures()
	}
	
	private func setCells() {
		self.cells = [CellType.main] + Array(repeating: .feature, count: self.features.count)
	}
}

extension CatDetailController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cells.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let currentCellType = self.cells[indexPath.row]
		
		switch currentCellType {
		case .main:
			return self.createMainCell(indexPath: indexPath)
		case .feature:
			return self.createFeatureCell(indexPath: indexPath)
		}
	}
	
	private func createMainCell(indexPath: IndexPath) -> UITableViewCell {
		let cell = self.detailTableView.dequeueReusableCell(withIdentifier: self.mainCellId, for: indexPath) as! CatInfoCell
		cell.breed = self.cat?.name
		cell.origin = self.cat?.countryCode
		cell.temperament = self.cat?.temperament
		cell.catDescription = self.cat?.description
		cell.wikipediaLink = self.cat?.wikipediaUrl
		cell.selectionStyle = .none
		
		return cell
	}
	
	private func createFeatureCell(indexPath: IndexPath) -> UITableViewCell {
		let cellFeature = self.features[indexPath.row - 1]
		let cell = self.detailTableView.dequeueReusableCell(withIdentifier: self.featureCellId, for: indexPath) as! CatsFeatureCell
		cell.feature = cellFeature.0
		
		return cell
	}
	
}
