//
//  SwiftUIView.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 9/1/21.
//

import SwiftUI

struct saleView: View {
    let item:SaleItem
    
    
    var body: some View {
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

}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SaleView()
//    }
//}
