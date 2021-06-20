//
//  ContentView.swift
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
            .navigationBarTitle("Recent")
            .navigationTitle("asds")
            .navigationBarItems(trailing:
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus").imageScale(.large)
                }))
        }


    }
}

struct saleView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: UIScreen.main.bounds.width - 32, height: 125)
            .foregroundColor(.gray)
            .overlay(
                HStack{
                    Text("First Sale! \(num)")
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
