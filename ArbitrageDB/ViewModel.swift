//
//  viewModel.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 6/22/21.
//

import Foundation
import UIKit
import SwiftUI

class ViewModel: ObservableObject {
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @Published public var allItems:[SaleItem] = []
    
    init() {
        getAllItems()
    }

    func getAllItems(){
        do{
            allItems = try context.fetch(SaleItem.fetchRequest())
        }
        catch{
            //handle error here
            print("Error in getALLItems \(error)")
        }
    }
    
    
    func toCurrency(entry:String) -> Float {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter.number(from: entry)?.floatValue ?? 0.0
    }
//    Intent:
    
    func storeNewSale(sellDescriptor:String, buyDate:Date, sellDate:Date, price:String, profit:String, shippingFee: String, miscFees:String, quantity: String, image:UIImage?) {
        let newItem = SaleItem(context: context)
        newItem.sellDescriptor = sellDescriptor
        newItem.buyDate = buyDate
        newItem.entryDate = Date()
        newItem.sellDate = sellDate
        newItem.grossTotal = toCurrency(entry: profit)
        newItem.itemCost = toCurrency(entry: price)
        newItem.shippingFees = toCurrency(entry: shippingFee)
        newItem.otherFees = toCurrency(entry: miscFees)
        newItem.profitable = (newItem.grossTotal > newItem.itemCost + newItem.shippingFees + newItem.otherFees) ? true : false

        if let tmp = image{
            newItem.image = tmp.pngData()!
        }

        
        if let tmp = Int(quantity){
            newItem.quantity = Int16(exactly: tmp) ?? 1
        }
       
        saveData()
    }
    
    func editSale(editItem:SaleItem, sellDescriptor:String, price:String, profit:String, shippingFee: String, miscFees:String, quantity: String, image:UIImage?) {
        editItem.sellDescriptor = (sellDescriptor != "") ? sellDescriptor : editItem.sellDescriptor
        editItem.grossTotal = (profit != "") ? toCurrency(entry: profit):editItem.grossTotal
        editItem.itemCost = (price != "") ? toCurrency(entry: price):editItem.itemCost
        editItem.shippingFees = (shippingFee != "") ? toCurrency(entry: shippingFee):editItem.shippingFees
        editItem.otherFees = (miscFees != "") ? toCurrency(entry: miscFees):editItem.otherFees
        editItem.profitable = (editItem.grossTotal > editItem.itemCost + editItem.shippingFees + editItem.otherFees)  ? true : false

        if let tmp = Int(quantity){
            editItem.quantity = Int16(exactly: tmp) ?? editItem.quantity
        }
        
        if let tmp = image{
            editItem.image = tmp.pngData()!
        }

        saveData()
    }
    
    func delete(item:SaleItem){
        context.delete(item)
        saveData()
    }
    
    func saveData(){
        do{
            try context.save()
        }
        catch{
            //handle
            print("Error when saving Data \(error)")
        }
        getAllItems()
    }
}
