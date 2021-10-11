//
//  Settings.swift
//  Notes WatchKit Extension
//
//  Created by Максим Громов on 11.10.2021.
//

import SwiftUI

struct Settings: View {
	
	//MARK: - Properies
	@AppStorage("lineCount") var lineCount: Int = 1
	@State private var value: Float = 1.0
	
	//MARK: - Function
	private func update() {
		lineCount = Int(value)
	}

	//MARK: - Content Body
    var body: some View {
		VStack(spacing: 8) {
			
			HeaderView(title: "Settings")
			
			Text("Lines: \(lineCount)".uppercased())
				.fontWeight(.bold)
			
			Slider(value: Binding(get: { self.value } , set: { (newValue) in
				self.value = newValue
				self.update()
			}), in: 1...4, step: 1)
				.accentColor(.accentColor)
		}
    }
}

//MARK: - Preview
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
