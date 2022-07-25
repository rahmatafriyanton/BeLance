//
//  GeneralComponents.swift
//  BeLance
//
//  Created by Rahmat Afriyanton on 21/07/22.
//

import SwiftUI

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
					.foregroundColor(Color("TextColorSecondary"))
				Text("Rahmat Afriyanton")
					.fontWeight(.bold)
					.font(.title3)
					.foregroundColor(Color("TextColorDark"))
			}
		}.frame(width: 360, alignment: .topLeading)
    }
}


struct CustomButtonText: View {
	var text: String
	var x_padding: CGFloat = 50
	var body: some View {
		Text(text)
			.fontWeight(.medium)
			.font(.subheadline)
			.padding(.vertical, 10)
			.padding(.horizontal, x_padding)
	}
}


struct HeadingText: View {
	var title: String
	var subTitle: String = ""

	var body: some View {

		VStack(spacing: 0) {
			if subTitle != "" {
				Text(subTitle)
					.lineLimit(nil)
					.font(.subheadline)
					.foregroundColor(Color("TextColorSecondary"))
					.frame(maxWidth: .infinity, minHeight: 300, alignment: .topLeading)
			}

			Text(title)
				.fontWeight(.bold)
				.font(.title)
				.foregroundColor(Color("TextColorDark"))
				.frame(width: 360, alignment: .topLeading)
		}
	}
}

struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
		UserInfo()
    }
}
