//
//  SaleItem+CoreDataProperties.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 6/22/21.
//
//

import Foundation
import CoreData
import SwiftUI


extension SaleItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SaleItem> {
        let request = NSFetchRequest<SaleItem>(entityName: "SaleItem")
        request.sortDescriptors = [NSSortDescriptor(key: "entryDate_", ascending: false)]
//        request.predicate = predicate
        return request
    }

    var buyDate: Date {
        get { buyDate_ ?? Date() }
        set { buyDate_ = newValue }
    }
    
    var sellDate: Date {
        get { sellDate_ ?? Date() }
        set { sellDate_ = newValue }
    }
    
    var entryDate: Date {
        get { entryDate_ ?? Date()}
        set { entryDate_ = newValue}
    }
    
    var itemPhoto: Data {
//        get { itemPhoto_ ?? Image(systemName: "camera") }
        get { itemPhoto_!}
        set { itemPhoto_ = newValue }
    }
    
    var sellDescriptor: String {
        get { sellDescriptor_ ?? "Blank descriptor" }
        set { sellDescriptor_ = newValue }
    }

    var marketPlace: String {
        get { marketPlace_ ?? "Blank marketplace" }
        set { marketPlace_ = newValue }
    }
    @NSManaged public var buyDate_: Date?
    @NSManaged public var entryDate_: Date?
    @NSManaged public var grossTotal: Float
    @NSManaged public var itemCost: Float
    @NSManaged public var itemPhoto_: Data?
    @NSManaged public var marketPlace_: String?
    @NSManaged public var otherFees: Float
    @NSManaged public var profitable: Bool
    @NSManaged public var quantity: Int16
    @NSManaged public var sellDescriptor_: String?
    @NSManaged public var sellDate_: Date?
    @NSManaged public var shippingFees: Float

}

extension SaleItem : Identifiable {

}
