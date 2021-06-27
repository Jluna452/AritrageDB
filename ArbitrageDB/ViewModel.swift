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
    
    func storeNewSale(sellDescriptor:String, buyDate:Date, sellDate:Date) {
        db.createNewItem(sellDescriptor:sellDescriptor, buyDate:buyDate, sellDate:sellDate)
    }
    
    func deleteSale(saleItem:SaleItem){
        db.delete(item: saleItem)
    }
    
    var getAllSales:[SaleItem]{
        db.getAllItems
    }

}
