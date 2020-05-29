//
//  ContactCell.swift
//  FriendList
//
//  Created by jaewon on 2020/05/29.
//  Copyright © 2020 jaewon. All rights reserved.
//

import UIKit
import SnapKit

protocol ContactCell {
    var item: ContactViewModelItem? { get }
    var viewModel: ContactViewModel? { get }
}

extension ContactCell {
    var item: ContactViewModelItem? {
        return nil
    }
    
    var viewModel: ContactViewModel? {
        return nil
    }
}

class ContactUserCell: UITableViewCell, ContactCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
