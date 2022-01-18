//
//  IntroductionViewController.swift
//  PetProject
//
//  Created by Андрей Аверьянов on 20.12.2021.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    let ilnarQuestion = WhoseQuestion.Ilnar
    let astafievQuestion = WhoseQuestion.Astafiev
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ilnarSegue" else { return }
        guard let destination = segue.destination as? QuestionViewController else { return }
        destination.whoseQuestion = ilnarQuestion
        print("1 \(destination)")
        
        guard segue.identifier == "showAstafiev" else { return }
        guard let destination = segue.destination as? QuestionViewController else { return }
        destination.whoseQuestion = ilnarQuestion
        print(destination)
    }
    
    
}
