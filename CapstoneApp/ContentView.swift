import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Discover", systemImage: "paperplane") {
                NavigationStack {
                    VStack(alignment: .leading) {
                        Button {
                            //
                        } label: {
                            HStack {
                                Text("Today's Events")
                                    .frame(width: .infinity, alignment: .leading)
                                    .font(.headline)
                                    .bold()
                                Image(systemName: "chevron.right")
                            }
                        }

                        ScrollView(.horizontal) {
                            LazyHGrid(rows: [
                                //                                GridItem(.fixed(150)),
                                GridItem(.flexible(minimum: 50, maximum: 150)),
                                GridItem(.flexible(minimum: 50, maximum: 150))
                            ], alignment: .top) {
                                ForEach(0..<3, id: \.self) { item in
                                    HStack(alignment: .center, spacing: 10) {
                                        Image("wit-example")
                                            .resizable()
                                            .scaledToFill()
//                                            .aspectRatio(3/4, contentMode: .fit)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .frame(width: 75, height: 75)
                                        VStack(alignment: .leading) {
                                            Text("Mini Golf Club")
                                                .font(.footnote.smallCaps())
                                                .lineLimit(1)
                                            Text("Event title")
                                                .font(.headline)
                                            Text(Date.now.addingTimeInterval(60 * 60 * 24 * 5), format: Date.FormatStyle(date: .abbreviated, time: .shortened))
                                                .font(.subheadline)
                                        }
                                        .frame(maxWidth: .infinity)
                                        Image(systemName: "chevron.right")
                                            .padding(.horizontal, 8)
                                    }
                                    .frame(width: 300)
//                                    .padding()
                                    .frame(maxHeight: .infinity)
//                                    .border(Color.gray)
//                                            HStack {
//                                                Image("wit-example")
//                                                    .resizable()
//                                                    .aspectRatio(CGFloat(1), contentMode: .fill)
//                                                    .clipped()
//                                                Spacer()
//                                                VStack(alignment: .leading){
//                                                    Text("Radio Takeover")
//                                                        .font(.footnote.smallCaps())
//                                                        .lineLimit(1)
//                                                    Text("Event title")
//                                                        .font(.subheadline)
//                                                }
//                                                Spacer()
//                                                Image(systemName: "chevron.right")
//                                                    .padding(.vertical, 8)
//                                            }
//                                            .padding()
                                }
                            }
                            .scrollTargetLayout()

                        }
                        .scrollTargetBehavior(.viewAligned)
                    }
                    .padding()
                }
            }
            Tab("Map", systemImage: "map.fill") {
                Map()
            }
            Tab ("Me", systemImage: "person.fill") {
                Map()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
