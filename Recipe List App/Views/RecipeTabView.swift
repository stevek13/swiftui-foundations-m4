//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Steve Kite on 4/4/22.
//

import SwiftUI

struct RecipeTabView: View {

 //   @EnvironmentObject var model:RecipeModel

    var body: some View {
        TabView {
            RecipeFeatureView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
