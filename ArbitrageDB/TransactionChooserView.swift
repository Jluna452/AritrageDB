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
    var body: some View {
        NavigationView {
            TabView{
                List{
                    ForEach(viewModel.allItems){ item in
                        NavigationLink(destination: saleView(item: item, viewModel: viewModel)){
                            saleItemCard(item: item)
                        }
                        
                        
                        }
                    .onDelete { del in
                        del.map { viewModel.allItems[$0] }.forEach { sale in
                            viewModel.delete(item: sale)
                        }
                    }
                }
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Sales")
                }
                .tag(1)
            }
            .navigationBarTitle("Recent Transactions")
            .navigationBarItems(trailing: newEntryButton)
            .padding(EdgeInsets(top: 44, leading: 0, bottom: 24, trailing: 0))
            .edgesIgnoringSafeArea(.all)
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
