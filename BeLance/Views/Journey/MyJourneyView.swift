	//
	//  MyJourneyView.swift
	//  BeLance
	//
	//  Created by Rahmat Afriyanton on 24/07/22.
	//

import SwiftUI

struct MyJourneyView: View {
	var body: some View {
		ZStack {
			BackgroundImageView()

			ScrollView {
				VStack(spacing: 15) {
					NavigationLink(destination: DetailJourney()) {
						ListCellView(
							title: "Be an iOS Developer",
							withProgressBar: true
						)
					}

					NavigationLink(destination: DetailJourney()) {
						ListCellView(
							title: "Be an iOS Developer",
							withProgressBar: true
						)
					}

				}


			}.padding(.top, 35)
		}
	}
}

struct MyJourneyView_Previews: PreviewProvider {
	static var previews: some View {
		MyJourneyView()
	}
}