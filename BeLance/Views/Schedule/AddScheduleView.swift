//
//  AddScheduleView.swift
//  BeLance
//
//  Created by Rahmat Afriyanton on 25/07/22.
//

import SwiftUI

struct AddScheduleView: View {
	@State private var currentDate = Date()
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
									Button(action: {print("button tapped")}) {
										DefaultButton(
											text: "Studying",
											fgColor: Color("light"),
											bgColor: Color("primary"),
											width: 150)
									}

									Button(action: {print("button tapped")}) {
										DefaultButton(
											text: "Studying",
											fgColor: Color("dark"),
											bgColor: Color.white,
											width: 150)
									}


								}
							}

							VStack(alignment: .leading, spacing: 20) {
								HStack {
									VStack(alignment: .leading) {
										LabelTextView(text: "From")
										
										DatePicker("", selection: $currentDate, displayedComponents: [.hourAndMinute])
											.labelsHidden()
									}

									VStack(alignment: .leading) {
										LabelTextView(text: "To")

										DatePicker("", selection: $currentDate, displayedComponents: [.hourAndMinute])
											.labelsHidden()
									}

								}.frame(width: UIConst.maxFrameWidth)
							}
						}

						Button(action: {print("button tapped")}) {
							DefaultButton(
								text: "Add Schedule",
								fgColor: Color("light"),
								bgColor: Color("dark"),
								width: 324,
								height: 44)
						}.padding(.top, 150)
					}
				}
			}.navigationBarItems(
				trailing: Button("Cancel", action: {}).foregroundColor(.red).padding(.horizontal)
			)
		}
	}
}

struct AddScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        AddScheduleView()
    }
}
