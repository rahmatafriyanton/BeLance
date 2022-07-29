	//
	//  DetailJourney.swift
	//  BeLance
	//
	//  Created by Rahmat Afriyanton on 24/07/22.
	//

import SwiftUI

struct DetailJourneyView: View {
	@EnvironmentObject var detailJourneys: DetailJourneyModel
	@State var isModalAddScheduleShown: Bool = false
	var body: some View {
		ZStack {
			BackgroundImageView()
			
			VStack {
				List {
					ForEach(detailJourneys.data, id: \.detail_journey_id) { item in
						DetailJourneyCellView(item: item)
					}
				}.listStyle(.inset)
					.listRowSeparator(.hidden, edges: .all)
			}
			.navigationTitle(detailJourneys.journey.nama_journey)
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

	//struct DetailJourney_Previews: PreviewProvider {
	////	@EnvironmentObject var detailJourneys: DetailJourneyModel
	//    static var previews: some View {
	//			DetailJourneyView()
	//    }
	//}
