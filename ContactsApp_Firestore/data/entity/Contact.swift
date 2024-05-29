//
//  Contact.swift
//  ContactsApp_Firestore
//
//  Created by onur on 29.05.2024.
//

import Foundation

class Contact {
    var id: String?
    var name: String?
    var phone: String?
    
    init() {
    }
    
    init(id: String, name: String, phone: String) {
        self.id = id
        self.name = name
        self.phone = phone
    }
}
