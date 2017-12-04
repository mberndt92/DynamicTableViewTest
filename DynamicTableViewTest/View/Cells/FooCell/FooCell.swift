//
//  FooCell.swift
//  DynamicTableViewTest
//
//  Created by Maximilian Berndt on 04.12.17.
//  Copyright © 2017 mb. All rights reserved.
//

import UIKit

class FooCell: UITableViewCell, ModeledView {
    
    static var cellIdentifier: String = "FooCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var alliedLabel: UILabel!
    
    var model: Any? {
        didSet {
            setup()
        }
    }
    
    func setup() {
        guard let model = model as? Model else { return }
        nameLabel.text = "\(model.name) \(model.house)"
        statusView.backgroundColor = model.status ? UIColor.green : UIColor.red
        alliedLabel.text = model.allied
    }
    
    struct Model {
        let name: String
        let house: String
        let status: Bool
        let allied: String
    }
    
}
