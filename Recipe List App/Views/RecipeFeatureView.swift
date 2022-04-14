//
//  RecipeFeatureView.swift
//  Recipe List App
//
//  Created by Steve Kite on 4/6/22.
//

import SwiftUI

struct RecipeFeatureView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    var body: some View {
        VStack(alignment:.leading) {
            
            Text("Featured Recipe")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            GeometryReader { geo in
                TabView {
                    // Loop through each recipe
                    ForEach (0..<model.recipes.count, id: \.self) { index in
                        // Only show those that are featured
                        if model.recipes[index].featured == true {
                            
                            // Recipe Card Button
                            Button (action:
                            {
                                // show the recipe detail sheet
                                self.isDetailViewShowing = true
                            }, label: {
                                // Recipe Card
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing:0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                } // End of ZStack
                            }) // End of Button Label
                            .sheet(isPresented: $isDetailViewShowing) {
                                // Show the recipe detail view
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
//                            .tag(index)
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preperation Time:")
                    .font(.headline)
                Text("1 Hour")
                Text("Hilights")
                Text("Healty, Hearty")
                    .font(.headline)
            }
            .padding([.leading,.bottom])
        }
    }
}


struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
            .environmentObject(RecipeModel())
    }
}
