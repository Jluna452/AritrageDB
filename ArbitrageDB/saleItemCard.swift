//
//  saleItemCard.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 9/2/21.
//

import SwiftUI

struct saleItemCard: View {
    @ObservedObject var item:SaleItem
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: UIScreen.main.bounds.width - 75, height: 125)
                .foregroundColor(Color(UIColor.systemBlue))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                .overlay(
                    HStack{
                        Image("fall-leaves")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100, alignment: .center)
                            .padding(.all, 20)
                            .clipped()
                        VStack(alignment: .leading){
                            Text(item.sellDescriptor)
                                .font(.system(size: 26, weight: .bold, design: .default))
                            Text("Quantity: \(item.quantity)")
                                .font(.system(size: 16, weight: .bold, design: .default))
                        }

                            Text("\(item.grossTotal, specifier: "%.2f")")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .padding(.top, 8)

                    }
                )
        }
    }
        
}

//struct saleItemCard_Previews: PreviewProvider {
//    static var previews: some View {
//        saleItemCard()
//    }
//}
