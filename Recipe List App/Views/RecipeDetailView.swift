//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Steve Kite on 4/1/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                //MARK: recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leastNormalMagnitude)
                    .font(.largeTitle)
                
                // MARK: aServing Size slector
                VStack(alignment:.leading) {
                Text("Select your servings size:")
                        .padding(.leading)
                //MARK: Serving Size picker
                Picker("", selection: $selectedServingSize) {
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }
                .pickerStyle(.segmented)
                .frame(width:160)
                .padding(.leading)
                }
                //MARK: ingredients
                VStack(alignment:.leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach(recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name)
                    }
                }
                .padding(.horizontal)
                // MARK: Divider
                Divider()
                // MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                        
                    }
                }
                .padding(.horizontal)
            }
        }
//        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
