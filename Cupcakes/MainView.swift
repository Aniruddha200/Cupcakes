//
//  MainView.swift
//  Cupcakes
//
//  Created by administrator on 03/07/2021.
//

import SwiftUI




struct MainView: View {
	
	@ObservedObject var order = Order()
	
    var body: some View {
		
		NavigationView{
			VStack{
				Picker("Select the Type", selection: $order.orderDetails.type){
					ForEach(0..<order.orderDetails.cakeTypes.count){
						Text("\(order.orderDetails.cakeTypes[$0])")
					}
				}
				.pickerStyle(MenuPickerStyle())
				
				
				Stepper("Quantity \(order.orderDetails.quantity)", value: $order.orderDetails.quantity)
				
				
				Toggle("Wanna Customize?", isOn: $order.orderDetails.topUps.animation())
				
				if order.orderDetails.topUps{
					Toggle("Exta Cream", isOn: $order.orderDetails.extraCream)
					Toggle("Sprinkles", isOn: $order.orderDetails.sprinkles)
				}
				
				NavigationLink("Add Address", destination: AddressView(of: order))
				
			}
			.navigationBarTitle("Cupcakes")
		}
		
		
		
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
