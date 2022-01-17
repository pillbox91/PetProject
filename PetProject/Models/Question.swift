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
    let whoseQuestion: WhoseQuestion
    let answers: [Answer]
}

extension Question {
    static func getQuestion() -> [Question] {
        return [
            Question(text: "На какой машине я езжу?",
                     whoseQuestion: .Ilnar,
                     answers: [
                        Answer(text: "VOLVO S60", rightAnswer: .trueAnswer),
                        Answer(text: "BMW", rightAnswer: .falseAnswer),
                        Answer(text: "LADA", rightAnswer: .falseAnswer),
                        Answer(text: "KIA", rightAnswer: .falseAnswer)
                     ]),
            Question(text: "Какую машину я хочу?",
                     whoseQuestion: .Astafiev,
                     answers: [
                        Answer(text: "BMW", rightAnswer: .falseAnswer),
                        Answer(text: "VOLVO XC90", rightAnswer: .trueAnswer),
                        Answer(text: "KIA", rightAnswer: .falseAnswer),
                        Answer(text: "LADA", rightAnswer: .falseAnswer)
                     ])
        ]
    }
}
