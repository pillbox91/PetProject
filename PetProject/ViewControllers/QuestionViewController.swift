//
//  QuestionViewController.swift
//  PetProject
//
//  Created by Андрей Аверьянов on 10.01.2022.
//

import UIKit
import CoreData

class QuestionViewController: UIViewController {
    
    var context: NSManagedObjectContext!
    
    //MARK: - IB Outlets
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var questionStackView: UIStackView!
    @IBOutlet var questionButtons: [UIButton]!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
//    var whoseQuestion: WhoseQuestion?
    
    // MARK: - Private Properties
//    private let questions = Question.getQuestion()
//    private var questionIndex = 0
//    private var answersChoosen: [Answer] = []
//    private var currentAnswers: [Answer] {
//        questions[questionIndex].answers
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        
//        updateUI()
        getDataFromFile()
        
        let fetchRequest: NSFetchRequest<QuestionIlnar> = QuestionIlnar.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "question == %@")
        
        do {
            let results = try context.fetch(fetchRequest)
            let question = results.first
            insertDataFrom(selectedQuestion: question!)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        UIView.animate(withDuration: 0.5, delay: 0) { [self] in
            
//            guard let currentIndex = questionButtons.firstIndex(of: sender) else {return}
//            let currentAnswer = currentAnswers[currentIndex]
//            answersChoosen.append(currentAnswer)
//
//            switch sender.tag {
//            case 0: self.showRightQuestionAnswer(answer: currentAnswer, with: sender)
//            case 1: self.showRightQuestionAnswer(answer: currentAnswer, with: sender)
//            case 2: self.showRightQuestionAnswer(answer: currentAnswer, with: sender)
//            case 3: self.showRightQuestionAnswer(answer: currentAnswer, with: sender)
//            default:
//                break
//            }
            
        } completion: { done in
            if done {
                self.nextQuestion()
            }
        }
//        print(answersChoosen)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultViewController
//        resultVC.answers = answersChoosen
    }
    
    
}

// MARK: - Private Methods
extension QuestionViewController {
    private func updateUI() {
        
//        if whoseQuestion == .Ilnar {
//        let currentQuestion = questions[questionIndex]
//            questionLabel.text = currentQuestion.text
//            showQuestinAnswers(with: currentAnswers)
//        } else if whoseQuestion == .Astafiev {
//            let currentQuestion = questions[questionIndex]
//            questionLabel.text = currentQuestion.text
//            showQuestinAnswers(with: currentAnswers)
//        }
        
//        let totalProgress = Float(questionIndex) / Float(questions.count)
//        questionProgressView.setProgress(totalProgress, animated: true)
//
//        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
//        showWhoseCurrentAnswers(for: currentQuestion.whoseQuestion)
    }
    
//    private func showWhoseCurrentAnswers(for whoseQuestion: WhoseQuestion) {
//        switch whoseQuestion {
//        case .Ilnar:
////            showQuestinAnswers(with: currentAnswers)
//            print(whoseQuestion)
//        case .Astafiev:
////            showQuestinAnswers(with: currentAnswers)
//            print(whoseQuestion)
//        }
//    }
    
    private func showQuestinAnswers(with answers: [Answer]) {
        
        for (button, answer) in zip(questionButtons, answers) {
            button.setTitle(answer.text, for: .normal)
            button.layer.cornerRadius = 10
            button.backgroundColor = .systemYellow
            button.tintColor = .black
        }
    }
    
    private func showRightQuestionAnswer(answer: Answer, with button: UIButton) {
        
        if answer.rightAnswer == .trueAnswer{
            button.backgroundColor = .green
        } else if answer.rightAnswer == .falseAnswer {
            button.backgroundColor = .red
        }
    }
    
    private func nextQuestion() {
        //        self.questionIndex += 1
        
        //        if self.questionIndex < self.questions.count {
        //                self.updateUI()
        //        } else {
        self.performSegue(withIdentifier: "resultSegue", sender: nil)
        //        }
        print("nextQuestion")
    }
    
    private func getDataFromFile() {
        let fetchRequest: NSFetchRequest<QuestionIlnar> = QuestionIlnar.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "mark != nil")
        
        guard let pathToFile = Bundle.main.path(forResource: "Questions", ofType: "plist"),
              let dataArray = NSArray(contentsOfFile: pathToFile) else {return}
        
        for dictionary in dataArray {
            let entity = NSEntityDescription.entity(forEntityName: "QuestionIlnar", in: context)
            let questions = NSManagedObject(entity: entity!, insertInto: context) as! QuestionIlnar
            
            let questionsDictionary = dictionary as! [String : AnyObject]
            questions.question = questionsDictionary["question"] as? String
            
            
        }
    }
    
    private func insertDataFrom(selectedQuestion question: QuestionIlnar) {
        questionLabel.text = question.question
    }
}
