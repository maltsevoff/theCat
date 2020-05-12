//
//  CatsFeatureCell.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 12.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class CatsFeatureCell: UITableViewCell {
	
	@IBOutlet weak var featureLabel: UILabel!
	
	var feature: String? {
		didSet {
			self.featureLabel.text = feature
		}
	}
}
