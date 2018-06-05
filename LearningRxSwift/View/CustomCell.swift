//
//  CustomCell.swift
//  LearningRxSwift
//
//  Created by Danilo Ricardo Dias Pena on 04/06/2018.
//  Copyright © 2018 Danilo Pena. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
