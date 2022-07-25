	//
	//  Dashboard.swift
	//  BeLance
	//
	//  Created by Rahmat Afriyanton on 21/07/22.
	//

import SwiftUI

struct Dashboard: View {
	var body: some View {
		ZStack {
			Image("background")
				.resizable()
				.edgesIgnoringSafeArea(.all)

			VStack(spacing: 0.0) {
				UserInfo()
				Spacer()

				VStack(alignment: .center) {
					Text("Monday, July 18")
						.foregroundColor(Color("TextColorDark"))
						.fontWeight(.semibold)

					HStack {
						Button(action: {
							print("sign up bin tapped")
						}) {
							CustomButtonText(text: "Studying")
						}
						.foregroundColor(Color("TextColorLight"))
						.background(Color("TextColorDark"))	.cornerRadius(10)
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(.black, lineWidth: 1)
						)

						Spacer()

						Button(action: {
							print("sign up bin tapped")
						}) {
							CustomButtonText(text: "Studying")
						}
						.foregroundColor(Color("TextColorDark"))
						.background(Color("ButtonColorLight"))	.cornerRadius(10)
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(.black, lineWidth: 1)
						)
					}
				}.padding()

				Spacer()

				HeadingText(title: "Let’s Make Some Improvement today")
					.padding()

				AlertCard()

				Spacer()
				VStack(spacing: 15) {
					Text("What I Learned Today")
						.fontWeight(.regular)
						.font(.subheadline)
						.foregroundColor(Color("TextColorSecondary"))
						.frame(maxWidth: .infinity, alignment: .topLeading)

					

					List {
						VStack(alignment: .leading, spacing: 5) {
							Text("What is UIKit")
								.fontWeight(.semibold)
								.font(.callout)


							Text("on Be iOS Developer")
								.font(.caption)
						}.padding(.vertical)


					}.background()
				}.padding()

				Spacer()
			}
		}
	}
}

struct Dashboard_Previews: PreviewProvider {
	static var previews: some View {
		Dashboard()
	}
}


struct AlertCard: View {
	var body: some View {
		VStack(spacing: 15) {
			Text("Let’s Learn Something Great")
				.fontWeight(.regular)
				.font(.subheadline)
				.foregroundColor(Color("TextColorSecondary"))
				.frame(maxWidth: .infinity, alignment: .topLeading)

			VStack() {
				VStack() {
					Text("45 mins")
						.fontWeight(.semibold)
						.font(.caption2)
						.foregroundColor(Color("TextColorSecondary"))
						.padding(.horizontal)
						.frame(maxWidth: .infinity, alignment: .trailing)
				}

				VStack(alignment: .leading, spacing: 10) {
					Text("Reminder")
						.fontWeight(.bold)
						.font(.title3)
						.foregroundColor(Color("TextColorDark"))
						.frame(width: 112, alignment: .topLeading)
						.padding(.horizontal, 20)

					Text("You haven't checking in to learn something great today")
						.lineLimit(nil)
						.foregroundColor(Color("TextColorSecondary"))
						.font(.subheadline)
						.padding(.horizontal, 20)
						.frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)

					Button(action: {
						print("sign up bin tapped")
					}) {
						CustomButtonText(text: "Check in", x_padding: 20)
					}
					.foregroundColor(Color("TextColorLight"))
					.background(Color(red: 0.89, green: 0.33, blue: 0.43, opacity: 0.74))	.cornerRadius(10)
					.overlay(
						RoundedRectangle(cornerRadius: 10)
							.stroke(Color("BorderColor"), lineWidth: 1)
					)
					.padding(.horizontal, 20)
				}

			}
			.frame(width: 360, height: 175)
			.background(Color("RedCardColor"))
			.cornerRadius(10)
			.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("BorderColor"), lineWidth: 1))
		}
		.padding()

	}
}


struct WhatILearnedCell: View {
	var body: some View {
		VStack(alignment: .leading, spacing: 4) {
			Text("What is UIKit")
				.fontWeight(.semibold)
				.font(.callout)
				.frame(width: 322.20, alignment: .topLeading)

			Text("on Be iOS Developer")
				.font(.caption)
				.frame(width: 123.19, alignment: .topLeading)
		}
		.padding(.horizontal, 20)
		.padding(.vertical, 15)
		.background(Color.white)
		.cornerRadius(10)
		.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("BorderColorGreen"), lineWidth: 1))
	}
}
