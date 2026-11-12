import SwiftUI
import MapKit

struct ContentView: View {
    @State private var filterTapped: Bool = false
    @State private var tappedNewEventButton: Bool = false
    
    @State private var eventTitle: String = ""
    
    enum timeFilter: String, CaseIterable, Identifiable {
        case today, tomorrow, thisWeek, thisMonth
        var id: Self { self }
    }
    
    enum daysOfWeek: String, CaseIterable, Identifiable {
        case Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
        var id: Self { self }
    }
    
    @State private var timeFilters = ["Today", "Tomorrow", "This Week", "This Month"]


    @State private var selectedTimeFilter: timeFilter = .today
    @State private var selectedDayOfWeek: daysOfWeek = .Sunday
    
    var body: some View {
        TabView {
            Tab("Discover", systemImage: "paperplane") {
                NavigationStack {
                    DiscoverView()
                        .toolbar {
                            ToolbarItem(placement: .automatic) {
                                Button("Add event", systemImage: "plus") {
                                    tappedNewEventButton = true
                                }
                            }
                            ToolbarItem(placement: .automatic) {
                                Button("Filter", systemImage: "line.3.horizontal.decrease") {
                                    filterTapped = true
                                }
                            }
                        }
                        .sheet(isPresented: $tappedNewEventButton) {
                            NavigationStack {
                                Form {
                                    Section(header: Text("Event Title")) {
                                        TextField(
                                            "Enter an event title",
                                            text: $eventTitle
                                        )
                                    }
                                    Section(header: Text("Event Description")) {
                                        TextField(
                                            "Enter an event description",
                                            text: $eventTitle
                                        )
                                    }
                                    Section(header: Text("Club"), footer: Text("!!! TODO: This should suggest existing club names or be a Picker.").fontWeight(.bold)) {
                                        TextField(
                                            "Enter a club name",
                                            text: $eventTitle
                                        )
                                    }
                                }
                                .navigationTitle("Create an Event")
                                .toolbarTitleDisplayMode(.inline)
                            }
//                            .interactiveDismissDisabled()
                        }
                    
                        .sheet(isPresented: $filterTapped) {
                            NavigationStack {
                                Form {
                                    Section(header: Text("Time")) {
                                        Picker(selection: $selectedTimeFilter) {
//                                            ForEach(timeFilters.enumerated(), id: \.element) { index, filter in
//                                                Text(filter).tag(index)
//                                            }
                                                Text("Today").tag(timeFilter.today)
                                                Text("Tomorrow").tag(timeFilter.tomorrow)
                                                Text("This Week").tag(timeFilter.thisWeek)
                                                Text("This Month").tag(timeFilter.thisMonth)
                                            } label: {
                                                Text("Timespan")
                                            }
                                            .pickerStyle(.automatic)
                                        Picker(selection: $selectedDayOfWeek) {
                                            ForEach(daysOfWeek.allCases, id: \.self) { item in
                                                Text(item.rawValue)
                                            }
                                        } label: {
                                            Text("Day")
                                        }
                                    }
                                    Section(header: Text("Club")) {
                                        Picker(selection: $selectedTimeFilter) {
                                                Text("WiT").tag(timeFilter.today)
                                                Text("Champ").tag(timeFilter.tomorrow)
                                                Text("SAP").tag(timeFilter.thisWeek)
                                                Text("Water Taste Testing").tag(timeFilter.thisMonth)
                                            } label: {
                                                Text("Club")
                                                Text("Filter by a specific club")
                                            }
                                    }
                                    Section(header: Text("Miscellaneous")) {
                                        Picker(selection: $selectedTimeFilter) {
                                                Text("In-Person").tag(timeFilter.today)
                                                Text("Virtual").tag(timeFilter.tomorrow)
                                            } label: {
                                                Text("Event Type")
                                            }
                                        Picker(selection: $selectedTimeFilter) {
                                                Text("Official").tag(timeFilter.today)
                                                Text("Unofficial").tag(timeFilter.tomorrow)
                                                Text("Unconfirmed").tag(timeFilter.thisWeek)
                                            } label: {
                                                Text("Status")
                                            }
                                            .pickerStyle(.navigationLink)
                                        Picker(selection: $selectedTimeFilter) {
                                                Text("On Campus").tag(timeFilter.today)
                                                Text("Off Campus").tag(timeFilter.tomorrow)
                                            } label: {
                                                Text("Location")
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
