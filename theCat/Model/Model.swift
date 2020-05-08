//
//  Model.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 05.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import Foundation

struct CatImage: Hashable, Codable {
	
	let id: String
	let url: String
	let width: Int
	let height: Int
	
}
