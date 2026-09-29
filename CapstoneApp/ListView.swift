//
//  ListView.swift
//  CapstoneApp
//
//  Created by Hayden Clark on 2026-09-26.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            Section("Upcoming Events") {
                EventListView(eventName: "Duck watching event")
                EventListView(eventName: "Apple Picking", isOfficial: false)
            }
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button("Search", systemImage: "magnifyingglass") {
                    
                }
            }
        }
        .navigationTitle("Discover Events")
        .navigationBarTitleDisplayMode(.inline)
//        .searchable(text: Binding.constant("search value"))
    }
}

struct EventListView: View {
    let eventName: String
    let isOfficial: Bool
    
    init(eventName: String, isOfficial: Bool = true) {
        self.eventName = eventName
        self.isOfficial = isOfficial
    }
    var body: some View {
        HStack(alignment: .top) {
            Image("pixa-9758155")
                .resizable()
                .aspectRatio(1.0, contentMode: .fill)
                .frame(width: 90)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            VStack(alignment: .leading) {
                HStack {
//                    Image(systemName: "house.fill")
                    if isOfficial {
                        Text("SAP")
                        Image(systemName: "checkmark.seal")
                    } else {
                        Text("name, on behalf of SAP")
                        Image(systemName: "xmark.seal")
                    }
//                    Text("•")
//                    Image(systemName: "globe.desk.fill")
//                    Text("CCSC")
                }
                .font(.subheadline)
                Text("\(eventName)")
                    .fontWeight(.bold)
                Text("\(Date.now.formatted(date: .numeric, time: .shortened))")
                Spacer()
                HStack {
                    Text("Outdoors")
                    Text("•")
                    Text("Food")
                }
                .font(.subheadline.smallCaps())
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
