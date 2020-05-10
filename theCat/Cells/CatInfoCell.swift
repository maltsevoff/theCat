//
//  CatInfoCell.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 10.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class CatInfoCell: UITableViewCell {
	
	@IBOutlet weak var breedLabel: UILabel!
	@IBOutlet weak var originLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var temperamentLabel: UILabel!
	
	var breed: String? {
		didSet {
			self.breedLabel.text = breed
		}
	}
	var origin: String? {
		didSet {
			self.originLabel.text = origin
		}
	}
	var catDescription: String? {
		didSet {
			self.descriptionLabel.text = catDescription
		}
	}
	var temperament: String? {
		didSet {
			self.temperamentLabel.text = temperament
		}
	}
}
