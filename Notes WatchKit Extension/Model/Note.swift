//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Максим Громов on 11.10.2021.
//

import Foundation

struct Note: Identifiable, Codable {
	let id: UUID
	let text: String
}
