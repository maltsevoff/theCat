//
//  QuizController.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 13.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class QuizController: UIViewController {
	
	@IBOutlet var answerButtons: [AnswerButton]!
	@IBOutlet weak var questionImageView: UIImageView!
	@IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
	
	@IBAction func firstButtonPressed(_ sender: AnswerButton) {
		self.checkAnswer(sender.answer!)
	}
	@IBAction func secondButtonPressed(_ sender: AnswerButton) {
		self.checkAnswer(sender.answer!)
	}
	@IBAction func thirdButtonPressed(_ sender: AnswerButton) {
		self.checkAnswer(sender.answer!)
	}
	@IBAction func fourthButtonPressed(_ sender: AnswerButton) {
		self.checkAnswer(sender.answer!)
	}
	
	private let catsApi = CatsApiRequests()
	private let catsManager = CatsManager()
	private let alertMessage = "Ouuups... Something went wrong. Let's playe another time."
	private var question: Question?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		navigationController?.navigationBar.isHidden = true
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		createNewQuestion()
	}
	
	private func setNewAnswers() {
		guard let answerOptions = self.question?.answerOptions else { return }
		for (index, button) in self.answerButtons.enumerated() {
			guard answerOptions.indices.contains(index),
				let answer = self.question?.answerOptions[index] else { break }
			
			button.setAnswer(answer)
		}
	}
	
	private func createNewQuestion() {
		question = catsManager.createNewQuestion()
		loadImageFor(breedId: question!.breedId)
		answerButtons.forEach { button in
			button.resetColor()
			button.isEnabled = true
		}
		setNewAnswers()
		print(question ?? "--No question--")
	}
	
	private func checkAnswer(_ answer: String) {
		guard let rightAnswer = self.question?.rightAnswer else { return }
		self.answerButtons.forEach { button in
			button.isEnabled = false
			if button.titleLabel?.text == rightAnswer {
				button.setCorrectAnsweColor()
			} else if button.titleLabel?.text == answer {
				button.setWrongAnswerColor()
			}
		}
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.createNewQuestion()
		}
	}
	
	private func startLoadingAnimation() {
		self.imageActivityIndicator.isHidden = false
		self.imageActivityIndicator.startAnimating()
	}
	
	private func stopLoadingAnimation() {
		self.imageActivityIndicator.isHidden = true
		self.imageActivityIndicator.stopAnimating()
	}
	
	private func loadImageFor(breedId: String) {
		self.questionImageView.image = nil
		self.startLoadingAnimation()
		catsApi.getImageByBreed(id: breedId) { image in
			DispatchQueue.main.async {
				self.stopLoadingAnimation()
				if let validImage = image {
					self.questionImageView.image = validImage
				} else {
					self.showErrorAlert()
				}
			}
		}
	}
	
	private func showErrorAlert() {
		let alert = UIAlertController(title: "Error", message: alertMessage, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alert.addAction(okAction)
		present(alert, animated: true)
	}
}
