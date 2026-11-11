import SwiftUI
import MapKit

struct ContentView: View {
    @State private var filterTapped: Bool = false
    
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate, vanilla, strawberry
        var id: Self { self }
    }


    @State private var selectedFlavor: Flavor = .chocolate
    
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
                                Button("Filter", systemImage: "line.3.horizontal.decrease") {
                                    filterTapped = true
                                    
                                }
                            }
                        }
                        .sheet(isPresented: $filterTapped) {
                            NavigationStack {
                                Form {
                                    Section(header: Text("Time")) {
                                        Picker(selection: $selectedFlavor) {
                                                Text("Chocolate").tag(Flavor.chocolate)
                                                Text("Vanilla").tag(Flavor.vanilla)
                                                Text("Strawberry").tag(Flavor.strawberry)
                                            } label: {
                                                Text("Timespan")
                                                Text("Subheading")
                                            }
                                        Picker(selection: $selectedFlavor) {
                                                Text("Chocolate").tag(Flavor.chocolate)
                                                Text("Vanilla").tag(Flavor.vanilla)
                                                Text("Strawberry").tag(Flavor.strawberry)
                                            } label: {
                                                Text("Option 2")
                                                Text("Subheading")
                                            }
                                    }
                                }
                                .navigationTitle("Filters")
                                .toolbarTitleDisplayMode(.inline)
                            }
                            .presentationDetents([.medium, .large])

                        }
                }
            }
            Tab("Map", systemImage: "map.fill") {
                NavigationStack {
                    MapView()
                }
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
