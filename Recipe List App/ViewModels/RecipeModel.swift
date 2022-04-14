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
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            // get a single size by multiplying denominator by the recipe servings
            denominator = denominator * recipeServings
            
            // get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion if numerator > denominator
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                
                // Assign to portion string
                portion += String(wholePortions)
            }
            // Express the remainder as a fraction
            if numerator > 0 {
                // Assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
                print(portion)
            }
            
        }
        
        if var unit = ingredient.unit {
            if (wholePortions == 1 && numerator != 0) || wholePortions > 1 {
            // Calculate appropriate suffix

            if unit.suffix(2) == "ch" {
                unit += "es"
            } else if unit.suffix(1) == "f" {
                unit = String(unit.dropLast())
                unit += "ves"
            } else {
                unit += "s"
            }
            }

            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            
            return portion + unit
        }
               
        return portion
    }
}
