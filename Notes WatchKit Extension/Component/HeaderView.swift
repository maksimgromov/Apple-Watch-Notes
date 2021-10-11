//
//  HeaderView.swift
//  Notes WatchKit Extension
//
//  Created by Максим Громов on 11.10.2021.
//

import SwiftUI

struct HeaderView: View {
	
	//MARK: - Properies
	var title: String = ""
	
	//MARK: - Content Body
    var body: some View {
		VStack {
			if title != "" {
				Text(title.uppercased())
					.font(.title3)
					.fontWeight(.bold)
					.foregroundColor(.accentColor)
			}
			
			HStack {
				Capsule()
					.frame(height: 1)
				Image(systemName: "note.text")
				Capsule()
					.frame(height: 1)
			}
			.foregroundColor(.accentColor)
		}
    }
}

//MARK: - Preview
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			HeaderView(title: "Credits")
			HeaderView()
		}
    }
}
