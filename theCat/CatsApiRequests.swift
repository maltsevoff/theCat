//
//  CatsApiRequests.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 04.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class CatsApiRequests {
	
	private let apiKey = "d72986b8-2222-454c-b65e-6b2e26421af3"
	private let breedsUrl = "https://api.thecatapi.com/v1/breeds"
	private let baseUrl = "https://api.thecatapi.com/v1/"
	
	func getBreeds(handler: @escaping ([Cat]) -> ()) {
		let stringUrl = self.baseUrl + "breeds"
		guard let url = URL(string: stringUrl) else { return }
		
		var request = URLRequest(url: url)
		request.addValue("x-api-key", forHTTPHeaderField: self.apiKey)
		let task = URLSession.shared.dataTask(with: request) { data, res, error in
			if let data = data {
				let decoder = JSONDecoder()
				decoder.keyDecodingStrategy = .convertFromSnakeCase
				
				let json = try? decoder.decode([Cat].self, from: data)
				handler(json ?? [])
			}
		}
		
		task.resume()
	}
	
	func getImageByBreed(id: String, handler: @escaping (UIImage?) -> ()) {
		let stringUrl = self.baseUrl + "images/search"
		guard let url = URL(string: stringUrl) else { return }
		
		var request = URLRequest(url: url)
		request.addValue("breed_id", forHTTPHeaderField: id)
		let task = URLSession.shared.dataTask(with: request) { data, res, error in
			if let data = data {
				let decoder = JSONDecoder()
				
				let json = try? decoder.decode([CatImage].self, from: data)
				let image = self.parseCatImage(json?.first)
				handler(image)
			} else {
				handler(nil)
			}
		}
		task.resume()
	}
	
	private func parseCatImage(_ catImage: CatImage?) -> UIImage? {
		if let stringUrl = catImage?.url, let url = URL(string: stringUrl) {
			do {
				let imageData = try Data(contentsOf: url)
				let image = UIImage(data: imageData)
				return image
			} catch let error {
				print(error.localizedDescription)
				return nil
			}
		} else {
			return nil
		}
	}
	
}
