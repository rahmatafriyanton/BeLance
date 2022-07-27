//
//  GeneralComponents.swift
//  BeLance
//
//  Created by Rahmat Afriyanton on 21/07/22.
//

import SwiftUI


struct BackgroundImageView: View {
	var body: some View {
		Image("background")
			.resizable()
			.edgesIgnoringSafeArea(.all)
	}
}

struct UserInfo: View {
	var body: some View {
		HStack() {
			Ellipse()
				.fill(Color(red: 0.85, green: 0.85, blue: 0.85))
				.frame(width: 40, height: 40)

			VStack(alignment: .leading, spacing: 2) {
				Text("Welcome Back")
					.fontWeight(.medium)
					.font(.caption)
					.foregroundColor(Color("secondary"))
				Text("Rahmat Afriyanton")
					.fontWeight(.bold)
					.font(.title3)
					.foregroundColor(Color("dark"))
			}
		}.frame(width: 370, alignment: .topLeading)
	}
}

//struct UserInfo_Previews: PreviewProvider {
//	static var previews: some View {
//		UserInfo()
//	}
//}

//Card Alert
struct CardAlertView: View {
	var type: String
	var text: String
	var duration: Int
	@Binding public var isCheckin: Bool
	var body: some View {
		VStack(alignment: .leading, spacing: 15) {
			HStack() {
				Text("\(type == "success" ? "Good Job!" : "Reminder")")
					.fontWeight(.semibold)
					.font(.title3)
					.foregroundColor(Color("dark"))
					.frame(alignment: .topLeading)
				Spacer()

				Text("\(duration) mins")
					.font(.subheadline)
					.foregroundColor(Color("secondary"))
			}

			Text(text)
				.lineLimit(nil)
				.foregroundColor(Color("secondary"))
				.font(.body)
				.frame(alignment: .topLeading)

			Button(action: {
				isCheckin.toggle()
			}) {
				CardButtonView(
					text: "\(type == "success" ? "Check out" : "Check in")",
					color: Color("\(type == "success" ? "btnSuccess" : "btnDanger")"))
			}
		}
		.padding(.horizontal, 22)
		.padding(.vertical, 22)
		.background(Color("\(type == "success" ? "cardSuccess" : "cardDanger")"))
		.cornerRadius(15)
		.frame(width: UIConst.maxFrameWidth, height: 190)

	}
}



// List View Cell
struct ListCellView: View {
	var title: String
	var subTitle: String = ""
	var withProgressBar = false
	var body: some View {
		HStack(alignment: .center, spacing: 0) {
			
			RoundedRectangle(cornerRadius: UIConst.cornerRadius)
				.fill(Color("dark").opacity(0.75))
				.frame(width: 20)

			VStack(alignment: .leading, spacing: 4) {

				Text(title)
					.font(.callout)
					.fontWeight(.semibold)
					.foregroundColor(Color("dark"))
					.frame(maxWidth: .infinity, alignment: .topLeading)
					.lineLimit(nil)

				if (subTitle != "") {
					Text("on \(subTitle)")
						.font(.caption)
						.foregroundColor(Color("secondary"))
				}

				if (withProgressBar) {
					ZStack(alignment: .leading) {
						RoundedRectangle (cornerRadius: 15)
							.fill(Color("secondary"))
							.frame(width: 310, height: 5)

						RoundedRectangle (cornerRadius: 15)
							.fill(Color("secondary"))
							.frame(width: 100, height: 5)
					}.padding(.top, 5)
				}
			}
			.padding()
			.frame(width: 340)
			.background(Color.white)
			.offset(x: -10)
			RoundedRectangle(cornerRadius: UIConst.cornerRadius).fill(.white)
				.frame(width: 30)
				.offset(x:-20)
		}.offset(x:10)
	}
}

struct ListCellView_Previews: PreviewProvider {
	static var previews: some View {
		ListCellView(title: "What is UIKit", withProgressBar: true)
	}
}


struct TimeScheduleCell: View {
	var time: String
	var kind: String
	@Binding var isSelected: Bool
	var body: some View {
		Divider().frame(width: UIConst.maxFrameWidth)
		Toggle(isOn: $isSelected) {
			VStack(alignment: .leading, spacing: 0) {
				Text(time)
					.fontWeight(.medium)
					.font(.largeTitle)
					.foregroundColor(Color("dark"))

				Text(kind)
					.fontWeight(.medium)
					.font(.callout)
					.foregroundColor(Color("dark").opacity(0.75))
			}
		}.frame(width: UIConst.maxFrameWidth)
			.padding(.horizontal)
	}
}


struct CustomTabBar: View {
	var tabBarImageName: [String]
	@Binding var selectedTab: Int
	var body: some View {
		HStack {
			ZStack {
				Color("dark").opacity(0.25)
					.cornerRadius(15)
					.offset(y:-1)
				Color.white
					.cornerRadius(15)

				HStack {
					ForEach (0..<tabBarImageName.count) { num in
						Spacer()
						Button(action: {
							selectedTab = num
						}, label: {
							Image(systemName: tabBarImageName[num])
								.foregroundColor(selectedTab == num ? Color("dark") : Color("dark").opacity(0.50))
								.frame(width: 20, height: 20)
						})
						Spacer()
					}
				}
			}
		}.frame(height: 65)
	}
}
