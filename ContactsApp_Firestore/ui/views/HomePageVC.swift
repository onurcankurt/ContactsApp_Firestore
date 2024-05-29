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
    var viewModel = HomePageVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        _ = viewModel.contactsRXList.subscribe(onNext: { contacts in
            self.contactsList = contacts
            self.contactsTableView.reloadData()
        })
    }
}

extension HomePageVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText: searchText)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contactsList[indexPath.row]
        performSegue(withIdentifier: "toPersonDetail", sender: contact)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPersonDetail" {
            if let contactSender = sender as? Contact{
                let destinationVC = segue.destination as! PersonDetailVC
                destinationVC.contactDetail = contactSender
            }
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contact = contactsList[indexPath.row]
        let deleteSwipe = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            let deleteAlertController = UIAlertController(title: "Delete", message: "Do you want to delete \(contact.name!)?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            let yesAction = UIAlertAction(title: "Yes", style: .destructive) { alert in
                self.viewModel.delete(id: contact.id!)
            }
            deleteAlertController.addAction(cancelAction)
            deleteAlertController.addAction(yesAction)
            self.present(deleteAlertController, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteSwipe])
    }
}
