//
//  EntryFields.swift
//  ArbitrageDB
//
//  Created by Jordan Luna on 9/14/21.
//

import Foundation
import SwiftUI

struct entryFields {
    var sellDate:Date = Date()
    var buyDate:Date = Date()
    var name:String = ""
    var price:String = ""
    var profit:String = ""
    var miscFees:String = ""
    var shippingFees:String = ""
    var quantity: String = ""
    var image:UIImage? = nil
}
