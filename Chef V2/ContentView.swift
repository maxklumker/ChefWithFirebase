//
//  ContentView.swift
//  Chef V2
//
//  Created by Lewis Wall on 10.09.20.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct ContentView: View {
        
    var body: some View {
            
        TabView {
        RecipeView().tabItem
            {
        Image(systemName: "rectangle.stack.fill")
        Text("Home")
                }
            ExploreView().tabItem
            {
                Image(systemName: "suit.heart.fill")
                Text("Explore")
            }
            
//                SearchView().tabItem
//                {
//                    Image(systemName: "magnifyingglass")
//                    Text("Search")
//                }
            
              }
           }
        }
     
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
