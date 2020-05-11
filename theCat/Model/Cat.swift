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
	
}
