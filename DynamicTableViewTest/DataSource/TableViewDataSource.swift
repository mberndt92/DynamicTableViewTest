//
//  TableViewDataSource.swift
//  DynamicTableViewTest
//
//  Created by Maximilian Berndt on 04.12.17.
//  Copyright © 2017 mb. All rights reserved.
//

import UIKit

protocol TableViewDelegate: class {
    func tableViewDidSelect(model: RowDataSource)
}

class TableViewDataSource: DataSource {
    
    weak var delegate: TableViewDelegate?
    
    weak var tableView: UITableView? {
        didSet {
            tableView?.dataSource = self
            tableView?.delegate = self
            registerCells()
        }
    }
    
    func register(identifier: String) {
        tableView?.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
}

extension TableViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return collection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection[section].rowDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowModel = collection[indexPath.section].rowDataSource[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: rowModel.identifier, for: indexPath)
        (cell as? ModeledView)?.model = rowModel.model
        
        return cell
    }
    
}

extension TableViewDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowModel = collection[indexPath.section].rowDataSource[indexPath.row]
        delegate?.tableViewDidSelect(model: rowModel)
    }
    
}
