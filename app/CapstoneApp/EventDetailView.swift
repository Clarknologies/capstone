//
//  EventDetailView.swift
//  CapstoneApp
//
//  Created by Hayden Clark on 2026-11-09.
//

import SwiftUI

struct EventDetailView: View {
    var body: some View {
        ScrollView(.vertical) {
            Image("wit-example")
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .frame(maxWidth: .infinity)
            Group {
                Text("Event Title")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                Text("Event time • Date")
                    .font(.headline)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            GlassEffectContainer {
                HStack {
                    Button {
                        //
                    } label: {
                        VStack {
                            Image(systemName: "ticket.fill")
                            Text("RSVP")
                        }
                    }
                    Button {
                        //
                    } label: {
                        VStack {
                            Image(systemName: "info.circle.fill")
                            Text("More Info")
                        }
                    }
                }
                .buttonSizing(.flexible)
                .buttonBorderShape(.roundedRectangle)
                .buttonStyle(.glassProminent)
                
            }
        }
        .safeAreaPadding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Save to my events", systemImage: "bookmark") {}
            }
        }
    }
}

#Preview {
    NavigationStack {
        EventDetailView()
    }
}
