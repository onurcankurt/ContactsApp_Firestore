//
//  AddPersonVC.swift
//  ContactsApp_Firestore
//
//  Created by onur on 29.05.2024.
//

import UIKit

class AddPersonVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    var viewModel = AddPersonVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveButton(_ sender: Any) {
        if let name = nameTextField.text, let phone = phoneTextField.text{
            viewModel.save(name: name, phone: phone)
        }
    }
}
