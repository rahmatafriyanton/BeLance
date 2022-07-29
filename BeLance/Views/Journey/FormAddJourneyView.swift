	//
	//  AddJourneyView.swift
	//  BeLance
	//
	//  Created by Rahmat Afriyanton on 28/07/22.
	//

import SwiftUI

struct FormAddJourneyView: View {
	@EnvironmentObject var journeys: JourneyModel

	@Binding var isPresented: Bool
	@State var nama_journey: String
	var journey_id: Int

	@State var isAlert = false

	var body: some View {
		NavigationView {
			ZStack {
				Color.gray.opacity(0.1).ignoresSafeArea(.all)

				VStack (alignment: .leading) {
					LabelTextView(text: "Journey Name")
					TextField("Name your journey", text: $nama_journey)
						.padding()
						.background(.white)
						.cornerRadius(UIConst.cornerRadius)
						.disableAutocorrection(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
						.autocapitalization(/*@START_MENU_TOKEN@*/.words/*@END_MENU_TOKEN@*/)
					Spacer()
				}.padding()
			}
			.navigationTitle("Add New Journey")
			.navigationBarTitleDisplayMode(.inline)
			.navigationBarItems(leading: leading, trailing: trailing)
			.alert(isPresented: $isAlert, content: {
				let title = Text("No Data")
				let msg = Text("Please fill all the data")
				return Alert(title: title, message: msg)
			})
			
		}
	}

	var leading: some View {
		Button(action: {
			isPresented.toggle()
		}, label: {
			Text("Cancel").foregroundColor(Color("dark"))
		})
	}

	var trailing: some View {
		Button(action: {
			if (nama_journey != "") {
				saveData()
			} else {
				isAlert.toggle()
			}
		}, label: {
			Text("Save").foregroundColor(Color("dark"))
		})
	}

	func saveData() {
		let params = ["nama_journey": nama_journey]
		if (journey_id == 0) {
			journeys.createData(params: params)
		} else {
			journeys.updateData(params: params, id: journey_id)
		}
		usleep(1000000)
		isPresented.toggle()
		journeys.fetchData()
	}
}
	//
	//struct AddJourneyView_Previews: PreviewProvider {
	//    static var previews: some View {
	//        AddJourneyView()
	//    }
	//}
