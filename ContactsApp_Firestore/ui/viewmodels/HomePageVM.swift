//
//  HomePageVM.swift
//  ContactsApp_Firestore
//
//  Created by onur on 29.05.2024.
//

import Foundation
import RxSwift

class HomePageVM {
    var crepo = ContactsDaoRepository()
    var contactsRXList = BehaviorSubject<[Contact]>(value: [Contact]())
    
    init() {
        contactsRXList = crepo.contactRXList
        uploadContacts()
    }
    
    func delete(id: String){
        crepo.delete(id: id)
    }
    
    func search(searchText: String){
        crepo.search(searchText: searchText)
    }
    
    func uploadContacts(){
        crepo.uploadContacts()
    }
}
