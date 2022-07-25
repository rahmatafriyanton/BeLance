	//
	//  ContentView.swift
	//  BeLance
	//
	//  Created by Rahmat Afriyanton on 21/07/22.
	//

import SwiftUI

struct ContentView: View {

	@State var selectedIndex = 0
	let tabBarImageName = ["rectangle.and.pencil.and.ellipsis", "calendar.badge.clock", "clock", "person"]
	var body: some View {
		ZStack {
			BackgroundImageView()

			VStack {
				ZStack {
					switch selectedIndex {
						case 0 :
							NavigationView {
								DashboardView()
									.navigationBarTitle("")
									.navigationBarHidden(true)
							}
						case 1 :
							NavigationView {
								MyJourneyView()
									.navigationBarTitle("My Journey")
									.navigationBarTitleDisplayMode(.inline)
							}
						default:
							Text("Page Not Found")
					}
				}


				Spacer()

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
									selectedIndex = num
								}, label: {
									Image(systemName: tabBarImageName[num])
										.foregroundColor(selectedIndex == num ? Color("dark") : Color("dark").opacity(0.50))
										.frame(width: 20, height: 20)
								})
								Spacer()
							}
						}.padding(.bottom, 20)
					}
				}.frame(height: 100)
			}
		}
		.ignoresSafeArea(.all, edges: .bottom)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
