//
//  NewspaperTableViewCell.swift
//  NewspapersDemoApp
//
//  Created by Руслан Федорович on 7/5/19.
//  Copyright © 2019 Руслан Федорович. All rights reserved.
//

import UIKit

class NewspaperTableViewCell: UITableViewCell {

    static let cellIdent = "NewspaperTableViewCell" // Your cell's xib file's name
    static let cellHeight: CGFloat = 100

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    func setNewspaper(_ newspaper: Newspaper) {
        titleLabel.text = newspaper.title
        subtitleLabel.text = newspaper.state
    }
}
