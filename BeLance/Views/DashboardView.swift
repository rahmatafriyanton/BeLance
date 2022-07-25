	//
	//  Dashboard.swift
	//  BeLance
	//
	//  Created by Rahmat Afriyanton on 21/07/22.
	//

import SwiftUI

struct DashboardView: View {
	@State private var buttons = SwicthButtons()
	@State public var isCheckin = true

	var body: some View {
		ZStack {
			BackgroundImageView()

			ScrollView {
				VStack(spacing: 35) {
					VStack(spacing: 35) {
							// Calendar Button
						Button(action: {print("button tapped")}) {
							CalendarButtonView()
						}

							// Switch Button
						ZStack {
							RoundedRectangle(cornerRadius: UIConst.cornerRadius)
								.fill(.white)
								.frame(width: UIConst.maxFrameWidth, height: 37)

							HStack(alignment: .center, spacing: 0) {
								ForEach (0..<2) { num in
									Button(action: {
										buttons.toggle(num: num)
									}) {
										buttons.getButtons()[num]
									}
								}
							}
						}
					}

						// Big Title
					HeadingTextView(title: getHeadingTextMessage())

						// Alert View
					VStack(spacing:15) {
						LabelTextView(text: getAlertTitle())

						CardAlertView(
							type: isCheckin ? "success" : "danger",
							text: getAlertMessage(),
							duration: 60,
							isCheckin: $isCheckin
						)
					}

						// What I Learned
					VStack(spacing:15) {
						LabelTextView(text: getCellMessage())

						ListCellView(
							title: "How to use TableView in UIKit",
							subTitle: "Be iOS Developer")

						ListCellView(
							title: "How to use TabBar in SwiftUI",
							subTitle: "Be iOS Developer")
					}

				}
			}
		}
	}


	func getAlertMessage() -> String {
		var msg = ""
		if (buttons.getSelected() == 0) {
			msg = "You \(isCheckin ? "have" : "haven't") checking in to learn something great today"
		} else {
			msg = "You \(isCheckin ? "have" : "haven't") checking in to finish something right today"
		}

		return msg
	}

	func getHeadingTextMessage()  -> String  {
		var msg = ""
		if (buttons.getSelected() == 0) {
			msg = "Let’s Make Some Improvement today"
		} else {
			msg = "Let’s Make Some Money or Something"
		}

		return msg
	}

	func getAlertTitle()  -> String  {
		var msg = ""
		if (buttons.getSelected() == 0) {
			msg = "Learn Something Great"
		} else {
			msg = "Do Something Right"
		}

		return msg
	}

	func getCellMessage()  -> String  {
		var msg = ""
		if (buttons.getSelected() == 0) {
			msg = "What I Learned"
		} else {
			msg = "What I Does"
		}

		return msg
	}

}

struct DashboardView_Previews: PreviewProvider {
	static var previews: some View {
		DashboardView()
	}
}

