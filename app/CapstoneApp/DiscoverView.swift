//
//  DiscoverView.swift
//  CapstoneApp
//
//  Created by Hayden Clark on 2026-11-09.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        ScrollView(.vertical) {
            EventSection("Today")
            EventSection("Tomorrow")
            EventSection("October 29")
            EventSection("October 30")
        }
        .navigationTitle("Discover")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EventItem: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("wit-example")
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Label("Mini Golf Club", systemImage: "figure.golf")
                    .font(.subheadline.smallCaps())
                    .lineLimit(1)
                Text("November Networking Coffee for Women & Gender-diverse Folks at Hula (CAREERtalk)")
                    .lineLimit(3, reservesSpace: true)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                Text(
                    Date.now.addingTimeInterval(60 * 60 * 24 * 5),
                    format: Date.FormatStyle(date: .abbreviated,
                                             time: .shortened)
                    .year(.omitted).weekday(.abbreviated)
                )
                .font(.footnote.smallCaps())
            }
            .frame(maxWidth: .infinity)
            Image(systemName: "chevron.right")
                .padding(.horizontal, 8)
        }
        .frame(width: 300)
        .frame(maxHeight: .infinity)
    }
}

struct EventSection: View {
    @Namespace private var namespace
    var title: String = "Today's Events"
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
            } label: {
                HStack {
                    Text(title)
                        .font(.title2)
                        .fontWidth(.expanded)
                        .bold()
                    Image(systemName: "chevron.right")
                        .fontWeight(.semibold)
                        .opacity(0.7)
                }
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [
                    GridItem(.flexible(minimum: 25, maximum: 150)),
                    GridItem(.flexible(minimum: 25, maximum: 150))
                ], alignment: .top, spacing: 20) {
                    ForEach(0..<5, id: \.self) { item in
                        NavigationLink {
                            EventDetailView()
                                .navigationTransition(
                                    .zoom(sourceID: "\(item)", in: namespace)
                                )
                        } label: {
                            EventItem()
                                .tint(Color.primary)
                                .matchedTransitionSource(id: "\(item)", in: namespace)
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.leading)
        }
        Divider()
            .padding(.bottom)
    }
    
}


#Preview {
    NavigationStack {
        DiscoverView()
    }
}
