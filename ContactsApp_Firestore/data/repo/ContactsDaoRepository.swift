//
//  ContactsDaoRepository.swift
//  ContactsApp_Firestore
//
//  Created by onur on 29.05.2024.
//

import Foundation
import RxSwift

class ContactsDaoRepository {
    var contactRXList = BehaviorSubject<[Contact]>(value: [Contact]())
    
    func save(name: String, phone:String){
        print("\(name)-\(phone) saved.")
    }
    
    func update(id: String, name: String, phone: String){
        print("\(id)-\(name)-\(phone) updated.")
    }
    
    func delete(id: String){
        print("ID: \(id) contact deleted.")
    }
    
    func search(searchText: String){
        print("Arama: \(searchText)")
    }
    
    
    func uploadContacts(){
        var list = [Contact]()
        
        let c1 = Contact(id: "1", name: "John", phone: "1111")
        let c2 = Contact(id: "2", name: "Rick", phone: "2222")
        let c3 = Contact(id: "3", name: "James", phone: "3333")
        
        list.append(c1)
        list.append(c2)
        list.append(c3)
        
        contactRXList.onNext(list)
    }
}
