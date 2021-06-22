//
//  SwiftUIView.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 6/20/21.
//

import SwiftUI

struct NewEntryView: View {
    var body: some View {
        Section(header: Text("New Entry")){
            ScrollView{
                Spacer()
                textFieldView(placeHolder: "Sale Item Name", fieldName: "Name")
                DatePicker("Enter Buy Date", selection: $sellDate, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                DatePicker("Enter Sell Date", selection: $sellDate, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                textFieldView(placeHolder: "Sale Item Price", fieldName: "Price")
                textFieldView(placeHolder: "Sale Item Profit", fieldName: "Profit")
            }
        }
    }
    
 @State var sellDate = Date()
}

struct textFieldView: View {
    var body: some View {
        VStack{
            Text(fieldName)
                .font(.headline)
            TextField(placeHolder, text: $data)
            { isEditing in
        //                    self.isEditing = isEditing
                } onCommit: {
        //                    validate(name: username)
                }
            .frame(width: UIScreen.main.bounds.width - 30, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                .border(Color(UIColor.separator))
                .background(Color(UIColor.systemGray5))
                .cornerRadius(10.0)
        }
        
    }

    var placeHolder: String
    var fieldName: String
    @State var data:String = " "
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NewEntryView()
    }
}
