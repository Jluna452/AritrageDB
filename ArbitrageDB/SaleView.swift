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
    
    init(item:SaleItem, viewModel:ViewModel){
        self.item = item
        self.viewModel = viewModel
        
        if item.profitable{
            otherFeesAngle = Double(item.otherFees/item.sellPrice)*360
            shippingFeesAngle = otherFeesAngle + Double(item.otherFees/item.sellPrice)*360
            itemCostAngle = shippingFeesAngle + Double(item.initialCost/item.sellPrice)*360
            grossProfitAngle = 360
        }
        
        else{
            let divisor = Double(item.otherFees + item.initialCost + item.shippingFees)
            otherFeesAngle = (Double(item.otherFees)/divisor) * 360
            shippingFeesAngle = otherFeesAngle + (Double(item.shippingFees)/divisor) * 360
            itemCostAngle = 360
        }
    }

    var body: some View {
        VStack{
            
            Text("Item Sold for $\(item.sellPrice, specifier: "%.2f")")
                
            ZStack{
                Group{
                    if(item.profitable){
                        Pie(startAngle: Angle.degrees(startAngle), endAngle: Angle.degrees(otherFeesAngle), clockWise: false)
                            .foregroundColor(.red)
                        
                        Pie(startAngle: Angle.degrees(otherFeesAngle), endAngle: Angle.degrees(shippingFeesAngle), clockWise: false)
                            .foregroundColor(.blue)

                        Pie(startAngle: Angle.degrees(shippingFeesAngle), endAngle: Angle.degrees(itemCostAngle), clockWise: false)
                                .foregroundColor(Color.purple)

                        Pie(startAngle: Angle.degrees(itemCostAngle), endAngle: Angle.degrees(grossProfitAngle), clockWise: false)
                            .foregroundColor(Color.orange)
                    }
                    else{
                        Pie(startAngle: Angle.degrees(startAngle), endAngle: Angle.degrees(otherFeesAngle), clockWise: false)
                            .foregroundColor(Color.red)

                        Pie(startAngle: Angle.degrees(otherFeesAngle), endAngle: Angle.degrees(shippingFeesAngle), clockWise: false)
                                .foregroundColor(Color.blue)


                        Pie(startAngle: Angle.degrees(shippingFeesAngle), endAngle: Angle.degrees(itemCostAngle), clockWise: false)
                                .foregroundColor(.purple)

                    }
                    
                    Circle()
                        .foregroundColor(Color.white)
                        .overlay(
                            Group{
                                VStack{
                                    Text("Gross Profit")
                                    Text("$\(item.sellPrice - (item.shippingFees + item.otherFees + item.initialCost), specifier: "%.2f")")
                                    Text("Quantity: \(item.quantity)")
                                }
                                
                            }

                        )
                        .frame(width: 250, height: 250, alignment: .center)
                }
                
                
            }
            legend
            editButton

        }
        
    }
    
    
    var legend: some View{
        VStack{
            Group{
                HStack{
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(.purple)
                        .frame(width: 20, height: 20)
                        Text("Initial cost")
                    Spacer()
                        Text("$\(item.initialCost, specifier: "%.2f")")
                }

            }
            
            
            Group{
                HStack{
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(.blue)
                        .frame(width: 20, height: 20)
                        Text("shipping fees")
                    Spacer()
                    Text("$\(item.shippingFees, specifier: "%.2f")")
                    
                }
                
            }
            
            
            Group{
                HStack{
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(.red)
                        .frame(width: 20, height: 20)
                        Text("miscelanous fees")
                        Spacer()
                        Text("$\(item.otherFees, specifier: "%.2f")")
                        
                }

            }
            
           
            
            Group{
                HStack{
                    RoundedRectangle(cornerRadius: 5.0)
                    .fill(.orange)
                    .frame(width: 20, height: 20)
                    Text("Gross profit")
                    Spacer()
                    Text("$\(item.sellPrice - (item.otherFees + item.initialCost + item.shippingFees), specifier: "%.2f")")
                    
                }
                
            }
        
        }

    }
    

    var editButton: some View {
        Button("Edit"){
            showEntry = true
        }
        .sheet(isPresented: $showEntry){
            editEntryView(viewModel: viewModel, editItem:item, isPresented: $showEntry)
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(Color.black)
        .cornerRadius(10)
    }

    @State var showEntry: Bool = false
    
    var startAngle:Double = 0
    var otherFeesAngle:Double = 0
    var shippingFeesAngle:Double = 0
    var itemCostAngle:Double = 0
    var grossProfitAngle:Double = 0
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SaleView()
//    }
//}
