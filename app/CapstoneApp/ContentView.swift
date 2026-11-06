import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Discover", systemImage: "paperplane") {
                NavigationStack {
                    ScrollView(.vertical) {
                        VStack(alignment: .leading) {
                            Button {
                                //
                            } label: {
                                HStack {
                                    Text("Today's Events")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title2)
                                        .fontWidth(.expanded)
                                        .bold()
                                    // TODO: on iPad this arrow is right-aligned
                                    Image(systemName: "chevron.right")
                                }
                            }
                            ScrollView(.horizontal) {
                                LazyHGrid(rows: [
                                    GridItem(.flexible(minimum: 25, maximum: 150)),
                                    GridItem(.flexible(minimum: 25, maximum: 150))
                                ], alignment: .top) {
                                    ForEach(0..<7, id: \.self) { item in
                                        eventItem
                                    }
                                }
                                .scrollTargetLayout()
                            }
                            .scrollTargetBehavior(.viewAligned)
                        }
                        VStack(alignment: .leading) {
                            Button {
                                //
                            } label: {
                                HStack {
                                    Text("Tomorrow's Events")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title2)
                                        .fontWidth(.expanded)
                                        .bold()
                                    // TODO: on iPad this arrow is right-aligned
                                    Image(systemName: "chevron.right")
                                }
                            }
                            ScrollView(.horizontal) {
                                LazyHGrid(rows: [
                                    GridItem(.flexible(minimum: 25, maximum: 150)),
                                    GridItem(.flexible(minimum: 25, maximum: 150))
                                ], alignment: .top) {
                                    ForEach(0..<3, id: \.self) { item in
                                        eventItem
                                    }
                                }
                                .scrollTargetLayout()
                            }
                            .scrollTargetBehavior(.viewAligned)
                        }
                    }
                    .padding()
                }
            }
            Tab("Map", systemImage: "map.fill") {
//                Map()
            }
            Tab ("Me", systemImage: "person.fill") {
            //
            }
            
        }
        
    }

    var eventItem: some View {
        HStack(alignment: .center) {
            Image("wit-example")
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Label("Mini Golf Club", systemImage: "football.fill")
                    .font(.subheadline.smallCaps())
                    .lineLimit(1)
                Text("November Networking Coffee for Women & Gender-diverse Folks at Hula (CAREERtalk)")
                    .lineLimit(3, reservesSpace: true)
                    .font(.headline)
                Text(
                    Date.now.addingTimeInterval(60 * 60 * 24 * 5),
                    format: Date.FormatStyle(date: .abbreviated,
                                             time: .shortened)
                    .year(.omitted).weekday(.abbreviated)
                )
                .font(.footnote)
            }
            .frame(maxWidth: .infinity)
            Image(systemName: "chevron.right")
                .padding(.horizontal, 8)
        }
        .frame(width: 300)
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
