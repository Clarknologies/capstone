//
//  MeView.swift
//  CapstoneApp
//
//  Created by Hayden Clark on 2026-11-10.
//

import SwiftUI

struct MeView: View {
    var body: some View {
        ScrollView(.vertical) {
            Image("studiofriluma-swan-10131341_640")
                .resizable()
                .clipShape(.circle)
                .frame(width: 120, height: 120)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("Student's Name")
                .font(.title2)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("student.name@mymail.champlain.edu")
                .font(.headline)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("2 Attended")
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)

            Divider()
            EventSection("Organized")
            EventSection("Attending")
            EventSection("Previous Events")
            
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button("More", systemImage: "ellipsis") {}
            }
        }
        .safeAreaPadding(.leading)
        .navigationTitle("Me")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MeView()
    }
}
