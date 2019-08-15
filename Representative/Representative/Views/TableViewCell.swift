//
//  TableViewCell.swift
//  Representative
//
//  Created by Blake kvarfordt on 8/14/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // Computed Property
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    
    
    func updateViews() {
        
        nameLabel.text = representative?.name
        partyLabel.text = representative?.party
        districtLabel.text = representative?.district
        websiteLabel.text = representative?.link
        numberLabel.text = representative?.phone
    }
}
