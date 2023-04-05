//
//  ProductCell.swift
//  project
//
//  Created by dan on 05.04.2023.
//

import UIKit

class ProductCell: UITableViewCell {

    
    public static let identifier = "ProductCell"
    
    
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
