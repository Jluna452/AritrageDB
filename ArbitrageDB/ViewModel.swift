//
//  viewModel.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 6/22/21.
//

import Foundation
import UIKit

class ViewModel: ObservableObject {
    @Published var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @Published var allItems:[SaleItem] = []
    
    init() {
        getAllItemsFunc()
    }

    func getAllItemsFunc(){
        do{
            allItems = try context.fetch(SaleItem.fetchRequest())
        }
        catch{
            //handle error here
        }
    }
    
//    Intent:
    
    func storeNewSale(sellDescriptor:String, buyDate:Date, sellDate:Date, price:String, profit:String, shippingFee: String, miscFees:String, quantity: String) {
        let newItem = SaleItem(context: context)
        newItem.sellDescriptor = sellDescriptor
        newItem.buyDate = buyDate
        newItem.entryDate = Date()
        newItem.sellDate = sellDate
        newItem.grossTotal = toCurrency(entry: profit)
        newItem.itemCost = toCurrency(entry: price)
        newItem.shippingFees = toCurrency(entry: shippingFee)
        newItem.otherFees = toCurrency(entry: miscFees)
        newItem.profitable = (newItem.grossTotal > newItem.itemCost) ? true : false
//        newItem.quantity = Int16(quantity)!
       
        do{
            try context.save()
        }
        catch{
            //handle
        }

        getAllItemsFunc()
    }
    
    func editSale(editItem:SaleItem, sellDescriptor:String, buyDate:Date, sellDate:Date, price:String, profit:String, shippingFee: String, miscFees:String, quantity: String) {
        
//        let newItem = SaleItem(context: context)
//        newItem.sellDescriptor = (sellDescriptor != "") ? sellDescriptor : editItem.sellDescriptor
//        newItem.buyDate = buyDate
//        newItem.sellDate = sellDate
//        newItem.grossTotal = (profit != "") ? toCurrency(entry: profit):editItem.grossTotal
//        newItem.itemCost = (price != "") ? toCurrency(entry: price):editItem.itemCost
//        newItem.shippingFees = (shippingFee != "") ? toCurrency(entry: shippingFee):editItem.shippingFees
//        newItem.otherFees = (miscFees != "") ? toCurrency(entry: miscFees):editItem.otherFees
//        newItem.profitable = (newItem.grossTotal > newItem.itemCost) ? true : false
//        newItem.quantity = editItem.quantity
        
//        context.delete(editItem)
                
//        let newItem = SaleItem(context: context)
        editItem.sellDescriptor = (sellDescriptor != "") ? sellDescriptor : editItem.sellDescriptor
        editItem.buyDate = buyDate
        editItem.sellDate = sellDate
        editItem.grossTotal = (profit != "") ? toCurrency(entry: profit):editItem.grossTotal
        editItem.itemCost = (price != "") ? toCurrency(entry: price):editItem.itemCost
        editItem.shippingFees = (shippingFee != "") ? toCurrency(entry: shippingFee):editItem.shippingFees
        editItem.otherFees = (miscFees != "") ? toCurrency(entry: miscFees):editItem.otherFees
        editItem.profitable = (editItem.grossTotal > editItem.itemCost) ? true : false
        editItem.quantity = editItem.quantity
        
        do{
            try context.save()
        }
        catch{
            //handle
        }
        
        getAllItemsFunc()
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
    
    var getAllSales:[SaleItem]{
        allItems
    }
    
    func toCurrency(entry:String) -> Float {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter.number(from: entry)?.floatValue ?? 0.0
    }
    
}
