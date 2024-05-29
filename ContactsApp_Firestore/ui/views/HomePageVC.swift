//
//  ViewController.swift
//  ContactsApp_Firestore
//
//  Created by onur on 29.05.2024.
//

import UIKit

class HomePageVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var contactsTableView: UITableView!
    
    var contactsList = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        let c1 = Contact(id: "1", name: "John", phone: "1111")
        let c2 = Contact(id: "2", name: "Rick", phone: "2222")
        let c3 = Contact(id: "3", name: "James", phone: "3333")
        
        contactsList.append(c1)
        contactsList.append(c2)
        contactsList.append(c3)
    }
}

extension HomePageVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama: \(searchText)")
    }
    
}

extension HomePageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contactsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as! ContactCell
        
        cell.nameLabel.text = contact.name
        cell.phoneLabel.text = contact.phone
        
        return cell
    }
}
