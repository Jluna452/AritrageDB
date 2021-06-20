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
    var body: some View {
        NavigationView {
            List{
                ForEach(0..<10){ item in
                    saleView(num:item)
                    
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
            NewEntryView()
        }
    }
    
    @State var showNewEntry: Bool = false
}




struct saleView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 350, height: 125)
            .foregroundColor(Color(UIColor.systemGray5))
            .overlay(
                HStack{
                    Text("Sale! \(num)")
                     .padding()
                    Text("$200.05")
                }

            )

    }
    
    var num: Int
}



















//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
