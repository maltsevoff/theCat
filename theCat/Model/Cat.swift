//
//  Cat.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 07.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import Foundation

struct Cat: Hashable, Codable {
	
	let id: String
	let name: String
	let origin: String
	let temperament: String
	let description: String
	let countryCode: String
	let wikipediaUrl: String?
	let rare: Int
	let childFriendly: Int?
	let dogFriendly: Int?
	let intelligence: Int?
	let strangerFriendly: Int?
	
	var isRare: Bool { self.rare == 1 }
	
	private var allFeatures: [(String, Int?)] {
		[
			("Child friendly", self.childFriendly),
			("Dog friendly", self.dogFriendly),
			("Intelligence", self.intelligence),
			("Stranger friendly", self.strangerFriendly),
		]
	}
	
	func createFeatures() -> [(String, Int)] {
		let features = self.allFeatures.filter { $0.1 != nil }.map { ($0.0, $0.1!)}
		
		let validFeatures = features.filter { $0.1 >= 0 && $0.1 <= 5}
		return validFeatures
	}
}
