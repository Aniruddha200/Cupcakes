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
				Picker("Select the Type", selection: $order.type){
					ForEach(0..<order.cakeTypes.count){
						Text("\(order.cakeTypes[$0])")
					}
				}
				.pickerStyle(MenuPickerStyle())
				
				
				Stepper("Quantity \(order.quantity)", value: $order.quantity)
				
				
				Toggle("Wanna Customize?", isOn: $order.topUps.animation())
				
				if order.topUps{
					Toggle("Exta Cream", isOn: $order.extraCream)
					Toggle("Sprinkles", isOn: $order.sprinkles)
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
