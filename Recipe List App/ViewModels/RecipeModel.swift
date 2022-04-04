//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Steve Kite on 4/1/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an instance of DataService and get the data
        
        // Get a list of the recipes
        self.recipes = DataService.getLocalData()
    }
    
    
}
