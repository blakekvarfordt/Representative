//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by Blake kvarfordt on 8/14/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {

    
    // Computed Property
    var representatives: [Representative] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    var state: String?
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        if let state = state {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            RepresentativeController.searchRepresentatives(forState: state) { (representatives) in
                DispatchQueue.main.async {
                    self.representatives = representatives
                    self.tableView.reloadData()
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    
                }
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return representatives.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath) as? TableViewCell else { return UITableViewCell()}

        let representative = representatives[indexPath.row]
        cell.representative = representative
        
        return cell
    }
    

}
