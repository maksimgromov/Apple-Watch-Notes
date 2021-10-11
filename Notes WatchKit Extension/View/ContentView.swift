//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Максим Громов on 11.10.2021.
//

import SwiftUI

struct ContentView: View {
	
	//MARK: - Properies
	@AppStorage("lineCount") var lineCount: Int = 1
	@State private var notes: [Note] = [Note]()
	@State private var text: String = ""
	
	//MARK: - Functions
	private func getDocumentDirectory() -> URL {
		let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return path[0]
	}
	
	private func saveNote() {
		do {
			let data = try JSONEncoder().encode(notes)
			let url = getDocumentDirectory().appendingPathComponent("notes")
			try data.write(to: url)
		} catch {
			print("Saving data has failed")
		}
	}
	
	private func loadNotes() {
		DispatchQueue.main.async {
			do {
				let url = getDocumentDirectory().appendingPathComponent("notes")
				let data = try Data(contentsOf: url)
				notes = try JSONDecoder().decode([Note].self, from: data)
			} catch {
				
			}
		}
	}
	
	private func deleteNote(offsets: IndexSet) {
		notes.remove(atOffsets: offsets)
		saveNote()
	}
	
	//MARK: - Content Body
	var body: some View {
		VStack {
			HStack(alignment: .center, spacing: 6) {
				TextField("Add New Note", text: $text)
				Button {
					guard text.isEmpty == false else { return }
					let note = Note(id: UUID(), text: text)
					notes.append(note)
					text = ""
					saveNote()
				} label: {
					Image(systemName: "plus.circle")
						.font(.system(size: 42, weight: .semibold))
				}
				.fixedSize()
				.buttonStyle(PlainButtonStyle())
				.foregroundColor(.accentColor)
			}
			Spacer()
			if notes.count >= 1 {
				List {
					ForEach(0..<notes.count, id: \.self) { i in
						NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
							HStack {
								Capsule()
									.frame(width: 4)
									.foregroundColor(.accentColor)
								Text(notes[i].text)
									.lineLimit(lineCount)
									.padding(.leading, 5)
							}
						}
					}
					.onDelete(perform: deleteNote(offsets:))
				}
			} else {
				Spacer()
				Image(systemName: "note.text")
					.resizable()
					.scaledToFit()
					.foregroundColor(.gray)
					.opacity(0.25)
					.padding(25)
				Spacer()
			}
		}
		.navigationTitle("Notes")
		.onAppear(perform: {
			loadNotes()
		})
	}
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
