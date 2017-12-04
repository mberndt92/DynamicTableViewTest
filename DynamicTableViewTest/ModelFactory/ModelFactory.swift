//
//  ModelFactory.swift
//  DynamicTableViewTest
//
//  Created by Maximilian Berndt on 04.12.17.
//  Copyright © 2017 mb. All rights reserved.
//

struct ModelFactory {
    
    static func mockedModel() -> [SectionDataSource] {
        let fooModel = SectionDataSource(rowDataSource: mockFooRows())
        let forceModel = SectionDataSource(rowDataSource: mockForceRows())
        return [fooModel, forceModel]
    }
    
    private static func mockFooRows() -> [RowDataSource] {
        let tyrion = FooCell.Model(name: "Tyrion", house: "Lannister", status: true, allied: "Daenaerys")
        let joffrey = FooCell.Model(name: "Joffrey", house: "Baratheon", status: false, allied: "Lannisters")
        let jon = FooCell.Model(name: "Jon", house: "Snow", status: true, allied: "Daenaerys")
        
        let tRow = rowModel(identifier: FooCell.cellIdentifier, model: tyrion)
        let jRow = rowModel(identifier: FooCell.cellIdentifier, model: joffrey)
        let jSRow = rowModel(identifier: FooCell.cellIdentifier, model: jon)
        
        return [tRow, jRow, jSRow]
        
    }
    
    private static func mockForceRows() -> [RowDataSource] {
        
        let darthMaul = ForceCell.Model(name: "Darth Maul", darkSide: true, weapon: "LightSaber")
        let luke = ForceCell.Model(name: "Luke Skywalker", darkSide: false, weapon: "LightSaber")
        let chewbacca = ForceCell.Model(name: "Chewbacca", darkSide: false, weapon: "Cross-Box")
        
        let dMRow = rowModel(identifier: ForceCell.cellIdentifier, model: darthMaul)
        let lukeRow = rowModel(identifier: ForceCell.cellIdentifier, model: luke)
        let chewRow = rowModel(identifier: ForceCell.cellIdentifier, model: chewbacca)
        
        return [dMRow, lukeRow, chewRow]
        
    }
    
    private static func rowModel(identifier: String, model: Any) -> RowDataSource {
        return RowDataSource(identifier: identifier, model: model)
    }
    
}
