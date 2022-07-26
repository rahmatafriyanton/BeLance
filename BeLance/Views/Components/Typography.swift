//
//  Typography.swift
//  BeLance
//
//  Created by Rahmat Afriyanton on 24/07/22.
//

import SwiftUI

// Label Text
struct LabelTextView: View {
	var text: String
	var body: some View {
		Text(text)
			.fontWeight(.regular)
			.lineLimit(nil)
			.font(.callout)
			.foregroundColor(Color("secondary"))
			.frame(maxWidth: UIConst.maxFrameWidth, alignment: .topLeading)

	}
}

//struct LabelTextView_Previews: PreviewProvider {
//	static var previews: some View {
//		LabelTextView(text: "Learn Something Great")
//	}
//}


// Heading Text
struct HeadingTextView: View {
	var title: String
	var subTitle: String = ""

	var body: some View {

		VStack(spacing: 0) {
			if subTitle != "" {
				LabelTextView(text: subTitle)
			}

			Text(title)
				.fontWeight(.bold)
				.font(.title2)
				.foregroundColor(Color("dark"))
				.frame(width: UIConst.maxFrameWidth, alignment: .topLeading)
		}
	}
}

//struct HeadingTextView_Previews: PreviewProvider {
//	static var previews: some View {
//		HeadingTextView(title: "Let’s Make Some Improvement today", subTitle: "Success doesn't come overnight")
//	}
//}
