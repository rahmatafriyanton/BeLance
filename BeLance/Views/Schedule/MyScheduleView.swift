	//
	//  MyScheduleView.swift
	//  BeLance
	//
	//  Created by Rahmat Afriyanton on 25/07/22.
	//

import SwiftUI

struct MyScheduleView: View {
	@State private var isSelected = true
	@State var isModalAddScheduleShown: Bool = false
	var body: some View {
		NavigationView {
			ZStack {
				BackgroundImageView()

				ScrollView {
					HeadingTextView(
						title: "Let's do it \nconsistently",
						subTitle: "Success doesn’t come overnight, "
					)

					VStack(spacing: 15) {
						TimeScheduleCell(time: "07:00", kind: "Study", isSelected: $isSelected)
						TimeScheduleCell(time: "10:00", kind: "Work", isSelected: $isSelected)
						TimeScheduleCell(time: "15:00", kind: "Study", isSelected: $isSelected)

					}.padding(.top, 35)
				}.padding(.top, 35)
			}
			.navigationBarTitle("My Schedule")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: {self.isModalAddScheduleShown = true})
					{ToolBarButton(image: "plus")}.padding(.horizontal)
				}
			}.sheet(isPresented: $isModalAddScheduleShown) {AddScheduleView()}
		}
	}
}

struct MyScheduleView_Previews: PreviewProvider {
	static var previews: some View {
		MyScheduleView()
	}
}
