//
//  IntroductionViewController.swift
//  PetProject
//
//  Created by Андрей Аверьянов on 20.12.2021.
//

import UIKit
import CoreData

class IntroductionViewController: UIViewController {
    
    var context: NSManagedObjectContext!
//    var question: [QuestionIlnar] = []
//
//    let ilnarQuestion = WhoseQuestion.Ilnar
//    let astafievQuestion = WhoseQuestion.Astafiev
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {}
    
    @IBAction func ilnarButton(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "IlnarSegue" {
            if let destVC = segue.destination as? UINavigationController,
               let targetController = destVC.topViewController as? QuestionViewController {
                targetController.context = context
            }
        }
    }
    
    
}
