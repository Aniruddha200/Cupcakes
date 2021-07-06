//
//  Order.swift
//  Cupcakes
//
//  Created by administrator on 03/07/2021.
//

import Foundation

class Order: ObservableObject, Codable{
	
	@Published var quantity = 1
	@Published var type = 0
	@Published var topUps = false
	@Published var extraCream = false
	@Published var sprinkles = false
	@Published var houseNo = ""
	@Published var address1 = ""
	@Published var address2 = ""
	@Published var pincode = ""
	
	enum CodingKyes: CodingKey{
		case quantity
		case type
		case topUps
		case extraCream
		case sprinkles
		case houseNo
		case address1
		case address2
		case pincode
		
	}
	
	
	
	let cakeTypes = ["Chocolate", "Vanilla", "Cheese", "Mango"]
	
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
	
	init() {
		//
	}
	
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKyes.self)
		quantity = try container.decode(Int.self, forKey: .quantity)
		type = try container.decode(Int.self, forKey: .type)
		topUps = try container.decode(Bool.self, forKey: .topUps)
		extraCream = try container.decode(Bool.self, forKey: .extraCream)
		sprinkles = try container.decode(Bool.self, forKey: .sprinkles)
		houseNo = try container.decode(String.self, forKey: .houseNo)
		address1 = try container.decode(String.self, forKey: .address1)
		address2 = try container.decode(String.self, forKey: .address2)
		pincode = try container.decode(String.self, forKey: .pincode)
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKyes.self)
		try container.encode(quantity, forKey: .quantity)
		try container.encode(type, forKey: .type)
		try container.encode(topUps, forKey: .topUps)
		try container.encode(extraCream, forKey: .extraCream)
		try container.encode(sprinkles, forKey: .sprinkles)
		try container.encode(houseNo, forKey: .houseNo)
		try container.encode(address1, forKey: .address1)
		try container.encode(address2, forKey: .address2)
		try container.encode(pincode, forKey: .pincode)
		
	}
}
