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
	
	private let catsManager = CatsManager()
	private let alertMessage = "Ouuups... Something went wrong. Let's playe another time."
	private var question: Question?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationItem.leftBarButtonItem = UIBarButtonItem()
		let newEndButton = UIBarButtonItem(title: "End", style: .plain, target: self, action: #selector(popThisController))
		newEndButton.tintColor = .white
		self.navigationItem.rightBarButtonItem = newEndButton
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
		guard let newQuestion = catsManager.createNewQuestion() else {
			showErrorAlert()
			return
		}
		self.question = newQuestion
		loadImageFor(breedId: newQuestion.breedId)
		answerButtons.forEach { button in
			button.resetColor()
			button.isEnabled = true
		}
		setNewAnswers()
		print(newQuestion)
	}
	
	private func checkAnswer(_ answer: String) {
		guard let rightAnswer = self.question?.rightAnswer else { return }
		self.answerButtons.forEach { button in
			button.isEnabled = false
			if button.answer == rightAnswer {
				button.setCorrectAnsweColor()
			} else if button.answer == answer {
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
		catsManager.getImageBy(breedId: breedId) { image in
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
	
	@objc private func popThisController() {
		let transition: CATransition = CATransition()
		transition.duration = 0.5
		transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
		transition.type = CATransitionType.push
		transition.subtype = CATransitionSubtype.fromBottom
		navigationController?.view.layer.add(transition, forKey: kCATransition)
		navigationController?.popViewController(animated: true)
	}
	
	private func showErrorAlert() {
		let alert = UIAlertController(title: "Error", message: alertMessage, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .default) { _ in
			self.popThisController()
		}
		alert.addAction(okAction)
		present(alert, animated: true)
	}
}
