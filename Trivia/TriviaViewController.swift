//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Anthony Campos on 10/5/23.
//

import Foundation

import UIKit

class TriviaViewController: UIViewController {
    var selectedAnswer: String = ""
    var userScore: Int = 0

    let questions = ["What color is the sky?", "Which is not a country?", "Which of the following is a mammal?"]
    let answers = [
        ["Red", "Green", "Blue", "Yellow"],
        ["Lesotho", "Narnia", "Andorra", "The United States"],
        ["Goldfish", "Oyster", "Octapus", "Platypus"]
    ]
    let correctAnswers = ["Blue", "Narnia", "Platypus"]

    var currentQuestionIndex = 0

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionIndex = 0
        updateUI()
    }

    func updateUI() {
           if currentQuestionIndex < questions.count {
               questionLabel.text = questions[currentQuestionIndex]

               for (index, button) in answerButtons.enumerated() {
                   button.setTitle(answers[currentQuestionIndex][index], for: .normal)
               }
           } else {
               showAlert(message: "Trivia Completed!")
           }
    }

    @IBAction func answerButtonTapped(_ sender: UIButton) {
        if currentQuestionIndex < questions.count - 1 {
                currentQuestionIndex += 1
                updateUI()
                let correctAnswer = correctAnswers[currentQuestionIndex]
                if selectedAnswer == correctAnswer {
                        userScore += 1
                    }
        } else {
            showAlert(message: "Trivia Completed!")
            }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Trivia", message: "\(message)\nYour Score: \(userScore)", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "Answer1Segue" {
                let correctAnswer = correctAnswers[currentQuestionIndex]

                if selectedAnswer == correctAnswer {
                    userScore += 1
                }
            } else if identifier == "Answer2Segue" {
                let correctAnswer = correctAnswers[currentQuestionIndex]

                if selectedAnswer == correctAnswer {
                    userScore += 1
                }
            } else if identifier == "Answer3Segue" {
                let correctAnswer = correctAnswers[currentQuestionIndex]

                if selectedAnswer == correctAnswer {
                    userScore += 1
                }
            } else if identifier == "Answer4Segue" {
                let correctAnswer = correctAnswers[currentQuestionIndex]

                if selectedAnswer == correctAnswer {
                    userScore += 1
                }
            }
        }
    }

}
