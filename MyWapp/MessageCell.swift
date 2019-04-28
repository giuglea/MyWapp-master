//
//  MessageCell.swift
//  
//
//  Created by Andrei Giuglea on 18/03/2019.
//

import Foundation
import UIKit

class MessageCell: UITableViewCell{
    
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var message: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
