//
//  CatsManager.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 07.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import UIKit

protocol CatsManagerDelegate: class {
	func didUpdateCatsList(newCats: [Cat])
}

var cats: [Cat] = []

class CatsManager {
	
	var delegate: CatsManagerDelegate?
	
	private var catsApi = CatsApiRequests()
	
	func updateCatsList() {
		catsApi.getBreeds() { newCats in
			DispatchQueue.main.async {
				cats = newCats
				self.delegate?.didUpdateCatsList(newCats: newCats)
			}
		}
	}
	
	func createNewQuestion() -> Question? {
		let shuffled = cats.shuffled()
		guard shuffled.count >= 4 else { return nil }
		
		let fourCats = shuffled[0..<4]
		let options = fourCats.map { $0.name }
		let randomNum = Int.random(in: 0..<4)
		
		let question = Question(answerOptions: options,
								rightAnswer: options[randomNum],
								breedId: fourCats[randomNum].id)
		return question
	}
	
	func getImageBy(breedId: String, handler: @escaping (UIImage?) -> ()) {
		catsApi.getImageByBreed(id: breedId) { catImage in
			if let stringUrl = catImage?.url, let url = URL(string: stringUrl) {
				do {
					let imageData = try Data(contentsOf: url)
					let image = UIImage(data: imageData)
					handler(image)
				} catch let error {
					print(error.localizedDescription)
					handler(nil)
				}
			} else {
				handler(nil)
			}
		}
	}
}
