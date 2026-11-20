//
//  DiscoverView.swift
//  CapstoneApp
//
//  Created by Hayden Clark on 2026-11-09.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        List {
            EventSection()
            EventSection("Tomorrow")
        }
//        .safeAreaPadding(.horizontal)
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
                HStack {
                    Label("Mini Golf Club", systemImage: "figure.golf")
                        .font(.subheadline.smallCaps())
                        .lineLimit(1)
                    Image(systemName: "checkmark.circle.badge.questionmark")
                        .imageScale(.small)
                }
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
        }

    }
}

struct EventSection: View {
    @Namespace private var namespace
    var title: String

    init(_ title: String = "Today's Events") {
        self.title = title
    }

    var body: some View {
        Section {
            ForEach(0..<5, id: \.self) { _ in
                NavigationLink {
                    EventDetailView()
                } label: {
                    EventItem()
                        .tint(Color.primary)
                }
            }
        } header: {
            Button {
                print(Date.now)
            } label: {
                HStack {
                    Text(title)
                        .font(.title2)
                        .fontWidth(.expanded)
                        .bold()
                        .lineLimit(1, reservesSpace: true)
                        .truncationMode(.tail)
                    Image(systemName: "chevron.right")
                        .fontWeight(.semibold)
                        .opacity(0.7)
                }
            }
        }
    }

}


#Preview {
    NavigationStack {
        DiscoverView()
    }
}
