//
//  AddGroupTableViewController.swift
//  MyAppGB
//
//  Created by Антон Голубейков on 08/03/2019.
//  Copyright © 2019 Golubeykovs Software. All rights reserved.
//

import UIKit

class AddGroupTableViewController: UITableViewController {

    var newGroup = ["Dog Lovers", "iOS developers", "Music Lovers"]
    var newgroups = [Group(image: #imageLiteral(resourceName: "DogLovers.jpg"), name: "Dog Lovers"), Group(image: #imageLiteral(resourceName: "iOS.jpeg"), name: "iOS Developers"), Group(image: #imageLiteral(resourceName: "Music.jpg"), name: "Music Lovers")]
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newgroups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddGroupCell", for: indexPath)
        let newgroup = newgroups [indexPath.row]
        cell.textLabel?.text = newgroup.name
        
        return cell
    }

}
