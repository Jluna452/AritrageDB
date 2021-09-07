//
//  SwiftUIView.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 6/20/21.
//

import SwiftUI
import Combine

struct NewEntryView: View {
    @ObservedObject var viewModel:ViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                Group{
                    VStack{
                        Text("Name")
                            .font(.headline)
                        TextField("Item Name", text: $name)
                        { isEditing in
                            } onCommit: {
                            }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .disableAutocorrection(false)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
                    HStack{
                        Text("Price")
                            .font(.headline)
                            .fixedSize()
                        Text("$")
                        TextField("0.00", text: $price)
                        { isEditing in
                            } onCommit: {
                                
                            }
                        .keyboardType(.numberPad)
                        .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                            .disableAutocorrection(true)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }


                    HStack{
                        Text("Profit")
                            .font(.headline)
                            .fixedSize()
                        Text("$")
                        TextField("0.00", text: $profit)
                        { isEditing in
                            } onCommit: {
                            }
                        .keyboardType(.numberPad)
                        .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                            .disableAutocorrection(true)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
                    HStack{
                        Text("Shipping Fees")
                            .font(.headline)
                            .fixedSize()
                        Text("$")
                        TextField("0.00", text: $shippingFees)
                        { isEditing in
                            } onCommit: {
                            }
                        .keyboardType(.numberPad)
                        .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                            .disableAutocorrection(true)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
                    HStack{
                        Text("Miscellaneous Fees")
                            .font(.headline)
                            .fixedSize()
                        Text("$")
                        TextField("0.00", text: $miscFees)
                        { isEditing in
                            } onCommit: {
                            }
                        .keyboardType(.numberPad)
                        .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                            .disableAutocorrection(true)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
                    
                    
                    HStack{
                        Text("Quantity")
                            .font(.headline)
                            .fixedSize()
                        TextField("Total number of Items", text: $quantity)
                                    .keyboardType(.numberPad)
                            .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                                .disableAutocorrection(true)
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(10.0)
                        
                    }
                           
                }


                DatePicker("Enter Buy Date", selection: $buyDate, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                Divider()

                DatePicker("Enter Sell Date", selection: $sellDate, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())

            }
            .navigationBarTitle("New Entry")
            .navigationBarItems(leading: cancel, trailing: done)

        }

        
    }
    
    @State var sellDate:Date = Date()
    @State var buyDate:Date = Date()
    @State var name:String = ""
    @State var price:String = ""
    @State var profit:String = ""
    @State var miscFees:String = ""
    @State var shippingFees:String = ""
    @State var quantity: String = ""
    
    
    @Binding var isPresented: Bool
    
    var cancel: some View {
        Button("Cancel") {
            self.isPresented = false
        }
    }
    
    var done: some View {
        Button("Done") {
            viewModel.storeNewSale(sellDescriptor: name, buyDate: buyDate, sellDate: sellDate, price: price, profit: profit, shippingFee: shippingFees, miscFees: miscFees)
            self.isPresented = false
        }
    }
}



//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewEntryView()
//    }
//}
