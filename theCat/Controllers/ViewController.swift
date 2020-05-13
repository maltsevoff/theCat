//
//  ViewController.swift
//  theCat
//
//  Created by Aleksandr Maltsev on 04.05.2020.
//  Copyright © 2020 Aleksandr Maltsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var catsTableView: UITableView!
	private let quizButton = QuizButton()
	
	private var cats: [Cat] = [] {
		didSet {
			self.catsTableView.reloadData()
		}
	}
	private let catNameCellId = "CatNameCell"
	private let catDetailControllerId = "CatDetailController"
	private let quizControllerId = "QuizController"
	private let catsManager = CatsManager()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		self.catsTableView.delegate = self
		self.catsTableView.dataSource = self
		self.catsManager.delegate = self
		self.catsManager.updateCatsList()
		setTitle()
		setQuizButton()
	}
	
	private func setTitle() {
		navigationItem.title = "Cats 🐈"
	}
	
	private func setQuizButton() {
		view.addSubview(quizButton)
		quizButton.translatesAutoresizingMaskIntoConstraints = false
		quizButton.bottomAnchor.constraint(equalTo: catsTableView.bottomAnchor, constant: -10).isActive = true
		quizButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
		quizButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
		quizButton.centerXAnchor.constraint(equalTo: catsTableView.centerXAnchor).isActive = true
		quizButton.addTarget(self, action: #selector(quizButtonDidSet(_:)), for: .touchUpInside)
	}
	
	@objc private func quizButtonDidSet(_ sender: UIButton!) {
		showQuizController()
	}
	
	private func showCatDetailController(for cat: Cat) {
		let vc = storyboard?.instantiateViewController(withIdentifier: self.catDetailControllerId) as! CatDetailController
		vc.cat = cat
		navigationController?.pushViewController(vc, animated: true)
	}
	
	private func showQuizController() {
		let vc = storyboard?.instantiateViewController(withIdentifier: self.quizControllerId) as! QuizController
		let transition:CATransition = CATransition()
		transition.duration = 0.5
		transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
		transition.type = CATransitionType.push
		transition.subtype = CATransitionSubtype.fromTop
		navigationController?.view.layer.add(transition, forKey: kCATransition)
		navigationController?.popViewController(animated: true)
		navigationController?.pushViewController(vc, animated: true)
	}
	
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		self.cats.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = self.catsTableView.dequeueReusableCell(withIdentifier: self.catNameCellId, for: indexPath) as! CatNameCell
		cell.name = self.cats[indexPath.row].name
		cell.origin = self.cats[indexPath.row].origin
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cat = self.cats[indexPath.row]
		self.catsTableView.deselectRow(at: indexPath, animated: true)
		self.showCatDetailController(for: cat)
	}
}

extension ViewController: CatsManagerDelegate {
	
	func didUpdateCatsList(newCats: [Cat]) {
		self.cats = newCats
	}
	
}
