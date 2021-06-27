//
//  TransactionChooserView.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 6/19/21.
//

import SwiftUI
import UIKit
import CoreData

struct TransactionChooserView: View {
    @ObservedObject var viewModel:ViewModel
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.getAllSales){ item in
                    NavigationLink(item.sellDescriptor, destination: saleView(item: item)
                                    .navigationBarTitle(item.sellDescriptor))
                    }
                .onDelete { del in
                    del.map { viewModel.getAllSales[$0] }.forEach { sale in
                        viewModel.deleteSale(saleItem: sale)
                    }
                }
            }
        
            .navigationBarTitle("Recent Transactions")
            .navigationBarItems(trailing: newEntryButton)
        }
    }
    
    
    var newEntryButton: some View {
        Button("New"){
            showNewEntry = true
        }
        .sheet(isPresented: $showNewEntry){
            NewEntryView(viewModel: viewModel, isPresented: $showNewEntry)
        }
    }
    
    @State var showNewEntry: Bool = false
}




struct saleView: View {
    let item:SaleItem
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 350, height: 125)
            .foregroundColor(Color(UIColor.systemGray2))
            .overlay(
                HStack{
                    Text("Sale! \(item.grossTotal)")
                     .padding()
                    Text("\(item.sellDescriptor)")
                }

            )

    }

}



















//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
