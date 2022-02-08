//
//  QuestionDefaults.swift
//  PetProject
//
//  Created by Андрей Аверьянов on 07.02.2022.
//

import Foundation

class QuestionDefaults {
    
    private enum SettingKey: String {
        case questionModel
    }
    
    static var questionModel: Question? {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingKey.questionModel.rawValue) as? Data,
                  let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? Question else { return nil }
            return decodedModel
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingKey.questionModel.rawValue
            
            if let questionModel = newValue {
                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: questionModel, requiringSecureCoding: false) {
                    print("value: \(questionModel) was added to key \(key)")
                    defaults.set(savedData, forKey: key)
                } else {
                    defaults.removeObject(forKey: key)
                }
            }
        }
    }
}


