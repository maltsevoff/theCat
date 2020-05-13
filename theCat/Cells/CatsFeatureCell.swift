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
	@IBOutlet weak var firstCircleImage: UIImageView!
	@IBOutlet weak var secondCircleImage: UIImageView!
	@IBOutlet weak var thirdCircleImage: UIImageView!
	@IBOutlet weak var fourthCircleImage: UIImageView!
	@IBOutlet weak var fifthCircleImage: UIImageView!
	
	var feature: String? {
		didSet {
			self.featureLabel.text = feature
		}
	}
	
	var featureValue: Int? {
		didSet {
			if let value = featureValue {
				self.fillFeatureCircles(value: value)
			}
		}
	}
	
	private var allCircles: [UIImageView] {
		[
			firstCircleImage,
			secondCircleImage,
			thirdCircleImage,
			fourthCircleImage,
			fifthCircleImage
		]
	}
	
	private func fillFeatureCircles(value: Int) {
		let circles = self.allCircles
		
		circles[0...(value - 1)].forEach { elem in
			elem.tintColor = .orange
		}
	}
}
