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
    let defaults = UserDefaults.standard
    
    //MARK: - IB Outlets
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var questionStackView: UIStackView!
    @IBOutlet var questionButtons: [UIButton]!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
//    var whoseQuestion: WhoseQuestion?
    
    // MARK: - Private Properties
//    private let questions = QuestionDefaults.QuestionData()
//    private var questionIndex = 0
//    private var answersChoosen: [Answer] = []
//    private var currentAnswers: [QuestionDefaults] {
//        questions.answers!
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
//        getDataFromFile()
//        questionLabel.text = QuestionDefaults.questionModel.question
        
        if defaults.bool(forKey: "First Launch") == true {
//            getDataFromFile()
            questionLabel.text = QuestionDefaults.shared.dataStorage.question
            showQuestinAnswers(with: QuestionDefaults.shared.dataStorage.answers!)
            defaults.set(true, forKey: "First Launch")
            print("Second")
        } else {
            getDataFromFile()
            questionLabel.text = QuestionDefaults.shared.dataStorage.question
            showQuestinAnswers(with: QuestionDefaults.shared.dataStorage.answers!)
            defaults.set(true, forKey: "First Launch")
            print("First")
        }
        
//        updateUI()
        
        
//        let fetchRequest: NSFetchRequest<QuestionIlnar> = QuestionIlnar.fetchRequest()
//
//
//        do {
//            let results = try context.fetch(fetchRequest)
//            let question = results.first
//            insertDataFrom(selectedQuestion: question!)
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
        
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
    
    private func showQuestinAnswers(with answers: [QuestionDefaults.Answer]) {

        for (button, answer) in zip(questionButtons, answers) {
            button.setTitle(answer.text, for: .normal)
            button.layer.cornerRadius = 10
            button.backgroundColor = .systemYellow
            button.tintColor = .black
            print(answer)
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
//        let fetchRequest: NSFetchRequest<QuestionIlnar> = QuestionIlnar.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "question != nil")
//
//        var records = 0
//
//        do {
//            records = try context.count(for: fetchRequest)
//            print("Is Data there already?")
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//
//        guard records == 0 else { return }
        
        guard let pathToFile = Bundle.main.path(forResource: "Questions", ofType: "plist"),
              let dataArray = NSArray(contentsOfFile: pathToFile) else {return}
        
        for dictionary in dataArray {
            let entity = NSEntityDescription.entity(forEntityName: "QuestionIlnar", in: context)
            let questions = NSManagedObject(entity: entity!, insertInto: context) as! QuestionIlnar
            
            let questionsDictionary = dictionary as! NSDictionary
            let questionOneDictionary = questionsDictionary["questionOne"] as! NSDictionary
            questions.question = questionOneDictionary["question"] as? String
            
            let answersDictionary = questionsDictionary["questionOne"] as! NSDictionary
            let answerDictionary = answersDictionary["answers"] as! NSArray
            
            for answers in answerDictionary {
                let answer = answers as! NSDictionary
                questions.answer = answer["answer"] as? String
                QuestionDefaults.shared.storageAnswer.text = questions.answer
//                QuestionDefaults.shared.saveAnswer(answer: questions.answer ?? "")
                
//                print(questions.answer)
                print(QuestionDefaults.shared.storageAnswer.text)
            }
            
            QuestionDefaults.shared.saveQuestion(question: questions.question)
            
            
            print(questions.question)
            //            QuestionDefaults.shared.saveQuestion(question: questions.question, answer: questions.answer)
        }
        
    }
    
//    private func insertDataFrom(selectedQuestion question: QuestionDefaults) {
//        questionLabel.text = QuestionDefaults.shared.questions.first?.question
//        showQuestinAnswers(with: QuestionDefaults.shared.questions)
//    
//    }
}
