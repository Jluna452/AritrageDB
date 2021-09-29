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
            otherFeesAngle = Double(item.otherFees/item.grossTotal)*360
            shippingFeesAngle = otherFeesAngle + Double(item.otherFees/item.grossTotal)*360
            itemCostAngle = shippingFeesAngle + Double(item.itemCost/item.grossTotal)*360
            grossProfitAngle = 360
        }
        
        else{
            let divisor = Double(item.otherFees + item.itemCost + item.shippingFees)
            otherFeesAngle = (Double(item.otherFees)/divisor) * 360
            shippingFeesAngle = otherFeesAngle + (Double(item.shippingFees)/divisor) * 360
            itemCostAngle = 360
        }
    }

    var body: some View {
        NavigationView{
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
//                        .overlay(
//                            Group{
//                                Text("Gross Profit")
//                                Text((item.grossTotal - item.shippingFees - item.otherFees - item.itemCost), specifier: "%.2f"))
//                            }
//                            
//                        )
                        .frame(width: 250, height: 250, alignment: .center)
                }
                
            }

        }
        .navigationBarTitle("\(item.sellDescriptor) stats:")
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
    
    var startAngle:Double = 0
    var otherFeesAngle:Double = 0
    var shippingFeesAngle:Double = 0
    var itemCostAngle:Double = 0
    var grossProfitAngle:Double = 0
}

struct PieChartRows: View {
    var colors: [Color]
    var names: [String]
    var values: [String]
    var percents: [String]

    var body: some View {
        VStack{
            ForEach(0..<self.values.count){ i in
                HStack {
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(self.colors[i])
                        .frame(width: 20, height: 20)
                    Text(self.names[i])
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(self.values[i])
                        Text(self.percents[i])
                            .foregroundColor(Color.gray)
                    }
                }
            }
        }
    }
}

//struct PieChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        PieChartView(values: [1300, 500, 300], colors: [Color.blue, Color.green, Color.orange], names: ["Rent", "Transport", "Education"], backgroundColor: Color(red: 21 / 255, green: 24 / 255, blue: 30 / 255, opacity: 1.0), innerRadiusFraction: 0.6)
//    }
//}
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SaleView()
//    }
//}
