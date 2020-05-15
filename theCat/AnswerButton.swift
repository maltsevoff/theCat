//
//  AnswerButton.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 14.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class AnswerButton: UIButton {
	
	var answer: String?
	private let shadowColor = UIColor.black.cgColor
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		addRoundCorners(radius: 5)
		setFont()
		addShadow()
	}
	
	func setAnswer(_ answer: String) {
		self.answer = answer
		setTitle(answer, for: .normal)
	}
	
	func setCorrectAnsweColor() {
		backgroundColor = .green
	}
	
	func setWrongAnswerColor() {
		backgroundColor = .red
	}
	
	func resetColor() {
		backgroundColor = .orange
	}
	
	private func addRoundCorners(radius: CGFloat) {
		layer.cornerRadius = radius
	}
	
	private func setFont() {
		titleLabel?.font = UIFont.systemFont(ofSize: 15)
		setTitleColor(.white, for: .normal)
	}
	
	private func addShadow() {
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOpacity = 0.2
		layer.shadowOffset = CGSize(width: 0, height: 4)
		layer.shadowRadius = 5
	}
}
