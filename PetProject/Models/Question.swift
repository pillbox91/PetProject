//
//  Question.swift
//  PetProject
//
//  Created by Андрей Аверьянов on 14.01.2022.
//
//import Foundation
//
//class Question: NSObject, NSCoding {
//    
//    var question: String
//    
//    init(question: String) {
//        self.question = question
//    }
//    
//    func encode(with coder: NSCoder) {
//        coder.encode(question, forKey: "question")
//    }
//    
//    required init?(coder: NSCoder) {
//        question = coder.decodeObject(forKey: "question") as? String ?? ""
//    }
//}



//enum WhoseQuestion {
//    case Ilnar
//    case Astafiev
//}

//struct Question {
//    let whoseQuestion: WhoseQuestion
//    let text: String
//    let answers: [Answer]
//
//}

//extension Question {
//    static func getQuestion() -> [Question] {
//        return [
//            Question(whoseQuestion: .Ilnar,
//                     text: "На какой машине я езжу?",
//                     answers: [
//                        Answer(text: "VOLVO S60", rightAnswer: .trueAnswer),
//                        Answer(text: "BMW", rightAnswer: .falseAnswer),
//                        Answer(text: "LADA", rightAnswer: .falseAnswer),
//                        Answer(text: "KIA", rightAnswer: .falseAnswer)
//                     ]),
//            Question(whoseQuestion: .Ilnar,
//                     text: "Какую машину я хочу?",
//                     answers: [
//                        Answer(text: "BMW", rightAnswer: .falseAnswer),
//                        Answer(text: "VOLVO XC90", rightAnswer: .trueAnswer),
//                        Answer(text: "KIA", rightAnswer: .falseAnswer),
//                        Answer(text: "LADA", rightAnswer: .falseAnswer)
//                     ]),
//            Question(whoseQuestion: .Astafiev,
//                     text: "Что за?",
//                     answers: [
//                        Answer(text: "true", rightAnswer: .trueAnswer),
//                        Answer(text: "false", rightAnswer: .falseAnswer),
//                        Answer(text: "flase", rightAnswer: .falseAnswer),
//                        Answer(text: "false", rightAnswer: .falseAnswer)
//                     ])
//        ]
//    }
//}
