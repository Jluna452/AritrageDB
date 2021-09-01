//
//  viewModel.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 6/22/21.
//

import Foundation

class ViewModel: ObservableObject {
    @Published private var db = DatabaseManager()
//    Intent:
    func getItemDesciptor(){
//        DatabaseManager.shared.
    }
    
    func storeNewSale(sellDescriptor:String, buyDate:Date, sellDate:Date, price:String, profit:String) {
        db.createNewItem(sellDescriptor:sellDescriptor, buyDate:buyDate, sellDate:sellDate, price:price, profit: toCurrency(entry: profit))
    }
    
    func deleteSale(saleItem:SaleItem){
        db.delete(item: saleItem)
    }
    
    var getAllSales:[SaleItem]{
        db.getAllItems
    }

    
    func toCurrency(entry:String) -> Float {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter.number(from: entry)?.floatValue ?? 0.0
    }
    
}
