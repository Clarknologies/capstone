import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Discover", systemImage: "paperplane") {
                NavigationStack {
                    ListView()
                }
            }
            Tab("Map", systemImage: "map.fill") {
                Map()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
