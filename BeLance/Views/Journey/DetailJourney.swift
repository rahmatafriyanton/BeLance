//
//  DetailJourney.swift
//  BeLance
//
//  Created by Rahmat Afriyanton on 24/07/22.
//

import SwiftUI

struct DetailJourney: View {
    var body: some View {
			ZStack {
				BackgroundImageView()

				ScrollView {
					VStack(spacing: 15) {
						ListCellView(
							title: "Be an iOS Developer"
						)

					}
				}.padding(.top, 35)
					.navigationTitle("Be an iOS Developer")
			}
    }
}

struct DetailJourney_Previews: PreviewProvider {
    static var previews: some View {
        DetailJourney()
    }
}
