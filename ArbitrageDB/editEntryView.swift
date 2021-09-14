//
//  editEntryView.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 9/9/21.
//

import Foundation

import SwiftUI
import Combine

struct editEntryView: View {
     var viewModel:ViewModel
    @ObservedObject var editItem:SaleItem
    
    var body: some View {
        NavigationView {
            ScrollView {
                Group{
                    VStack{
                        Text("Name")
                            .font(.headline)
                        TextField("\(editItem.sellDescriptor)", text: $entry.name)
                        { isEditing in
                            } onCommit: {
                            }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .disableAutocorrection(false)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
                    HStack{
                        Text("Price")
                            .font(.headline)
                            .fixedSize()
                        Text("$")
                        TextField("\(editItem.itemCost, specifier: "%.2f")", text: $entry.price)
                        { isEditing in
                            } onCommit: {
                                
                            }
                        .keyboardType(.numberPad)
                        .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                            .disableAutocorrection(true)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }


                    HStack{
                        Text("Profit")
                            .font(.headline)
                            .fixedSize()
                        Text("$")
                        TextField("\(editItem.grossTotal, specifier: "%.2f")", text: $entry.profit)
                        { isEditing in
                            } onCommit: {
                            }
                        .keyboardType(.numberPad)
                        .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                            .disableAutocorrection(true)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
                    HStack{
                        Text("Shipping Fees")
                            .font(.headline)
                            .fixedSize()
                        Text("$")
                        TextField("\(editItem.shippingFees, specifier: "%.2f")", text: $entry.shippingFees)
                        { isEditing in
                            } onCommit: {
                            }
                        .keyboardType(.numberPad)
                        .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                            .disableAutocorrection(true)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
                    HStack{
                        Text("Miscellaneous Fees")
                            .font(.headline)
                            .fixedSize()
                        Text("$")
                        TextField("\(editItem.otherFees, specifier: "%.2f")", text: $entry.miscFees)
                        { isEditing in
                            } onCommit: {
                            }
                        .keyboardType(.numberPad)
                        .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                            .disableAutocorrection(true)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
                    
                    
                    HStack{
                        Text("Quantity")
                            .font(.headline)
                            .fixedSize()
                        TextField("\(editItem.quantity)", text: $entry.quantity)
                                    .keyboardType(.numberPad)
                            .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                                .disableAutocorrection(true)
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(10.0)
                        
                    }
                           
                }

            }
            .navigationBarTitle("Edit '\(editItem.sellDescriptor)'")
            .navigationBarItems(leading: cancel, trailing: done)

        }
    }
    
    @State var entry = entryFields()
    
    
    @Binding var isPresented: Bool
    
    var cancel: some View {
        Button("Cancel") {
            self.isPresented = false
        }
    }
    
    var done: some View {
        Button("Done") {
            viewModel.editSale(editItem: editItem,
                               sellDescriptor: entry.name,
                               price: entry.price,
                               profit: entry.profit,
                               shippingFee: entry.shippingFees,
                               miscFees: entry.miscFees,
                               quantity: entry.quantity)
            self.isPresented = false
        }
    }
}
