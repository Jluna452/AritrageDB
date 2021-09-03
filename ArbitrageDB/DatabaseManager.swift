//
//  ArbitrageDatabase.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 6/21/21.
//

import Foundation
import SwiftUI
import UIKit

struct DatabaseManager {
//    static let shared = DatabaseManager()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var getAllItems:[SaleItem] = []
    
    mutating func getAllItemsFunc(){
        do{
            getAllItems = try context.fetch(SaleItem.fetchRequest())
        }
        catch{
            //handle error here
        }
 
    }
    
    init() {
        getAllItemsFunc()
    }
    
    
    mutating func createNewItem(sellDescriptor:String, buyDate:Date, sellDate:Date, price:Float, profit:Float, shippingFees: Float, miscFee: Float, profitable: Bool ){
        let newItem = SaleItem(context: context)
        newItem.sellDescriptor = sellDescriptor
        newItem.buyDate = buyDate
        newItem.entryDate = Date()
        newItem.sellDate = sellDate
        newItem.grossTotal = profit
        newItem.profitable = profitable
        
        do{
            try context.save()
        }
        catch{
            //handle
        }
        getAllItemsFunc()
    }
    
    mutating func delete(item:SaleItem){
        context.delete(item)
        do{
            try context.save()
        }
        catch{
            //handle
        }
        getAllItemsFunc()
    }
    
    
    mutating func update(item:SaleItem,sellDescriptor:String, buyDate:Date, sellDate:Date, price:Float, profit:Float, shippingFees: Float, miscFee: Float, profitable: Bool){
        
//        switch field {
//        case "Name":
//            item.saleDescriptor_ = newString!
//        case "MarketPlace":
//            item.marketPlace = newString!
//        case "Buy Date" :
//            item.buyDate = Date()
//        case "Sell Date" :
//            item.buyDate = Date()
//        case "Total" :
//            item.grossTotal = newFloat!
//        case "Shipping Fees" :
//            item.shippingFees = newFloat!
//        case "miscellaneous Fees" :
//            item.shippingFees = newFloat!
//        case "Quantity" :
//            item.quantity = newInt!
//
//        default:
//            print("field not found in switch")
//        }
//        
        
        
        
        
        
        getAllItemsFunc()
        do{
            try context.save()
        }
        catch{
            //handle
        }
    }
}


