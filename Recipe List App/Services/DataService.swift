//
//  DataService.swift
//  Recipe List App
//
//  Created by Steve Kite on 4/1/22.
//

import Foundation

class DataService {

    static func getLocalData() -> [Recipe] {

        // Parse local json file

        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")

        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }

        // Create a url object
        let url = URL(fileURLWithPath: pathString!)

        do {
            // create a data obect
            let data = try Data(contentsOf: url)

            // Decode the data with a Json decoder
            let decoder = JSONDecoder()

            do {

                let recipeData = try decoder.decode([Recipe].self, from: data)

                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                // Return the recipes
                return recipeData
            } catch {
                // error parsing json
                print(error)
            }
        }
        catch {
            // error getting data
            print(error)
        }
        // If error return empty array
        return[Recipe]()

    }

}
