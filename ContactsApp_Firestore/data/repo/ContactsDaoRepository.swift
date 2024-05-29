//
//  ContactsDaoRepository.swift
//  ContactsApp_Firestore
//
//  Created by onur on 29.05.2024.
//

import Foundation
import RxSwift
import FirebaseFirestore

class ContactsDaoRepository {
    var contactRXList = BehaviorSubject<[Contact]>(value: [Contact]())
    var collectionContacts = Firestore.firestore().collection("Contacts")
    
    func save(name: String, phone:String){
        let contact = ["name": name, "phone": phone]
        collectionContacts.document().setData(contact)
    }
    
    func update(id: String, name: String, phone: String){
        let contact = ["name": name, "phone": phone]
        collectionContacts.document(id).updateData(contact)
    }
    
    func delete(id: String){
        collectionContacts.document(id).delete()
    }
    
    func search(searchText: String){
        collectionContacts.addSnapshotListener { snapshot, error in
            var list = [Contact]()
            if let documents = snapshot?.documents{
                for document in documents{
                    let data = document.data()
                    let id = document.documentID
                    let name = data["name"] as? String ?? ""
                    let phone = data["phone"] as? String ?? ""
                    
                    if name.lowercased().contains(searchText.lowercased()){
                        let contact = Contact(id: id, name: name, phone: phone)
                        list.append(contact)
                    }
                }
            }
            self.contactRXList.onNext(list)
        }
    }
    
    
    func uploadContacts(){
        collectionContacts.addSnapshotListener { snapshot, error in
            var list = [Contact]()
            if let documents = snapshot?.documents{
                for document in documents{
                    let data = document.data()
                    let id = document.documentID
                    let name = data["name"] as? String ?? ""
                    let phone = data["phone"] as? String ?? ""
                    
                    let contact = Contact(id: id, name: name, phone: phone)
                    list.append(contact)
                }
            }
            self.contactRXList.onNext(list)
        }
    }
}
