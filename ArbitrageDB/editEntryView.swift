//
//  editEntryView.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 9/9/21.
//

import Foundation

import SwiftUI
import Combine

struct editEntryView: View {
     var viewModel:ViewModel
    @ObservedObject var editItem:SaleItem
    
    var body: some View {
        NavigationView {
            ScrollView {
                Group{
                    VStack{
                        RoundedRectangle(cornerRadius: 20)
                            .overlay(
                                ZStack{
                                    if let image = UIImage(data: editItem.image){
                                        Image(uiImage: image)
                                            .resizable()
                                            .cornerRadius(20, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    }
                                    pickImage
                                }
                            )
                            .frame(width: UIScreen.main.bounds.width - 75, height: 300)
                        Text("Name")
                            .font(.headline)
                        TextField("\(editItem.sellDescriptor)", text: $entry.name)
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
                        TextField("\(editItem.itemCost)", text: $entry.price)
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
                        TextField("\(editItem.grossTotal)", text: $entry.profit)
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
                        TextField("\(editItem.shippingFees)", text: $entry.shippingFees)
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
                        TextField("\(editItem.otherFees)", text: $entry.miscFees)
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
                        TextField("\(editItem.quantity)", text: $entry.quantity)
                                    .keyboardType(.numberPad)
                            .frame(width: UIScreen.main.bounds.width - 300, height: 45, alignment: .leading)
                                .disableAutocorrection(true)
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(10.0)
                        
                    }
                           
                }

            }
            .navigationBarTitle("Edit '\(editItem.sellDescriptor)'")
            .navigationBarItems(leading: cancel, trailing: done)

        }
    }
    
    @State private var entry = entryFields()
    
    
    @Binding var isPresented: Bool
    
    var cancel: some View {
        Button("Cancel") {
            self.isPresented = false
        }
    }
    
    var done: some View {
        Button("Done") {
            viewModel.editSale(editItem: editItem,
                               sellDescriptor: entry.name,
                               price: entry.price,
                               profit: entry.profit,
                               shippingFee: entry.shippingFees,
                               miscFees: entry.miscFees,
                               quantity: entry.quantity,
                               image: entry.image)
            self.isPresented = false
        }
    }
    
    @State private var showImagePicker = false
    @State private var imagePickerSourceType = UIImagePickerController.SourceType.photoLibrary
    
    var pickImage:some View {
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
}


