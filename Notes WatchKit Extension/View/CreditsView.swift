//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by Максим Громов on 11.10.2021.
//

import SwiftUI

struct CreditsView: View {
	
	//MARK: - Content Body
    var body: some View {
		VStack(spacing: 3) {
			
			Image(systemName: "person.crop.circle")
				.resizable()
				.scaledToFit()
				.layoutPriority(1)

			HeaderView(title: "Credits")
						
			Text("Maksim Gromov")
				.foregroundColor(.primary)
				.fontWeight(.bold)
			
			Text("Developer")
				.font(.footnote)
				.foregroundColor(.secondary)
				.fontWeight(.light)
		}
    }
}

//MARK: - Preview
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
