//
//  Order.swift
//  Cupcakes
//
//  Created by administrator on 03/07/2021.
//

import Foundation

class Order: ObservableObject{
	
	@Published var quantity = 1
	@Published var type = 0
	@Published var topUps = false
	@Published var extraCream = false
	@Published var sprinkles = false
	
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
	
//	init(_: String?) {
//		//
//	}
}
