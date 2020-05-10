//
//  CatNameCell.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 09.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class CatNameCell: UITableViewCell {
	
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var originLabel: UILabel!
	
	var name: String? {
		didSet {
			self.nameLabel.text = name
		}
	}
	
	var origin: String? {
		didSet {
			self.originLabel.text = origin
		}
	}
}
