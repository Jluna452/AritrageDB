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
//    @ObservedObject var arbitrageDB:ArbitrageDatabase
//    @FetchRequest var items: FetchedResults<SaleItem>
    

    var body: some View {
        NavigationView {
            List{
                ForEach(ArbitrageDatabase.shared.getAllItems()){ item in
//                    saleView(num:item)
                    Text("\(item.sellDescriptor)")
                    
                }
            }
            .navigationBarTitle("Recent Transactions")
            .navigationBarItems(trailing: newEntryButton)
        }


    }
    
    
    
//    init(){
//        ArbitrageDatabase.shared.createNewItem()
//        ArbitrageDatabase.shared.createNewItem()
//        ArbitrageDatabase.shared.createNewItem()
//        ArbitrageDatabase.shared.createNewItem()
//    }
    
    var newEntryButton: some View {
        Button("New"){
            showNewEntry = true
        }
        .sheet(isPresented: $showNewEntry){
            NewEntryView(isPresented: $showNewEntry)
        }
    }
    
    @State var showNewEntry: Bool = false
}



//
//struct saleView: View {
//    @FetchRequest(fetchRequest: SaleItem.fetchRequest()) var saleItem: FetchedResults<SaleItem>
//    
//    
//    var body: some View {
//        RoundedRectangle(cornerRadius: 20)
//            .frame(width: 350, height: 125)
//            .foregroundColor(Color(UIColor.systemGray5))
//            .overlay(
//                HStack{
//                    Text("Sale! \(num.saleDescriptor)")
//                     .padding()
//                    Text("\(num.entryDate)")
//                }
//
//            )
//
//    }
//    
//    var num: SaleItem
//}
//
//
//
















//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
