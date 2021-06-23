//
//  SaleItem+CoreDataProperties.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 6/22/21.
//
//

import Foundation
import CoreData


extension SaleItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SaleItem> {
        let request = NSFetchRequest<SaleItem>(entityName: "SaleItem")
        request.sortDescriptors = [NSSortDescriptor(key: "entryDate", ascending: false)]
//        request.predicate = predicate
        return request
    }
    
    var sellDescriptor: String {
        get { saleDescriptor_ ?? "Unknown" }
        set { saleDescriptor_ = newValue }
    }
    
    

    @NSManaged public var buyDate: Date?
    @NSManaged public var entryDate: Date?
    @NSManaged public var grossTotal: Float
    @NSManaged public var itemCost: Float
    @NSManaged public var itemPhoto: Data?
    @NSManaged public var marketPlace: String?
    @NSManaged public var otherFees: Float
    @NSManaged public var profitable: Bool
    @NSManaged public var quantity: Int16
    @NSManaged public var saleDescriptor_: String?
    @NSManaged public var sellDate: Date?
    @NSManaged public var shippingFees: Float

}

extension SaleItem : Identifiable {

}
