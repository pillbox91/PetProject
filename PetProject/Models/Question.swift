//
//  Question.swift
//  PetProject
//
//  Created by Андрей Аверьянов on 14.01.2022.
//

enum WhoseQuestion {
    case Ilnar
    case Astafiev
}

struct Question {
    let text: String
    let answers: [Answer]
}

extension Question {
    static func getQuestion() -> [Question] {
        return [
            Question(text: "На какой машине я езжу?",
                     answers: [
                        Answer(text: "VOLVO S60", rightAnswer: true),
                        Answer(text: "BMW", rightAnswer: false),
                        Answer(text: "LADA", rightAnswer: false),
                        Answer(text: "KIA", rightAnswer: false)
                     ]),
            Question(text: "Какую машину я хочу?",
                     answers: [
                        Answer(text: "BMW", rightAnswer: true),
                        Answer(text: "VOLVO XC90", rightAnswer: false),
                        Answer(text: "KIA", rightAnswer: false),
                        Answer(text: "LADA", rightAnswer: false)
                     ])
        ]
    }
}
