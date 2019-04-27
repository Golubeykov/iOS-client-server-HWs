//
//  FriendsViewController.swift
//  MyAppGB
//
//  Created by Антон Голубейков on 07/03/2019.
//  Copyright © 2019 Golubeykovs Software. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var FriendsTable: UITableView!
    
    @IBOutlet weak var FriendsSearch: UISearchBar!
    var persons = [Person(image: #imageLiteral(resourceName: "Ivanov.jpg"), name: "Ivanov Ilya"), Person (image: #imageLiteral(resourceName: "Kudryavtseva.jpg"), name: "Kudryavtseva Yulia"), Person (image: #imageLiteral(resourceName: "Sevoyan.jpg"), name: "Sevoyan Artem"), Person (image: #imageLiteral(resourceName: "Golubeykov.jpg"), name: "Golubeykov Nikita")]
    var sections = ["G", "I", "K", "P", "S", "T"]
    
    lazy var currentPersons = persons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FriendsTable.dataSource = self
      
    }
    
    private func setUpSearchBar () {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentPersons = persons
            FriendsTable.reloadData()
            return
        }
        
        currentPersons = persons.filter({ person -> Bool in
            person.name.lowercased().contains(searchText.lowercased())
        })
        FriendsTable.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
    
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    @IBAction func didSelectNewFriend(segue : UIStoryboardSegue) {
        if let vc = segue.source as? AddFriendTableViewController {
            guard let indexPath = vc.tableView.indexPathForSelectedRow else {
                return
            }
            let newPerson = vc.newpersons [indexPath.row]
            currentPersons.append (newPerson)
            persons.append(newPerson)
            FriendsTable.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ChooseFriend" else {
            return
        }
        
        guard let indexPath = FriendsTable.indexPathForSelectedRow else {
            return
        }
        
        let friendData = currentPersons[indexPath.row]
        
        let DestViewController : MyFriendViewController = segue.destination as! MyFriendViewController
        
        DestViewController.persons = [friendData]
    }
    
        
    }
    


extension FriendsViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Friends List"
        return label
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentPersons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendsTableViewCell
        let person = currentPersons[indexPath.row]
        cell.FriendLabel.text = person.name
        cell.FriendImage.image = person.image
        return cell
    }
    
}


