//
//  AppUtils.swift
//  BeLance
//
//  Created by Rahmat Afriyanton on 24/07/22.
//

import Foundation

struct Btn {
	var text: String
	var isActive: Bool
}


struct SwicthButtons {
	private var buttons = [
		SwitchButtonView(text: "Studying", isActive: true),
		SwitchButtonView(text: "Working", isActive: false)
	]

	private var selected = 0

	mutating func toggle(num: Int) {
		selected = num
		buttons[num].isActive.toggle()
		buttons[num == 1 ? num - 1 : num + 1].isActive.toggle()
	}

	func getButtons() -> [SwitchButtonView] {
		return buttons
	}

	func getSelected() -> Int {
		return selected
	}
}
