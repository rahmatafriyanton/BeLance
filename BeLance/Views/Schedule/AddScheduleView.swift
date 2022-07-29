	//
	//  AddScheduleView.swift
	//  BeLance
	//
	//  Created by Rahmat Afriyanton on 25/07/22.
	//

import SwiftUI

struct AddScheduleView: View {
	@Binding var isPresented: Bool
	@Environment(\.presentationMode) var presentationMode
	@EnvironmentObject var schedules: ScheduleModel

	@State var isAlert = false
	@State var formData = ["schedule_type": "", "time": ""]
	@State private var time =  Date()

	@State var buttonTypes = [
		DefaultButton(
			text: "Studying",
			fgColor: Color("dark"),
			bgColor: Color.white,
			width: 150),
		DefaultButton(
			text: "Working",
			fgColor: Color("dark"),
			bgColor: Color.white,
			width: 150)
	]	
	var body: some View {
		NavigationView {
			ZStack {
				BackgroundImageView()

				ScrollView {
					VStack(spacing: 50) {
						HeadingTextView(title: "Make Every Second \nCount", subTitle: "Be Productive,")
						VStack(spacing: 35) {
							VStack(alignment: .leading, spacing: 20) {
								LabelTextView(text: "Use this time for")

								HStack {
									ForEach(0..<buttonTypes.count) { i in
										Button(action: {
											setSelectedType(index: i)
										}) {
											buttonTypes[i]
										}
									}

								}
							}

							VStack(alignment: .leading, spacing: 20) {
								HStack {
									VStack(alignment: .leading) {
										LabelTextView(text: "Time")
										DatePicker("Select Time", selection: $time, displayedComponents: [.hourAndMinute])
											.labelsHidden()
											.onChange(of: time) { value in
												setTime()
											}
									}

								}.frame(width: UIConst.maxFrameWidth)
							}
						}

						Button(action: {
							if (formValidation()) {
								schedules.createData(params: formData)
								schedules.fetchData()
								isPresented.toggle()
							} else {
								isAlert.toggle()
							}
						}) {
							DefaultButton(
								text: "Add Schedule",
								fgColor: Color("light"),
								bgColor: Color("dark"),
								width: 324,
								height: 44)
						}.padding(.top, 150)

					}
				}.alert(isPresented: $isAlert, content: {
					let title = Text("No Data")
					let msg = Text("Please fill all the data")
					return Alert(title: title, message: msg)
				})
			}.navigationBarItems(
				leading: Button("Cancel", action: {
					presentationMode.wrappedValue.dismiss()
				}).foregroundColor(Color("secondary"))
			)
		}
	}

	private func setSelectedType(index: Int) {
		formData["schedule_type"] = buttonTypes[index].text

		buttonTypes[index].bgColor = Color("primary")
		buttonTypes[index].fgColor = Color("light")

		buttonTypes[index == 1 ? index - 1 : index + 1].bgColor = .white
		buttonTypes[index == 1 ? index - 1 : index + 1].fgColor = Color("dark")

		print(formData)

	}

	private func setTime() {
		let selectedtime = time //Here it gets the date
		let formatter2 = DateFormatter()
		formatter2.timeStyle = .medium
			//I have a saved string called newstarttime to use this new variable anywhere in my project.
		let newstarttime = formatter2.string(from: selectedtime)

		formData["time"] = newstarttime.replacingOccurrences(of: ".", with: ":")
//		print(formData)
	}

	private func formValidation() -> Bool {
		if (formData["time"] != "" && formData["schedule_type"] != "") {
			return true
		}
		return false
	}
}

//struct AddScheduleView_Previews: PreviewProvider {
//	@State var isPresented = true
//	static var previews: some View {
//		AddScheduleView(isPresented: )
//	}
//}
