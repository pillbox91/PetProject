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

    struct QuestionData: Codable {
        var question: String?
        var answer: String?
    }
    
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
    
    func saveQuestion(question: String?, answer: String?) {
        let question = QuestionData(question: question, answer: answer)
        questions.append(question)
    }
}


