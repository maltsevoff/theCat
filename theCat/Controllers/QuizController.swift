//
//  QuizController.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 13.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class QuizController: UIViewController {
	
	@IBOutlet weak var questionImageView: UIImageView!
	
	private let catsApi = CatsApiRequests()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		navigationController?.navigationBar.isHidden = true
	}
}
