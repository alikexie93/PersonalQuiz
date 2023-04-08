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
    
    var answers = [Answer]()

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
        let answerTypes = answers.map{ $0.animal }
        
        for answer in answerTypes {
            countOfAnswers[answer] = (countOfAnswers[answer] ?? 0) + 1
        }
        
        let countAnswersSorted = countOfAnswers.sorted(
            by: {
                (animalOne, animalTwo) -> Bool in
                    return animalOne.value > animalTwo.value
            }
        )
        
        let commonAnswer = countAnswersSorted.first!.key
        
        resultAnimalLabel.text = "Вы - \(commonAnswer.rawValue)"
        resultDefinitionLabel.text = commonAnswer.definition
    }
}
