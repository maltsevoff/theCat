//
//  QuizButton.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 13.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class QuizButton: UIButton {
	
	private let shadowColor = UIColor.black.cgColor
	
	init() {
		super.init(frame: .zero)
		
		backgroundColor = .orange
		setText()
		addShadow()
		roundCorners()
	}
	
	private func setText() {
		titleLabel?.textColor = .black
		titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
		setTitle("QUIZ", for: .normal)
	}
	
	private func addShadow() {
		layer.shadowColor = shadowColor
		layer.shadowOffset = CGSize(width: 0, height: 4)
		layer.shadowOpacity = 0.5
		layer.shadowRadius = 20
	}
	
	private func roundCorners() {
		layer.cornerRadius = 20
		layer.masksToBounds = true
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
