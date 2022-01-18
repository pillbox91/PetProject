//
//  ResultViewController.swift
//  PetProject
//
//  Created by Андрей Аверьянов on 14.01.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        
        updateResult()
    }
}

// MARK: - Private Methods
extension ResultViewController {
    
    private func updateResult() {
        
        var rightAnswer = 0
        let results = answers.map { $0.rightAnswer }
        
        for animal in results {
            if animal == .trueAnswer {
                rightAnswer += 1
            }
        }
        
        resultLabel.text = "Правильных ответов: \(rightAnswer)"
    }
}

