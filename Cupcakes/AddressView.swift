//
//  AddressView.swift
//  Cupcakes
//
//  Created by administrator on 03/07/2021.
//

import SwiftUI

struct AddressView: View {
	@ObservedObject var order: Order
	
	init(of order: Order) {
		self.order = order
	}
	
    var body: some View {
		Section(header: Text("Fill the address")){
			TextField("House no", text: $order.houseNo)
			TextField("Address Line 1", text: $order.address1)
			TextField("Address Line 2", text: $order.address2)
			TextField("Pin code", text: $order.pincode)
		}
		.textFieldStyle(RoundedBorderTextFieldStyle())
		.padding()
		
		NavigationLink("Place Order", destination: OrderView(of: order))
		
			.navigationBarTitle("Address", displayMode: .inline)
    }
	
	
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
		AddressView(of: Order())
    }
}
