//
//  ContentView.swift
//  foursquare
//
//  Created by Francesca De Nicola  on 15/11/23.
//
import SwiftUI

class TabSelection: ObservableObject {
    @Published var selectedTab = 0
}

struct ContentView: View {
    @StateObject private var tabSelection = TabSelection()
    @State private var isSearchButtonTapped = false
    
    var body: some View {
        TabView(selection: $tabSelection.selectedTab)  {
            NavigationView {
                VStack {
                    Image("IMG_0321")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                        .offset(y: -110)
                        .padding()

                    VStack {
                        NavigationLink(destination: AnotherView(), isActive: $isSearchButtonTapped) {
                            EmptyView()
                        }
                        Button(action: {
                            isSearchButtonTapped = true
                        }) {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                                Text("What are you looking for?")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                            .border(Color.gray)
                            .accessibility(label: Text("Search"))
                            .accessibility(hint: Text("Double-tap to start searching"))
                        }
                        .offset(y: -180)

                        HStack(spacing: 20) {
                            Spacer()

                            Button(action: {
                                // Azioni per il pulsante Breakfast
                            }) {
                                VStack {
                                    Image(systemName: "sun.max.fill")
                                        .font(.system(size: 30))
                                    Text("Breakfast")
                                }
                            }
                            .foregroundColor(.gray)
                            .offset(x: -20, y: -150)
                            .accessibility(label: Text("Breakfast"))
                            .accessibility(hint: Text("Double-tap to view Breakfast options"))

                            Spacer()

                            Button(action: {
                                // Azioni per il pulsante Lunch
                            }) {
                                VStack {
                                    Image(systemName: "fork.knife")
                                        .font(.system(size: 30))
                                    Text("Lunch")
                                }
                            }
                            .foregroundColor(.gray)
                            .offset(x: -10, y: -150)
                            .accessibility(label: Text("Lunch"))
                            .accessibility(hint: Text("Double-tap to view Lunch options"))

                            Spacer()

                            Button(action: {
                                // Azioni per il pulsante Dinner
                            }) {
                                VStack {
                                    Image(systemName: "moon.fill")
                                        .font(.system(size: 30))
                                    Text("Dinner")
                                }
                            }
                            .foregroundColor(.gray)
                            .offset(x: 15, y: -150)
                            .accessibility(label: Text("Dinner"))
                            .accessibility(hint: Text("Double-tap to view Dinner options"))

                            Spacer()
                        }
                        .padding()
                    }

                    HStack(spacing: 20) {
                        Spacer()

                        Button(action: {
                            // Azioni per il pulsante Coffea & Tea
                        }) {
                            VStack {
                                Image(systemName: "mug.fill")
                                    .font(.system(size: 30))
                                Text("Coffea & Tea")
                            }
                        }
                        .foregroundColor(.gray)
                        .offset(x: -10, y: -90)
                        .accessibility(label: Text("Coffee and Tea"))
                        .accessibility(hint: Text("Double-tap to view Coffee and Tea options"))
                        .fixedSize(horizontal: false, vertical: true)

                        Spacer()

                        Button(action: {
                            // Azioni per il pulsante Nightlife
                        }) {
                            VStack {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 30))
                                Text("Nightlife")
                            }
                        }
                        .foregroundColor(.gray)
                        .offset(x: 2, y: -90)
                        .accessibility(label: Text("Nightlife"))
                        .accessibility(hint: Text("Double-tap to view Nightlife options"))

                        Spacer()

                        Button(action: {
                            // Azioni per il pulsante Things to do
                        }) {
                            VStack {
                                Image(systemName: "bag.fill")
                                    .font(.system(size: 30))
                                Text("Things to do")
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        .foregroundColor(.gray)
                        .offset(x: 15, y: -90)
                        .accessibility(label: Text("Things to do"))
                        .accessibility(hint: Text("Double-tap to view Things to do options"))

                        Spacer()
                    }
                    .padding()

                    Spacer()
                    TabView(selection: $tabSelection.selectedTab) {
                        ForEach(0..<4) { index in
                            // Sostituisci il blocco Text con il contenuto effettivo della scheda
                            VStack {
                                // Aggiungi qui il contenuto specifico che desideri mostrare in ciascuna scheda
                            }
                            .tabItem {
                                // Sostituisci i nomi delle schede con quelli desiderati e aggiungi un'icona accanto a ciascun nome
                                if index == 0 {
                                    Image(systemName: "magnifyingglass")
                                    Text("Search")
                                } else if index == 1 {
                                    Image(systemName: "list.bullet")
                                    Text("Lists")
                                } else if index == 2 {
                                    Image(systemName: "book.pages")
                                    Text("History")
                                } else {
                                    Image(systemName: "person.crop.circle")
                                    Text("Me")
                                }
                            }
                            .tag(index)
                            .accessibility(label: Text("Tab \(index + 1)"))
                            .accessibility(hint: Text("Double-tap to switch to the \(index + 1) tab"))
                        }
                    }
                    .accentColor(.blue)
                    .offset(y: 120)
                }
            }
        }
    }
}

struct AnotherView: View {
    @State private var selectedTab = 0
    @State private var isMapButtonTapped = false

    var body: some View {

        ZStack {

            TabView(selection: $selectedTab) {
                ForEach(0..<4) { index in

                    VStack {

                    }
                    .tabItem {

                        if index == 0 {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        } else if index == 1 {
                            Image(systemName: "list.bullet")
                            Text("Lists")
                        } else if index == 2 {
                            Image(systemName: "book.pages")
                            Text("History")
                        } else {
                            Image(systemName: "person.crop.circle")
                            Text("Me")
                        }
                    }
                    .tag(index)
                    .accessibility(label: Text("Tab \(index + 1)"))
                    .accessibility(hint: Text("Double-tap to switch to the \(index + 1) tab"))
                }
            }
            .accentColor(.blue)
            .offset(y: 120)

            VStack {
                VStack {
                    HStack {
                        Button(action: {
                            // Azioni per il primo bottone bianco
                        }) {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .fontWeight(.bold)
                                Text("What are you looking for")

                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            .foregroundColor(.gray)
                            .frame(height: 60)
                            .offset(x: 25, y: -60)
                        }
                        .padding()

                        Button(action: {
                            // Azioni per il bottone con il simbolo della mappa
                        }) {
                            Button(action: {

                            }) {
                                Image(systemName: "map.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .offset(x: 5, y: -60)
                        }
                    }
                    .padding()

                    HStack {
                        Spacer()
                        Button(action: {
                            // Azioni per il secondo bottone bianco
                        }) {
                            HStack {
                                Image(systemName: "location")
                                    .foregroundColor(.gray)
                                    .fontWeight(.bold)
                                Text("Near me")
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            .foregroundColor(.gray)
                            .frame(height: 60)
                            .offset(x: -68, y: -90)
                        }
                        Spacer()
                    }
                }
                .background(Color.blue)

                Spacer()
            }

            HStack {
                Spacer()

                // Primo bottone
                Button(action: {
                    // Azioni per il primo bottone
                }) {
                    HStack {
                        Image(systemName: "list.bullet.indent")
                            .font(.system(size: 8))
                        Text("Filters")
                            .font(.system(size: 8))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 0).fill(Color.blue).saturation(0.6))
                    .foregroundColor(.white)
                }
                .offset(x: -15, y: -170)
                .accessibility(label: Text("Filters"))
                .accessibility(hint: Text("Double-tap to open Filters"))

                // Secondo bottone
                Button(action: {
                    // Azioni per il secondo bottone
                }) {
                    HStack {
                        Image(systemName: "dollarsign.square")
                            .font(.system(size: 8))
                        Text("Price")
                            .font(.system(size: 8))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 0).fill(Color.blue).saturation(0.6))
                    .foregroundColor(.white)
                }
                .offset(x: -5, y: -170)
                .accessibility(label: Text("Price"))
                .accessibility(hint: Text("Double-tap to open Price options"))

                // Terzo bottone
                Button(action: {
                    // Azioni per il terzo bottone
                }) {
                    HStack {
                        Image(systemName: "clock")
                            .font(.system(size: 8))
                        Text("Open Now")
                            .font(.system(size: 8))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 0).fill(Color.blue).saturation(0.6))
                    .foregroundColor(.white)
                }
                .offset(x: 5, y: -170)
                .accessibility(label: Text("Open Now"))
                .accessibility(hint: Text("Double-tap to open Open Now options"))

                // Quarto bottone
                Button(action: {
                    // Azioni per il quarto bottone
                }) {
                    HStack {
                        Image(systemName: "square.and.arrow.down")
                            .font(.system(size: 8))
                        Text("Saved")
                            .font(.system(size: 8))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 0).fill(Color.blue).saturation(0.6))
                    .foregroundColor(.white)
                }
                .offset(x: 15, y: -170)
                .accessibility(label: Text("Saved"))
                .accessibility(hint: Text("Double-tap to view Saved items"))

                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
