//
//  ArbitrageDatabase.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 6/21/21.
//

import Foundation
import SwiftUI
import UIKit

class ArbitrageDatabase: NSObject, ObservableObject {
    static let shared = ArbitrageDatabase()
    
    @Published var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func getAllItems() -> [SaleItem]{
        var data: [SaleItem] = []
        do{
            data = try context.fetch(SaleItem.fetchRequest())
        }
        catch{
            //handle error here
        }
        return data
    }
    
    
    func createNewItem(){
        let newItem = SaleItem(context: context)
//        newItem.saleDescriptor_ = "blank"
        newItem.buyDate = Date()
        newItem.entryDate = Date()
        newItem.grossTotal = 12.0
        
        
        do{
            try context.save()
        }
        catch{
            //handle
        }
    }
    
    func delete(item:SaleItem){
        context.delete(item)
        do{
            try context.save()
        }
        catch{
            //handle
        }
        
    }
    
    
    func update(item:SaleItem, newString:String?, newFloat: Float?, newInt:Int16?, newDate:Date?, field:String){
        
        switch field {
        case "Name":
            item.saleDescriptor_ = newString!
        case "MarketPlace":
            item.marketPlace = newString!
        case "Buy Date" :
            item.buyDate = Date()
        case "Sell Date" :
            item.buyDate = Date()
        case "Total" :
            item.grossTotal = newFloat!
        case "Shipping Fees" :
            item.shippingFees = newFloat!
        case "miscellaneous Fees" :
            item.shippingFees = newFloat!
        case "Quantity" :
            item.quantity = newInt!

        default:
            print("fiel not found in switch")
        }
        
        
        
        
        
        
        getAllItems()
        do{
            try context.save()
        }
        catch{
            //handle
        }
    }
    
}
