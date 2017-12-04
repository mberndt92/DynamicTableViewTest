//
//  ViewController.swift
//  DynamicTableViewTest
//
//  Created by Maximilian Berndt on 04.12.17.
//  Copyright © 2017 mb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var dataSource = FooTableViewDataSource(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.tableView = tableView
        dataSource.reloadData()
    }
}

extension ViewController: TableViewDelegate {
    
    func tableViewDidSelect(model: RowDataSource) {
        //Note: This is where something like a switch would be needed to determine the type of the model
        //Another idea: send different delegates and do the switch inside the FoodTableViewDataSource, as this one actually knows the supported cell/model types as well.
        print("Selected: \(model)")
    }
    
}

