	//
	//  MyScheduleView.swift
	//  BeLance
	//
	//  Created by Rahmat Afriyanton on 25/07/22.
	//

import SwiftUI

struct MyScheduleView: View {
	@EnvironmentObject var schedules: ScheduleModel
	@State var isModalAddScheduleShown: Bool = false

	var body: some View {

		NavigationView {
			ZStack {
				BackgroundImageView()

				VStack {
					HeadingTextView(
						title: "Let's do it \nconsistently",
						subTitle: "Success doesn’t come overnight, "
					)

					List {
						ForEach(Array(schedules.data.enumerated()), id: \.element) { i, item in
							TimeScheduleCell(schedule: $schedules.data[i], isSelected: item.bool_is_active)
								.swipeActions {
									Button(action: {print("Clicked")}, label: {
										Image(systemName: "trash")
									}).tint(.red)

									Button(action: {print("Clicked")}, label: {
										Image(systemName: "square.and.pencil")
									}).tint(.green)
								}
						}

					}.listStyle(.inset)


				}.padding(.top, 35)

			}
			.navigationBarTitle("My Schedule")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: {self.isModalAddScheduleShown = true})
					{ToolBarButton(image: "plus")}.padding(.horizontal)
				}
			}.sheet(isPresented: $isModalAddScheduleShown) {AddScheduleView(isPresented: $isModalAddScheduleShown)}
		}
	}

}

struct MyScheduleView_Previews: PreviewProvider {
	static var previews: some View {
		MyScheduleView()
	}
}
