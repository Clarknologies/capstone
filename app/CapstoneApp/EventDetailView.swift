//
//  EventDetailView.swift
//  CapstoneApp
//
//  Created by Hayden Clark on 2026-11-09.
//

import SwiftUI

struct EventDetailView: View {
    private var color: Color
    
    init(color: Color = Color.red) {
        self.color = color
    }
    
    var body: some View {
        ZStack {
            color
                .ignoresSafeArea(.all)
            
            
            Image("wit-example")
                .resizable()
                .ignoresSafeArea(.all)
                .blendMode(.multiply)
            
            ScrollView(.vertical) {
                Image("wit-example")
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(maxWidth: .infinity)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Event Title")
                            .font(.title)
                            .multilineTextAlignment(.leading)
                        Text("Event time • Date")
                            .font(.headline)
                    }
                    Spacer()
                    Menu("More", systemImage: "ellipsis") {
                        Button("Add to calendar", systemImage: "calendar.badge.plus") {}
                        Divider()
                        Button("Show QR code?", systemImage: "qrcode") {} // if we can do this
                        Button("Share event poster", systemImage: "doc.text.image") {} // if we can do this

                        Button("Report event", systemImage: "flag", role: .destructive) {}
                    }
                    .buttonStyle(.glassProminent)
                    .labelStyle(.iconOnly)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                GlassEffectContainer {
                    HStack {
                        Button {
                            //
                        } label: {
                            VStack(spacing: 5) {
                                Image(systemName: "ticket.fill")
                                Text("RSVP")
                            }
                            .frame(maxHeight: .infinity)
                        }
                        
                        Button {
                            //
                        } label: {
                            VStack(spacing: 5) {
                                Image(systemName: "info.circle.fill")
                                Text("Info")
                            }
                            .frame(maxHeight: .infinity)
                        }
                        .frame(maxHeight: .infinity)
                    }
                    .buttonSizing(.flexible)
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.glassProminent)
                }
            }
            .background(Material.ultraThinMaterial)
        }
        .safeAreaPadding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Save to my events", systemImage: "bookmark") {}
            }
            ToolbarItem(placement: .automatic) {
                Button("Save to my events", systemImage: "square.and.arrow.up") {}
            }
        }
    }
}

#Preview("Green + Mono") {
    NavigationStack {
        EventDetailView(color: Color.green)
            .fontDesign(.monospaced)
    }
    .tint(.accent)
}

#Preview("Red + Serif") {
    NavigationStack {
        EventDetailView(color: Color.red)
            .fontDesign(.serif)
    }
    .tint(Color.black)
}

#Preview("Primary expanded") {
    NavigationStack {
        EventDetailView(color: Color.primary)
            .fontWidth(.expanded)
    }
    .tint(.accent)
}
#Preview("Clear condensed ") {
    NavigationStack {
        EventDetailView(color: Color.clear)
            .fontWidth(.condensed)
    }
    .tint(.accent)
}
