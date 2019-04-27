//
//  GroupsViewController.swift
//  MyAppGB
//
//  Created by Антон Голубейков on 08/03/2019.
//  Copyright © 2019 Golubeykovs Software. All rights reserved.
//

import UIKit

class GroupsViewController: UIViewController {

    @IBOutlet weak var GroupsCollectionView: UICollectionView!
    var groups = ["Travelling Lovers", "Cats Lovers", "GeekBrains Students"]
    var mygroups = [Group(image: #imageLiteral(resourceName: "CatLovers.jpg"), name: "Cat Lovers"), Group(image: #imageLiteral(resourceName: "TravelLovers.jpeg"), name: "Travelling Lovers"), Group (image: #imageLiteral(resourceName: "GeekBrains.png"), name: "GeekBrains Students")]
    
    
    
    @IBAction func didSelectNewGroup(segue : UIStoryboardSegue) {
        if let vc = segue.source as? AddGroupTableViewController {
            guard let indexPath = vc.tableView.indexPathForSelectedRow else {
                return
            }
            let newGroup = vc.newgroups[indexPath.row]
            mygroups.append (newGroup)
            GroupsCollectionView.reloadData()
        }
    }
    
}

extension GroupsViewController : UICollectionViewDataSource, UITableViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mygroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCell", for: indexPath) as! GroupsCollectionViewCell
        let mygroup = mygroups[indexPath.row]
        cell.GroupLabel.text = mygroup.name
        cell.GroupImage.image = mygroup.image
        return cell
    }
    
    
}
