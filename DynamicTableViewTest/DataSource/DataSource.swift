//
//  DataSource.swift
//  DynamicTableViewTest
//
//  Created by Maximilian Berndt on 04.12.17.
//  Copyright © 2017 mb. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    
    var collection: [SectionDataSource] = []
    
    func registerCells() {
        //override in children
    }
    
}

protocol ModeledView: class {
    var model: Any? { get set }
}


struct SectionDataSource {
    let rowDataSource: [RowDataSource]
//    let headerDataSource: HeaderDataSource //not created for PoC
//    let footerDataSource: FooterDataSource //not created for PoC
}

struct RowDataSource {
    let identifier: String
    let model: Any?
}
