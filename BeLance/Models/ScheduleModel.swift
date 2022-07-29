//
//  ScheduleModel.swift
//  BeLance
//
//  Created by Rahmat Afriyanton on 28/07/22.
//

import Foundation

struct Schedule: Codable, Hashable {
	var schedule_id: Int
	var user_id: Int
	var schedule_type: String
	var time: String
	var is_active: String

	var bool_is_active : Bool {
		get { return is_active == "true" }
		set { is_active = newValue ? "true" : "false" }
	}
}

class ScheduleModel: ObservableObject {
	@Published var data = [Schedule]()

	init() {
		fetchData()
	}

	//Mark: -Retrieve Data
	func fetchData() {
		guard let url = URL(string: AppConst.url + "schedule") else {
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
					let result = try JSONDecoder().decode([Schedule].self, from: data)
					DispatchQueue.main.async {
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
		guard let url = URL(string: AppConst.url + "schedule") else {
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
		guard let url = URL(string: AppConst.url + "schedule/\(id)") else {
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
	func deleteData(params: [String: Any]) {
		guard let url = URL(string: AppConst.url + "schedule/\(params["schedule_id"])") else {
			print("Your API end point is Invalid")
			return
		}

		let data = try! JSONSerialization.data(withJSONObject: params)

		var request = URLRequest(url: url)
		request.httpMethod = "DELETE"
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

	

		//	func loadData() {
		//		guard let url = URL(string: AppConst.url + "schedule") else {
		//			print("Your API end point is Invalid")
		//			return
		//		}
		//		let request = URLRequest(url: url)
		//
		//
		//		URLSession.shared.dataTask(with: request) { data, response, error in
		//			if let data = data {
		//				if let response = try? JSONDecoder().decode([Schedule].self, from: data) {
		//					DispatchQueue.main.async {
		//						self.data = response
		//						print(response)
		//					}
		//					return
		//				} else {
		//					print(error ?? "Error")
		//				}
		//			}
		//		}.resume()
		//	}

		//	static func updateSchedule(schedule: Schedule) {
		//		guard let url = URL(string: AppConst.url + "schedule/\(schedule.schedule_id)") else {
		//			print("Your API end point is Invalid")
		//			return
		//		}
		//		var request = URLRequest(url: url)
		//		request.httpMethod = "PUT"
		//		request.allHTTPHeaderFields = [
		//			"Content-Type" : "application/json"
		//		]
		//		request.httpBody = try! JSONSerialization.data(withJSONObject: [
		//			"is_active": schedule.is_active
		//		])
		//
		//		URLSession.shared.dataTask(with: request) { data, response, error in
		//			if let data = data {
		//				if let response = try? JSONDecoder().decode(Response.self, from: data) {
		//					DispatchQueue.main.async {
		//						print(response)
		//					}
		//					return
		//				}
		//			}
		//		}.resume()
		//	}

		//	func createSchedule(schedule: [String:String]) {
		//		guard let url = URL(string: AppConst.url + "schedule/") else {
		//			print("Your API end point is Invalid")
		//			return
		//		}
		//		var request = URLRequest(url: url)
		//		request.httpMethod = "POST"
		//		request.allHTTPHeaderFields = [
		//			"Content-Type" : "application/json"
		//		]
		//		request.httpBody = try! JSONSerialization.data(withJSONObject: schedule)
		//
		//		URLSession.shared.dataTask(with: request) { data, response, error in
		//			if let data = data {
		//				if let response = try? JSONDecoder().decode(Response.self, from: data) {
		//					DispatchQueue.main.async {
		//						print(response)
		//					}
		//					return
		//				}
		//			}
		//		}.resume()
		//	}
}
