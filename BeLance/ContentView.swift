//
//  ContentView.swift
//  BeLance
//
//  Created by Rahmat Afriyanton on 21/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		TabView {
			Dashboard()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
