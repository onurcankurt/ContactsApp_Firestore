//
//  PersonDetailVC.swift
//  ContactsApp_Firestore
//
//  Created by onur on 29.05.2024.
//

import UIKit

class PersonDetailVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    var contactDetail: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let c = contactDetail{
            nameTextField.text = c.name
            phoneTextField.text = c.phone
        }
    }
    
    
    @IBAction func updateButton(_ sender: Any) {
        if let id = contactDetail?.id, let name = nameTextField.text, let phone = phoneTextField.text{
            print("\(id)-\(name)-\(phone) updated.")
        }
    }
}
