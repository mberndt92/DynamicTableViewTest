//
//  ForceCell.swift
//  DynamicTableViewTest
//
//  Created by Maximilian Berndt on 04.12.17.
//  Copyright © 2017 mb. All rights reserved.
//

import UIKit

class ForceCell: UITableViewCell, ModeledView {
    
    static var cellIdentifier: String = "ForceCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weaponLabel: UILabel!
    @IBOutlet weak var sideView: UIView!
    
    var model: Any? {
        didSet {
            setup()
        }
    }
    
    func setup() {
        guard let model = model as? Model else { return }
        nameLabel.text = model.name
        sideView.backgroundColor = model.darkSide ? UIColor.black : UIColor.blue
        weaponLabel.text = model.weapon
    }
    
    struct Model {
        let name: String
        let darkSide: Bool
        let weapon: String
    }
    
    
}
