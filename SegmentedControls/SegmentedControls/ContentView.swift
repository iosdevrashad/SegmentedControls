//
//  ContentView.swift
//  SegmentedControls
//
//  Created by Rashad Surratt on 3/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedShow: SelectFavoriteShow = .dark
    
    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                VStack (alignment: .center) {
                    ScrollView(.horizontal) {
                        HStack {
                            Picker("Some of the Best", selection: $selectedShow) {
                                ForEach(SelectFavoriteShow.allCases, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .shadow(color: .white, radius: 100)
                            .shadow(color: Color.brown.opacity(0.8), radius: 5, x: 0, y: 2)
                            .padding()
                        }
                    }
           
                    Spacer()
                    FavoriteTVShowView(selectedShow: selectedShow)
                    Spacer()
                }
                .navigationTitle("Some of my Favorites")
            }
        }
    }
}

enum SelectFavoriteShow: String, CaseIterable {
    case light = "The Best Together"
    case grey = "Bewitched"
    case dark = "The Simpsons"
    case blue = "I Love Lucy"
    case yellow = "The Jeffersons"
    case green = "I Dream of Jeannie"
    case purple = "Charmed"
    case brown = "The Golden Girls"
    case red = "All in the Family"
    case orange = "Cheers"
}

struct FavoriteTVShowView: View {
    
    var selectedShow: SelectFavoriteShow
    
    var body: some View {
        switch selectedShow {
        case .light:
            FavoriteSitcomImageView(favoriteSitcomName: "history")
        case .grey:
            FavoriteSitcomImageView(favoriteSitcomName: "bewitched")
        case .dark:
            FavoriteSitcomImageView(favoriteSitcomName: "simpsons")
        case .blue:
            FavoriteSitcomImageView(favoriteSitcomName: "lucy")
        case .yellow:
            FavoriteSitcomImageView(favoriteSitcomName: "jeffersons")
        case .green:
            FavoriteSitcomImageView(favoriteSitcomName: "jeannie")
        case .purple:
            FavoriteSitcomImageView(favoriteSitcomName: "charmed")
        case .brown:
            FavoriteSitcomImageView(favoriteSitcomName: "golden")
        case .red:
            FavoriteSitcomImageView(favoriteSitcomName: "family")
        case .orange:
            FavoriteSitcomImageView(favoriteSitcomName: "cheers")
        }
    }
}

struct FavoriteSitcomImageView: View {
    var favoriteSitcomName: String
    
    var body: some View {
        Image(favoriteSitcomName)
            .resizable()
            .cornerRadius(8)
            .frame(width: 400, height: 300)
            .shadow(color: .white, radius: 100)
            .shadow(color: Color.brown.opacity(0.8), radius: 5, x: 0, y: 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
