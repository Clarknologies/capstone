//
//  MapView.swift
//  CapstoneApp
//
//  Created by Logan Clark on 11/10/26.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
   static let testEvent = CLLocationCoordinate2D(latitude: 44.4765101, longitude:-73.2131585)
    static let testEvent2 = CLLocationCoordinate2D(latitude: 44.4735101, longitude:-73.2231585)
}

struct MapView: View {

    @State private var selectedTag: Int?
    @State private var selectedResult: MKMapItem?
    @State private var showSheet: Bool = false
    
    var body: some View {
        Map(selection: $selectedResult) {
            Annotation("Test", coordinate: .testEvent, anchor: .bottom) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.background)
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.secondary, lineWidth: 5)
                    Image("wit-example")
                        .resizable()
                        .padding(5)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(width: 75, height: 75)
                }
                .onTapGesture {
                    showSheet = true
                }
            }
            Annotation("Test", coordinate: .testEvent2, anchor: .bottom) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.background)
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.secondary, lineWidth: 5)
                    Image("wit-example")
                        .resizable()
                        .padding(5)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(width: 75, height: 75)
                }
                .onTapGesture {
                    showSheet = true
                }
            }
        }
        
        .sheet(isPresented: $showSheet){
            NavigationStack {
                EventDetailView()
            }
            .presentationDetents([.large])
        }
        .mapStyle(.standard(elevation: .realistic))
    }
}

#Preview {
    MapView()
}
