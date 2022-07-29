	//
	//  ContentView.swift
	//  BeLance
	//
	//  Created by Rahmat Afriyanton on 21/07/22.
	//

import SwiftUI

struct ContentView: View {
	@State var selectedTab = 0
	let tabBarImageName = ["rectangle.and.pencil.and.ellipsis", "calendar.badge.clock", "clock", "person"]

	var body: some View {
		ZStack {

			VStack {
				ZStack {
					switch selectedTab {
						case 0 : DashboardView()
						case 1 : MyJourneyView().environmentObject(JourneyModel())
						case 2 : MyScheduleView().environmentObject(ScheduleModel())
						default: Text("Page Not Found")
					}
				}

				Spacer()

				CustomTabBar(tabBarImageName: tabBarImageName, selectedTab: $selectedTab)
			}
		}.preferredColorScheme(.light)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
