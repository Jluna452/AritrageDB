//
//  SwiftUIView.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 6/20/21.
//

import SwiftUI

struct NewEntryView: View {
    @ObservedObject var viewModel:ViewModel
    
    var body: some View {
  
        NavigationView {
            ScrollView {
//                textFieldView(placeHolder: "Sale Item Name", fieldName: "Name", data: name)

//                textFieldView(placeHolder: "Sale Item Price", fieldName: "Price", data: price)
//                textFieldView(placeHolder: "Sale Item Profit", fieldName: "Profit", data:profit)
                
                Group{
                    VStack{
                        Text("Name")
                            .font(.headline)
                        TextField("Sale Item Name", text: $name)
                        { isEditing in
                            } onCommit: {
                            }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .disableAutocorrection(true)
                            .border(Color(UIColor.separator))
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
                    VStack{
                        Text("Price")
                            .font(.headline)
                        TextField("Sale Item Price", text: $price)
                        { isEditing in
                            } onCommit: {
                            }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .disableAutocorrection(true)
                            .border(Color(UIColor.separator))
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
                    VStack{
                        Text("Profit")
                            .font(.headline)
                        TextField("Sale Item Profit", text: $profit)
                        { isEditing in
                            } onCommit: {
                            }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .disableAutocorrection(true)
                            .border(Color(UIColor.separator))
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10.0)
                    }
                    
                }

            }
            .navigationBarTitle("New Entry")
            .navigationBarItems(leading: cancel, trailing: done)
        }
        DatePicker("Enter Buy Date", selection: $buyDate, displayedComponents: .date)
            .datePickerStyle(WheelDatePickerStyle())
        DatePicker("Enter Sell Date", selection: $sellDate, displayedComponents: .date)
            .datePickerStyle(WheelDatePickerStyle())
        
    }
    
    @State var sellDate = Date()
    @State var buyDate = Date()
    @State var name:String = ""
    @State var price:String = ""
    @State var profit:String = ""
    
    @Binding var isPresented: Bool
    
    var cancel: some View {
        Button("Cancel") {
            self.isPresented = false
        }
    }
    
    var done: some View {
        Button("Done") {
//            VM.storeNewObject(sellDescriptor: name, buyDate: buyDate, sellDate: sellDate)
            viewModel.storeNewSale(sellDescriptor: name, buyDate: buyDate, sellDate: sellDate)
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
