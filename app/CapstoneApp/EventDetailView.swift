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
            
            Image("wit-example")
                .resizable()
                .ignoresSafeArea(.all)
                .colorMultiply(color)
            
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
                    GlassEffectContainer {
                        HStack {
                            Button("Add to calendar", systemImage: "calendar.badge.plus") {}
                            Button("Share", systemImage: "square.and.arrow.up") {}
                        }
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

#Preview("Primary expanded bold") {
    NavigationStack {
        EventDetailView(color: Color.primary)
            .fontWidth(.expanded)
            .fontWeight(.bold)
        
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
