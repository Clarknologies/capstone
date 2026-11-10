import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Discover", systemImage: "paperplane") {
                NavigationStack {
                    DiscoverView()
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
}

#Preview {
    ContentView()
}
