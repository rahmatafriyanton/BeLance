//
//  DetailJourneyModel.swift
//  BeLance
//
//  Created by Rahmat Afriyanton on 28/07/22.
//

import Foundation

struct DetailJourney: Codable {
	var detail_journey_id: Int
	var journey_id: Int
	var nama_detail_journey: String
	var current_status: String
	var user_id: Int
	var nama_journey: String
}

class DetailJourneyModel: ObservableObject {
	@Published var data = [DetailJourney]()
	var journey: Journey

	init(journey: Journey) {
		self.journey = journey
		fetchData(journey: journey)
	}
		//Mark: -Retrieve Data
	func fetchData(journey: Journey) {
		guard let url = URL(string: AppConst.url + "journey/\(journey.journey_id)?with_detail=true") else {
			print("Your API end point is Invalid")
			return
		}
		let request = URLRequest(url: url)

		URLSession.shared.dataTask(with: request) { data, response, error in

			if error != nil {
				print("Error", error?.localizedDescription)
			}

			do {
				if let data = data {
					let result = try JSONDecoder().decode([DetailJourney].self, from: data)
					DispatchQueue.main.async {
//						print(result)
						self.data = result
					}
				} else {
					print("No Data")
				}
			} catch let JsonError {
				print("Fetch Json Error: ", JsonError.localizedDescription)
			}
		}.resume()

	}

	func loadData(journey: Journey) {
		guard let url = URL(string: AppConst.url + "journey/\(journey.journey_id)?with_detail=true") else {
			print("Your API end point is Invalid")
			return
		}
		let request = URLRequest(url: url)

		print(url)

		URLSession.shared.dataTask(with: request) { data, response, error in
			if let data = data {
				if let response = try? JSONDecoder().decode([DetailJourney].self, from: data) {
					DispatchQueue.main.async {
						self.data = response
						print(response)
					}
					return
				} else {
					print(error ?? "Error")
				}
			}
		}.resume()
	}
}
