//
//  QuestionViewController.swift
//  PetProject
//
//  Created by Андрей Аверьянов on 10.01.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var questionStackView: UIStackView!
    @IBOutlet var questionButtons: [UIButton]!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    // MARK: - Private Properties
    private let questions = Question.getQuestion()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 2, delay: 0) {
            switch sender.tag {
            case 0: self.showRightQuestionAnswer(with: sender)
            case 1: self.showRightQuestionAnswer(with: self.currentAnswers, with: sender)
            case 2: self.showRightQuestionAnswer(with: self.currentAnswers, with: sender)
            case 3: self.showRightQuestionAnswer(with: self.currentAnswers, with: sender)
            default:
                break
            }
//            self.showRightQuestionAnswer(with: self.currentAnswers)
        } completion: { done in
            if done {
                self.nextQuestion()
            }
        }
    }
    
    // MARK: - Navigation
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        let resultVC = segue.destination as! ResultViewController
    //
    //
    
    
}

// MARK: - Private Methods
extension QuestionViewController {
    private func updateUI() {
        
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.text
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        showQuestinAnswers(with: currentAnswers)
        print("updateUI")
    }
    
    private func showQuestinAnswers(with answers: [Answer]) {
        
        for (button, answer) in zip(questionButtons, answers) {
            button.setTitle(answer.text, for: .normal)
            button.backgroundColor = .systemYellow
        }
    }
    
    private func showRightQuestionAnswer(answer: Answer, with button: UIButton) {
            switch answer.rightAnswer {
            case .trueAnswer:
                button.backgroundColor = .green
            case .falseAnswer:
                button.backgroundColor = .red
        }
    }
    
    private func nextQuestion() {
            self.questionIndex += 1

            if self.questionIndex < self.questions.count {
                self.updateUI()
        } else {
            self.performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        print("nextQuestion")
    }
}
