//
//  AppConst.swift
//  BeLance
//
//  Created by Rahmat Afriyanton on 27/07/22.
//

import Foundation
struct AppConst {
	static let url 	= "http://localhost:3000/"
}

struct Response: Codable {
	var status: Int
	var msg: String
}
