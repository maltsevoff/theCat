//
//  CatDetailController.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 10.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class CatDetailController: UIViewController {
	
	@IBOutlet weak var detailTableView: UITableView!
	
	private let cellId = "CatInfoCell"
	var cat: Cat?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.detailTableView.delegate = self
		self.detailTableView.dataSource = self
		setTitle()
	}
	
	private func setTitle() {
		navigationItem.title = cat?.name
	}
}

extension CatDetailController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = self.detailTableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! CatInfoCell
		cell.breed = self.cat?.name
		cell.origin = self.cat?.countryCode
		cell.temperament = self.cat?.temperament
		cell.catDescription = self.cat?.description
		
		return cell
	}
	
}
