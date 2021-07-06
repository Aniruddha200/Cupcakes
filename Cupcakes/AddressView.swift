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
	
	@State private var houseNo = ""
	@State private var address1 = ""
	@State private var address2 = ""
	@State private var pincode = ""
    var body: some View {
		Section(header: Text("Fill the address")){
			TextField("House no", text: $houseNo)
			TextField("Address Line 1", text: $address1)
			TextField("Address Line 2", text: $address2)
			TextField("Pin code", text: $pincode)
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
