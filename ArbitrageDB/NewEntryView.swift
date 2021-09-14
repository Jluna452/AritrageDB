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
                        pickImage
                            .frame(width: UIScreen.main.bounds.width - 75, height: 125)
                            .foregroundColor(Color(UIColor.systemBlue))
                            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                        Text("Name")
                            .font(.headline)
                        TextField("Item Name", text: $entry.name)
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
                        TextField("0.00", text: $entry.price)
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
                        TextField("0.00", text: $entry.profit)
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
                        TextField("0.00", text: $entry.shippingFees)
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
                        TextField("0.00", text: $entry.miscFees)
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
                        TextField("Total number of Items", text: $entry.quantity)
                                    .keyboardType(.numberPad)
                            .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                                .disableAutocorrection(true)
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(10.0)
                        
                    }
                           
                }


                DatePicker("Enter Buy Date", selection: $entry.buyDate, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                Divider()

                DatePicker("Enter Sell Date", selection: $entry.sellDate, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())

            }
            .navigationBarTitle("New Entry")
            .navigationBarItems(leading: cancel, trailing: done)

        }

        
    }
    
    
    @State private var entry = entryFields()
    
    @Binding var isPresented: Bool
    
    @State private var showImagePicker = false
    @State private var imagePickerSourceType = UIImagePickerController.SourceType.photoLibrary
    
    private var pickImage: some View {
        HStack {
            Image(systemName: "photo").imageScale(.large).foregroundColor(.accentColor).onTapGesture {
                self.imagePickerSourceType = .photoLibrary
                self.showImagePicker = true
            }
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                Image(systemName: "camera").imageScale(.large).foregroundColor(.accentColor).onTapGesture {
                    self.imagePickerSourceType = .camera
                    self.showImagePicker = true
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: self.imagePickerSourceType) { image in
                entry.image = image
                self.showImagePicker = false
            }
        }
    }
    
    var cancel: some View {
        Button("Cancel") {
            self.isPresented = false
        }
    }
    
    var done: some View {
        Button("Done") {
            viewModel.storeNewSale(sellDescriptor: entry.name,
                                   buyDate: entry.buyDate,
                                   sellDate: entry.sellDate,
                                   price: entry.price,
                                   profit: entry.profit,
                                   shippingFee: entry.shippingFees,
                                   miscFees: entry.miscFees,
                                   quantity: entry.quantity,
                                   image: entry.image)
            self.isPresented = false
        }
        .disabled(entry.name.isEmpty)
    }
}




//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewEntryView()
//    }
//}
