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
	@IBOutlet weak var wikipediaButton: UIButton!
	@IBAction func wikipediaButtonDidPress(_ sender: UIButton) {
		openWikiLink()
	}
	
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
	var wikipediaLink: String? {
		didSet {
			checkWikipediaLink()
		}
	}
	
	private func checkWikipediaLink() {
		if self.wikipediaLink == nil {
			self.wikipediaButton.isHidden = true
		}
	}
	
	private func openWikiLink() {
		guard let stringUrl = self.wikipediaLink,
			let url = URL(string: stringUrl) else { return }
		UIApplication.shared.open(url)
	}
}
