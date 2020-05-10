//
//  MainNavigationController.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 10.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
	
	private let orangeColor: UIColor = .orange
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationBar.barTintColor = orangeColor
	}
}
