//
//  TransactionChooserView.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 6/19/21.
//

import SwiftUI
import UIKit

struct TransactionChooserView: View {
    @ObservedObject var viewModel:ViewModel
//    @Binding var selection:Int
    
    var body: some View {
        TabView{
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
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Sales")
            }
            .tag(1)
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







//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
