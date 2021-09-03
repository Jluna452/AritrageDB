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
    func getItemDesciptor(){    }
    
    func storeNewSale(sellDescriptor:String, buyDate:Date, sellDate:Date, price:String, profit:String, shippingFee: String, miscFees:String) {
        let formattedPofit = toCurrency(entry: profit)
        let formattedPrice = toCurrency(entry: price)
        let formattedShipFee = toCurrency(entry: shippingFee)
        let formattedMisc = toCurrency(entry: miscFees)
        let profitable:Bool = (profit > price) ? true : false
        
        
        db.createNewItem(sellDescriptor:sellDescriptor, buyDate:buyDate, sellDate:sellDate, price:formattedPrice, profit: formattedPofit, shippingFees: formattedShipFee, miscFee: formattedMisc, profitable: profitable)
    }
    
    func editSale(editItem:SaleItem, sellDescriptor:String, buyDate:Date, sellDate:Date, price:String, profit:String, shippingFee: String, miscFees:String) {
        let formattedPofit = toCurrency(entry: profit)
        let formattedPrice = toCurrency(entry: price)
        let formattedShipFee = toCurrency(entry: shippingFee)
        let formattedMisc = toCurrency(entry: miscFees)
        let profitable:Bool = (profit > price) ? true : false
        
        
        db.update(item: editItem, sellDescriptor:sellDescriptor, buyDate:buyDate, sellDate:sellDate, price:formattedPrice, profit: formattedPofit, shippingFees: formattedShipFee, miscFee: formattedMisc, profitable: profitable)
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
