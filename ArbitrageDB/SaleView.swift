//
//  SwiftUIView.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 9/1/21.
//

import SwiftUI

struct saleView: View {
    @ObservedObject var item:SaleItem
    let viewModel: ViewModel

    var body: some View {
        NavigationView{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 125)
                .foregroundColor(Color(UIColor.systemGray2))
                .overlay(
                    HStack{
                        Text("Sale! \(item.grossTotal, specifier: "%.2f")")
                         .padding()
                        Text("\(item.sellDescriptor)")
                    }

                )

        }
        .navigationBarItems(trailing: editButton)
        
    }
    
    
    var editButton: some View {
        Button("Edit"){
            showEntry = true
        }
        .sheet(isPresented: $showEntry){
            editEntryView(viewModel: viewModel, editItem:item, isPresented: $showEntry)
        }
    }

    @State var showEntry: Bool = false
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SaleView()
//    }
//}
