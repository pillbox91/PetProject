//
//  SetupProfileViewController.swift
//  PetProject
//
//  Created by Андрей Аверьянов on 04.08.2021.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    @IBOutlet var photoView: UIImageView!
    @IBOutlet var addPhotoBytton: UIButton!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    
    @IBOutlet var genderSegmentedControl: UISegmentedControl!
    
    @IBOutlet var chatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chatButton.layer.cornerRadius = 10
        photoView.layer.cornerRadius = photoView.bounds.height / 2
    }
    
    @IBAction func goTochatButton(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
