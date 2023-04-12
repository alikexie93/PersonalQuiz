//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Алексей Филиппов on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
    }
    
}

private extension ResultViewController {
    func calculateResult() {
        var countOfAnswers: [Animal: Int] = [:]
        let answerTypes = answers.map { $0.animal }
        
        for answer in answerTypes {
            if let animalTypeCount = countOfAnswers[answer] {
                countOfAnswers.updateValue(animalTypeCount + 1, forKey: answer)
            } else {
                countOfAnswers[answer] = 1
            }
        }
        
        let countAnswersSorted = countOfAnswers.sorted { $0.value > $1.value }
        guard let commonAnswer = countAnswersSorted.first?.key else { return }
        
        updateUI(with: commonAnswer)
    }
    
    private func updateUI(with animal: Animal) {
        resultAnimalLabel.text = "Вы - \(animal.rawValue)"
        resultDefinitionLabel.text = animal.definition
    }
}
