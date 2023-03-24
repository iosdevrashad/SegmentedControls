//
//  ContentView.swift
//  SegmentedControls
//
//  Created by Rashad Surratt on 3/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedShow: SelectFavoriteShow = .one
    
    var body: some View {
            NavigationView {
                VStack (alignment: .center) {
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
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
                        .background(.gray.opacity(0.4))
                        .cornerRadius(20)
                        .frame(height: 100)
                        .padding()
                        Divider()
                    }
                    Spacer()
                    FavoriteTVShowView(selectedShow: selectedShow)
                    Spacer()
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Some of the Greatest")
            }
    }
}

enum SelectFavoriteShow: String, CaseIterable {
    case one = "The Best Together"
    case two = "Bewitched"
    case three = "The Simpsons"
    case four = "I Love Lucy"
    case five = "The Jeffersons"
    case six = "I Dream of Jeannie"
    case seven = "Charmed"
    case eight = "The Golden Girls"
    case nine = "All in the Family"
    case ten = "Cheers"
}

struct FavoriteTVShowView: View {
    
    var selectedShow: SelectFavoriteShow
    
    var body: some View {
        switch selectedShow {
        case .one:
            FavoriteSitcomImageView(favoriteSitcomName: "history")
        case .two:
            FavoriteSitcomImageView(favoriteSitcomName: "bewitched")
        case .three:
            FavoriteSitcomImageView(favoriteSitcomName: "simpsons")
        case .four:
            FavoriteSitcomImageView(favoriteSitcomName: "lucy")
        case .five:
            FavoriteSitcomImageView(favoriteSitcomName: "jeffersons")
        case .six:
            FavoriteSitcomImageView(favoriteSitcomName: "jeannie")
        case .seven:
            FavoriteSitcomImageView(favoriteSitcomName: "charmed")
        case .eight:
            FavoriteSitcomImageView(favoriteSitcomName: "golden")
        case .nine:
            FavoriteSitcomImageView(favoriteSitcomName: "family")
        case .ten:
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
