//
//  CatsManager.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 07.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import Foundation

protocol CatsManagerDelegate: class {
	func didUpdateCatsList(newCats: [Cat])
}

class CatsManager {
	
	var delegate: CatsManagerDelegate?
	
	private var cats: [Cat] = []
	private var catsApi = CatsApiRequests()
	private var currentPage: Int = 0
	
	func updateCatsList() {
		catsApi.getBreeds() { newCats in
			DispatchQueue.main.async {
				self.cats = newCats
				self.delegate?.didUpdateCatsList(newCats: self.cats)
			}
		}
	}
}
