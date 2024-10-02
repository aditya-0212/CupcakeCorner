//
//  Order.swift
//  CupcakeCorner
//
//  Created by APPLE on 14/07/24.
//

import Foundation

struct Address:Codable{
    var name:String
    var streetAddress:String
    var city:String
    var zip:String
}

@Observable
class Order: Codable{
    
//    enum CodingKeys: String, CodingKey {
//        case _type = "type"
//        case _quantity = "quantity"
//        case _specialRequestEnabled = "specialRequestEnabled"
//        case _extraFrosting = "extraFrosting"
//        case _addSprinkles = "addSprinkles"
//        case _name = "name"
//        case _city = "city"
//        case _streetAddress = "streetAddress"
//        case _zip = "zip"
//    }
    static let types = ["Vanila","Strawberry","Chocklate","Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false{
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var addressDetail = Address(name: "",streetAddress: "",city: "",zip: "")
    
//    var name = ""
//    var streetAddress = ""
//    var city = ""
//    var zip = ""
    
//    var hashValidAddress:Bool{
//        if name.trimmingCharacters(in: .whitespaces).isEmpty || streetAddress.trimmingCharacters(in: .whitespaces).isEmpty || city.trimmingCharacters(in: .whitespaces).isEmpty || zip.trimmingCharacters(in: .whitespaces).isEmpty{
//            return false
//        }
//        
//        return true
//    }
    
    var cost:Decimal{
        //$2 per cake
        var cost = Decimal(quantity) * 2
        //complecated cakes cost more
        cost += Decimal(type)/2
        //$1 for extra frosting
        if extraFrosting{
            cost += Decimal(quantity)
        }
        //$0.5 for sprinkels
        if addSprinkles{
            cost += Decimal(quantity)/2
        }
        return cost
    }
}
