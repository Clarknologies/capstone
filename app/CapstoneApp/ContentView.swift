import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Discover", systemImage: "paperplane") {
                NavigationStack {
                    DiscoverView()
                        .toolbar {
                            ToolbarItem(placement: .automatic) {
                                Button("Add event", systemImage: "plus") {}
                            }
                            ToolbarItem(placement: .automatic) {
                                Button("Filter", systemImage: "line.3.horizontal.decrease") {}
                            }
                        }
                }
            }
            Tab("Map", systemImage: "map.fill") {
//                Map()
            }
            Tab ("Me", systemImage: "person.fill") {
                NavigationStack {
                    MeView()
                }
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
