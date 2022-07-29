	//
	//  JourneyModel.swift
	//  BeLance
	//
	//  Created by Rahmat Afriyanton on 27/07/22.
	//

import Foundation

struct Journey: Codable, Hashable {
	var journey_id: Int
	var user_id: Int
	var nama_journey: String
}

class JourneyModel: ObservableObject {
	@Published var data = [Journey]()

	init() {
		fetchData()
	}

	//Mark: -Retrieve Data
	func fetchData() {
		guard let url = URL(string: AppConst.url + "journey") else {
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
					let result = try JSONDecoder().decode([Journey].self, from: data)
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

		//Mark: -Create Data
	func createData(params: [String: Any]) {
		guard let url = URL(string: AppConst.url + "journey") else {
			print("Your API end point is Invalid")
			return
		}

		let data = try! JSONSerialization.data(withJSONObject: params)

		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.httpBody = data
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")

		URLSession.shared.dataTask(with: request) { data, response, error in
			if error != nil {
				print("Error", error?.localizedDescription)
			}

			do {
				if let data = data {
					let result = try JSONDecoder().decode(Response.self, from: data)
					DispatchQueue.main.async {
						print(result)
					}
				} else {
					print("No Data")
				}
			} catch let JsonError {
				print("Fetch Json Error: ", JsonError.localizedDescription)
			}

		}.resume()

	}

		//Mark: -Update Data
	func updateData(params: [String: Any], id: Int) {
		guard let url = URL(string: AppConst.url + "journey/\(id)") else {
			print("Your API end point is Invalid")
			return
		}

		let data = try! JSONSerialization.data(withJSONObject: params)

		var request = URLRequest(url: url)
		request.httpMethod = "PUT"
		request.httpBody = data
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")

		URLSession.shared.dataTask(with: request) { data, response, error in
			if error != nil {
				print("Error", error?.localizedDescription)
			}

			do {
				if let data = data {
					let result = try JSONDecoder().decode(Response.self, from: data)
					DispatchQueue.main.async {
						print(result)
					}
				} else {
					print("No Data")
				}
			} catch let JsonError {
				print("Fetch Json Error: ", JsonError.localizedDescription)
			}

		}.resume()

	}

		//Mark: -Delete Data
	func deleteData(journey: Journey) {
		guard let url = URL(string: AppConst.url + "journey/\(journey.journey_id)") else {
			print("Your API end point is Invalid")
			return
		}

		var request = URLRequest(url: url)
		request.httpMethod = "DELETE"
		
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")

		URLSession.shared.dataTask(with: request) { data, response, error in
			if error != nil {
				print("Error", error?.localizedDescription)
			}

			do {
				if let data = data {
					let result = try JSONDecoder().decode(Response.self, from: data)
					DispatchQueue.main.async {
						print(result)
					}
				} else {
					print("No Data")
				}
			} catch let JsonError {
				print("Fetch Json Error: ", JsonError.localizedDescription)
			}

		}.resume()
	
//	func loadData() {
//		guard let url = URL(string: AppConst.url + "journey") else {
//			print("Your API end point is Invalid")
//			return
//		}
//		let request = URLRequest(url: url)
//
//		URLSession.shared.dataTask(with: request) { data, response, error in
//			if let data = data {
//				if let response = try? JSONDecoder().decode([Journey].self, from: data) {
//					DispatchQueue.main.async {
//						self.data = response
//					}
//					return
//				}
//			}
//		}.resume()
	}
}
