	//
	//  MyJourneyView.swift
	//  BeLance
	//
	//  Created by Rahmat Afriyanton on 24/07/22.
	//

import SwiftUI
import Foundation


struct MyJourneyView: View {
	@EnvironmentObject var journeys: JourneyModel
	@State var isModalAddShown = false
	@State var selectedID: Int = 0
	@State var selectedNamaJourney: String = ""

	var body: some View {
		NavigationView {
			ZStack {
				BackgroundImageView()

				VStack {
					List {
						ForEach(journeys.data, id: \.self) { item in
							NavigationLink(
								destination:
									DetailJourneyView().environmentObject(DetailJourneyModel(journey: item))
							) {
								JourneyCellView(title: item.nama_journey).padding(.vertical)
							}
							.swipeActions {
								Button(action: {
									deleteJourney(journey: item)
								}, label: {
									Image(systemName: "trash")
								}).tint(.red)

								Button(action: {
									selectedNamaJourney = item.nama_journey
									selectedID = item.journey_id
									isModalAddShown.toggle()
								}, label: {
									Image(systemName: "square.and.pencil")
								}).tint(.green)
							}
						}
					}.listStyle(.inset)
						.listRowSeparator(.hidden, edges: .all)
				}

			}
			.navigationBarTitle("My Journey")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: {
						selectedID = 0
						selectedNamaJourney = ""
						self.isModalAddShown.toggle()
					})
					{
					ToolBarButton(image: "plus")}
					.padding(.horizontal)}
			}.sheet(isPresented: $isModalAddShown) {
				FormAddJourneyView(
					isPresented: $isModalAddShown,
					nama_journey: selectedNamaJourney,
					journey_id: selectedID
				)}
		}
	}

	func deleteJourney(journey: Journey) {
		print("Deleted \(journey.nama_journey)")
		journeys.deleteData(journey: journey)
		journeys.fetchData()
	}
}

struct MyJourneyView_Previews: PreviewProvider {
	@EnvironmentObject var journeys: JourneyModel
	static var previews: some View {
		MyJourneyView().environmentObject(JourneyModel())
	}
}

