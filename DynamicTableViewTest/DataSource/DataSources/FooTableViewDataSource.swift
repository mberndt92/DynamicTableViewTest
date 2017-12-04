//
//  FooTableViewDataSource.swift
//  DynamicTableViewTest
//
//  Created by Maximilian Berndt on 04.12.17.
//  Copyright © 2017 mb. All rights reserved.
//

class FooTableViewDataSource: TableViewDataSource {
    
    init(delegate: TableViewDelegate?) {
        super.init()
        self.delegate = delegate
    }
    
    func reloadData(reloadTableView: Bool = true) {
        
        let collection: [SectionDataSource] = ModelFactory.mockedModel()
        
        self.collection = collection
        
        if reloadTableView {
            tableView?.reloadData()
        }
        
    }
    
    override func registerCells() {
        register(identifier: FooCell.cellIdentifier)
        register(identifier: ForceCell.cellIdentifier)
    }
    
}


