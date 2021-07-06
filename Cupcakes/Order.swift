//
//  Order.swift
//  Cupcakes
//
//  Created by administrator on 03/07/2021.
//

import Foundation

class Order: ObservableObject, Codable {
	@Published var orderDetails = OrderDetails()
	
	enum CodingKyes: CodingKey{
		case orderDetails
		
	}
	
	init() {
		//
	}
	
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKyes.self)
		orderDetails = try container.decode(OrderDetails.self, forKey: .orderDetails)
		
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKyes.self)
		try container.encode(orderDetails, forKey: .orderDetails)
		
		
	}
}

struct OrderDetails: Codable{
	
	var quantity = 1
	var type = 0
	var cakeTypes = ["Chocolate", "Vanilla", "Cheese", "Mango"]
	var topUps = false
	var extraCream = false
	var sprinkles = false
	var addressValidity = true
	var houseNo = ""
	var address1 = ""
	var address2 = ""
	var pincode = ""{
		didSet{
			if houseNo.trimmingCharacters(in: .whitespacesAndNewlines).count >= 3 && address1.trimmingCharacters(in: .whitespacesAndNewlines).count >= 4 && address2.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 && pincode.trimmingCharacters(in: .whitespacesAndNewlines).count == 5{
				addressValidity = false
			}
			else{
				addressValidity = true
			}
		}
	}
	var cost: Double{
		var amount = (Double(type) + 1) * 4
		amount *= Double(quantity)
		
		if extraCream{
			amount += 1
		}
		
		if sprinkles {
			amount += 0.50
		}
		
		return amount
	}
	
}
