	//
	//  Button.swift
	//  BeLance
	//
	//  Created by Rahmat Afriyanton on 24/07/22.
	//

import SwiftUI


// Switch Button
struct SwitchButtonView: View {
	var text: String
	var isActive: Bool = false
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: UIConst.cornerRadius)
				.fill(isActive ? Color("primary") : .white)
				.frame(width: 185, height: 37)
			Text("\(text)")
				.fontWeight(.medium)
				.font(.callout)
				.foregroundColor(Color("dark"))
		}
	}
}

//struct SwitchButtonView_Previews: PreviewProvider {
//	static var previews: some View {
//		SwitchButtonView(text: "Studying")
//	}
//}


// Calendar Button 
struct CalendarButtonView: View {
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: UIConst.cornerRadius)
				.fill(Color("grey"))
				.frame(width: 200, height: 37)
			HStack {
				Text("Monday, July 18")
					.fontWeight(.regular)
					.font(.callout)
					.foregroundColor(Color("dark"))
				Image(systemName: "calendar").foregroundColor(Color("dark"))
			}
		}
	}
}

//struct CalendarButtonView_Previews: PreviewProvider {
//	static var previews: some View {
//		CalendarButtonView()
//	}
//}


// Card Button
struct CardButtonView: View {
	var text: String
	var color: Color
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: UIConst.cornerRadius)
				.fill(color)
				.frame(width: 122, height: 37)
			Text("\(text)")
				.fontWeight(.regular)
				.font(.callout)
				.foregroundColor(Color("light"))
		}
	}
}

//struct CardButtonView_Previews: PreviewProvider {
//	static var previews: some View {
//		CardButtonView(text: "Check in", color: Color("btnDanger"))
//	}
//}

// Toolbar Button
struct ToolBarButton: View {
	var image: String
	var body: some View {
		Image(systemName: image)
			.resizable()
			.frame(width: 17, height: 17)
			.foregroundColor(Color("dark"))
	}
}

struct ToolBarButton_Previews: PreviewProvider {
	static var previews: some View {
		ToolBarButton(image: "plus")
	}
}

struct DefaultButton: View {
	var text: String
	var fgColor: Color
	var bgColor: Color
	var width: CGFloat
	var height: CGFloat = 37
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: UIConst.cornerRadius)
				.fill(bgColor)
				.frame(width: width, height: height)
			Text("\(text)")
				.fontWeight(.regular)
				.font(.callout)
				.foregroundColor(fgColor)
		}.frame(alignment: .center)
	}
}
