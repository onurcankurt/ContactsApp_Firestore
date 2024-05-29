//
//  AddPersonVM.swift
//  ContactsApp_Firestore
//
//  Created by onur on 29.05.2024.
//

import Foundation

class AddPersonVM {
    var crepo = ContactsDaoRepository()
    
    func save(name: String, phone:String){
        crepo.save(name: name, phone: phone)
    }
}
