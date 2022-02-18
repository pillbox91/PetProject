//
//  QuestionDefaults.swift
//  PetProject
//
//  Created by Андрей Аверьянов on 07.02.2022.
//

import Foundation

class QuestionDefaults {
    
    let defaults = UserDefaults.standard
    
    static let shared = QuestionDefaults()
    
    struct Answer: Codable {
        var text: String?
    }

    struct QuestionData: Codable {
        var question: String?
        var answers: [Answer]?
    }
    
    var storageAnswer = Answer(text: "")
    var dataStorage = QuestionData(question: "", answers: [Answer(text: "")])
    
    var questions: [QuestionData] {
        get {
            if let data = defaults.value(forKey: "questions") as? Data {
                return try! PropertyListDecoder().decode([QuestionData].self, from: data)
            } else {
                return [QuestionData]()
            }
        }

        set {
            if let data = try? PropertyListEncoder().encode(newValue){
                defaults.set(data, forKey: "questions")
            }
        }
    }
    
    static func getQuestion() -> [QuestionData] {
        if let data = UserDefaults.standard.object(forKey: "questions") {
            return try! JSONDecoder().decode([QuestionData].self, from: data as! Data)
        } else {
            return [QuestionData]()
        }
        
    }
    
    func saveQuestion(question: String?) {
//        let question = QuestionData(question: question, answer: answer)
//        questions.append(question)
        
        if let data = try? JSONEncoder().encode(dataStorage) {
            UserDefaults.standard.set(data, forKey: "questions")
        }
    }
    
//    func saveAnswer(answer: String) {
//        let answer = QuestionData(answer: answer)
//        questions.append(answer)
//    }
}


