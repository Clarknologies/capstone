//
//  EventDetailView.swift
//  CapstoneApp
//
//  Created by Hayden Clark on 2026-11-09.
//

import SwiftUI
import MapKit

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
                
                VStack(alignment: .leading) {
                    Text("November Networking Coffee for Women & Gender-diverse Folks at Hula (CAREERtalk)")
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.bold)
                    
                    Text("Time and Date")
                        .font(.headline)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                    Label {
                        Text(Date.now, format: Date.FormatStyle()
                            .weekday()
                            .month()
                            .day()
                            .year())
                        .font(.headline)
                    } icon: {
                        Image(systemName: "calendar")
                    }
                    Label {
                        Text(Date.now, format: Date.FormatStyle()
                            .hour()
                            .minute())
                        .font(.headline)
                    } icon: {
                        Image(systemName: "clock")
                    }
                    .padding(.bottom)
                    
                    Divider()
                    
                    Label("Hosted by Mini Golf Club", systemImage: "figure.golf")
                        .font(.headline.smallCaps())
                        .lineLimit(1)
                    Text("This was on behalf of the club by **John Example**. Please verify this event is actually happening.")
                        .font(.subheadline)
                        .italic()
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
                
                HStack {
                    Button {} label: {
                        VStack(spacing: 5) {
                            Image(systemName: "ticket.fill")
                            Text("RSVP")
                        }
                        .frame(maxHeight: .infinity)
                    }
                    
                    Button {} label: {
                        VStack(spacing: 5) {
                            Image(systemName: "info.circle.fill")
                            Text("Info")
                        }
                        .frame(maxHeight: .infinity)
                    }
                    
                    Button {} label: {
                        VStack(spacing: 5) {
                            Image(systemName: "square.slash")
                            Text("Instagram")
                        }
                        .frame(maxHeight: .infinity)
                    }
                }
                .buttonSizing(.flexible)
                .buttonBorderShape(.roundedRectangle)
                .buttonStyle(.glassProminent)
                .padding(.bottom)
                
                
                Text("Location")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("Fireside Lounge")
                        Text("123 Main Street, Burlington, VT")
                    }
                    Spacer()
                    Image(systemName: "map")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
//                
//                Map()
//                    .frame(alignment: .leading)
//                    .frame(height: 250)
//                    .disabled(true)
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom)
                
                Text("Description")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum accumsan dolor nec accumsan. Integer viverra est in nisl tempus tincidunt. Nullam bibendum, turpis ut suscipit congue, mi ipsum molestie lorem, eu auctor eros velit ultricies urna. Donec nulla velit, semper a orci eget, iaculis ultricies dolor. Phasellus ultrices sapien sed pellentesque facilisis. Donec pharetra libero eget risus facilisis, sed porttitor nulla fringilla. In consequat eros mi, condimentum aliquet tellus condimentum maximus. Vivamus imperdiet tellus leo, eu venenatis velit maximus ac. Mauris lacinia in dui sit amet scelerisque. Morbi finibus urna odio, id bibendum ipsum venenatis at. ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
            }
            .background(Material.thinMaterial)
        }
        .safeAreaPadding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button("Save to my events", systemImage: "bookmark") {}
            }
            ToolbarItem(placement: .automatic) {
                Menu("More", systemImage: "ellipsis") {
                    Button("Share", systemImage: "square.and.arrow.up") {}
                    Button("Add to calendar", systemImage: "calendar.badge.plus") {}
                    Button("Show QR code?", systemImage: "qrcode") {} // if we can do this
                    Button("Share event poster?", systemImage: "doc.text.image") {} // if we can do this
                    Divider()
                    Button("Report event", systemImage: "flag", role: .destructive) {}
                }
            }
        }
    }
}

#Preview("Green") {
    NavigationStack {
        EventDetailView(color: Color.green)
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

#Preview("White") {
    NavigationStack {
        EventDetailView(color: Color.white)
    }
    .tint(.accent)
}
#Preview("Clear condensed") {
    NavigationStack {
        EventDetailView(color: Color.clear)
            .fontWidth(.condensed)
    }
    .tint(.accent)
}
