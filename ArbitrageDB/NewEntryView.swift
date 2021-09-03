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
    
    init(viewModel:ViewModel, isPresented:Binding<Bool>, saleItem: SaleItem) {
        self.viewModel = viewModel
        self._isPresented = isPresented
        self.editItem = saleItem
        
        sellDate = saleItem.sellDate
        buyDate = saleItem.buyDate
        name = saleItem.sellDescriptor
        price = String(saleItem.itemCost)
        profit = String(saleItem.grossTotal)
        miscFees = String(saleItem.otherFees)
        shippingFees = String(saleItem.shippingFees)
        quantity = String(saleItem.quantity)
        
    }
    
    init(viewModel:ViewModel, isPresented:Binding<Bool>) {
        self.viewModel = viewModel
        self._isPresented = isPresented
    }
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
//                    Divider()

                    HStack{
                        Text("Price")
                            .font(.headline)
                            .fixedSize()
                        TextField("$0.00", text: $price)
                        { isEditing in
                            } onCommit: {
                                
                            }
                        .keyboardType(.numberPad)
                        .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                            .disableAutocorrection(true)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
//                    Divider()

                    HStack{
                        Text("Profit")
                            .font(.headline)
                            .fixedSize()
                        TextField("$0.00", text: $profit)
                        { isEditing in
                            } onCommit: {
                            }
                        .keyboardType(.numberPad)
                        .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                            .disableAutocorrection(true)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
//                    Divider()
                    HStack{
                        Text("Shipping Fees")
                            .font(.headline)
                            .fixedSize()
                        TextField("$0.00", text: $shippingFees)
                        { isEditing in
                            } onCommit: {
                            }
                        .keyboardType(.numberPad)
                        .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                            .disableAutocorrection(true)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
//                    Divider()
                    HStack{
                        Text("Miscellaneous Fees")
                            .font(.headline)
                            .fixedSize()
                        TextField("$0.00", text: $miscFees)
                        { isEditing in
                            } onCommit: {
                            }
                        .keyboardType(.numberPad)
                        .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                            .disableAutocorrection(true)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
                    
                    
//                    Divider()
//
                    HStack{
                        Text("Quantity")
                            .font(.headline)
                            .fixedSize()
                        TextField("Total number of Items", text: $quantity)
                                    .keyboardType(.numberPad)
//                                    .onReceive(Just(quantity)) { newValue in
//                                        let filtered = newValue.filter { "0123456789".contains($0) }
//                                        if filtered != newValue {
//                                            quantity = filtered
//                                        }
//                                }
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
    @State var price:String = "sfd"
    @State var profit:String = ""
    @State var miscFees:String = ""
    @State var shippingFees:String = ""
    @State var quantity: String = "9.99"
    
    
    @Binding var isPresented: Bool
    
    var editItem: SaleItem?
    
    var cancel: some View {
        Button("Cancel") {
            self.isPresented = false
        }
    }
    
    var done: some View {
        Button("Done") {
            if editItem == nil{
                viewModel.storeNewSale(sellDescriptor: name, buyDate: buyDate, sellDate: sellDate, price: price, profit: profit, shippingFee: shippingFees, miscFees: miscFees)
            }
            else{
                viewModel.editSale(editItem: editItem!, sellDescriptor: name, buyDate: buyDate, sellDate: sellDate, price: price, profit: profit, shippingFee: shippingFees, miscFees: miscFees)
            }

            self.isPresented = false
        }
    }
}





//
//struct textFieldView: View {
//    var body: some View {
//        VStack{
//            Text(fieldName)
//                .font(.headline)
//            TextField(placeHolder, text: $data)
//            { isEditing in
//                } onCommit: {
//                }
//            .frame(width: UIScreen.main.bounds.width - 30, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .disableAutocorrection(true)
//                .border(Color(UIColor.separator))
//                .background(Color(UIColor.systemGray5))
//                .cornerRadius(10.0)
//        }
//
//    }
//
//    var placeHolder: String
//    var fieldName: String
//    @State var data:String
////    var isEditing = false
//}



//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewEntryView()
//    }
//}
