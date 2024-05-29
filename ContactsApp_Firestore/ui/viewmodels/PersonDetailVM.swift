//
//  PersonDetailVM.swift
//  ContactsApp_Firestore
//
//  Created by onur on 29.05.2024.
//

import Foundation

class PersonDetailVM {
    var crepo = ContactsDaoRepository()
    
    func update(id: String, name: String, phone: String){
        crepo.update(id: id, name: name, phone: phone)
    }
}
