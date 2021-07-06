//
//  OrderView.swift
//  Cupcakes
//
//  Created by administrator on 03/07/2021.
//

import SwiftUI

struct OrderView: View {
	
	@State private var customMassage = ""
	@State private var isShowing = false
	
	@ObservedObject var order: Order
	
	init(of order: Order) {
		self.order = order
	}
	
    var body: some View {
		VStack{
			GeometryReader{ geo in
			Image("cupcakes")
				.resizable()
				.scaledToFit()
				.frame(maxWidth: geo.size.width, maxHeight: geo.size.height / 2.0)
				
				
			}
			
			Text("Totol Cost: \(order.cost, specifier: "%.2f")")
				.padding()
			
			Button("Pay"){
				self.payment()
			}
			.frame(width: 200, height: 50)
			.background(Color.green)
			.clipShape(Capsule())
			.overlay(Capsule().stroke(style: StrokeStyle(lineWidth: 3, dash: [12], dashPhase: 2)))
			.alert(isPresented:$isShowing){
				Alert(title: Text("Thank You!"), message: Text("\(customMassage)"), dismissButton: .default(Text("OK")))
			}
			.padding()
			
			.navigationBarTitle("Payment", displayMode: .inline
			)
			
			
			
		}
    }
	
	func payment(){
		let url = URL(string: "https://reqres.in/api/cupcakes")
		var request = URLRequest(url: url!)
		request.httpMethod = "GET"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		URLSession.shared.dataTask(with: request){ data, res, error in
			guard let data = data else{
				print("Error: \(error?.localizedDescription ?? "Unknown Error")")
				self.customMassage = error?.localizedDescription ?? "Unknown Error Occured"
				self.isShowing.toggle()
				return
			}
			
			guard let decodedData =  try? JSONDecoder().decode(APIResponse.self, from: data) else{
				print("Decoding Failed!")
				return
			}
			
			self.customMassage = decodedData.support.text
			
			self.isShowing.toggle()
			
			
			return
			
			
		}.resume()
		
	}
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
		OrderView(of: Order())
    }
}
