//
//  RepresentativeTableViewController.swift
//  Representative
//
//  Created by Blake kvarfordt on 8/14/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class StateTableViewController: UITableViewController {

    
    // MARK: - Outlets
    
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return States.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)
        
        cell.textLabel?.text = States.all[indexPath.row]
        
        return cell
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetailView" {
            guard let index = tableView.indexPathForSelectedRow, let destination = segue.destination as? StateDetailTableViewController else { return }
            let object = States.all[index.row]
            destination.state = object
            
        }
    }
    

}
