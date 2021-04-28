//
//  MyRecipeData.swift
//  simplecook
//
//  Created by Conor Thorne on 22/03/2021.
//

import Foundation

// app will be storing files on user's documents using functions in this data class
class MyRecipeData: ObservableObject {
    
    // find user's document folder
    private static var documentsFolder: URL {
        do {
            // return users' documents folder
            return try FileManager.default.url(for: .documentDirectory,
                                                in: .userDomainMask,
                                                appropriateFor: nil,
                                                create: false)
            } catch {
                // error
                fatalError("Can't find documents directory.")
            }
    }
    
    // find url of myrecipies.data file in the user's document's folder
    private static var fileURL: URL {
            return documentsFolder.appendingPathComponent("myrecipes.data")
    }

    @Published var myrecipes: [MyRecipeModel] = []     // initalize globabl my recipe array variable
    
    
    // method to load data into myrecipes array from the myrecipes.data file
    func load() {
        // request global que with background thread service
        DispatchQueue.global(qos: .background).async { [weak self] in
            // asynchronously executing block
            guard let data = try? Data(contentsOf: Self.fileURL) else {      // load contents of file into constant 'data'
            //#if DEBUG
            // load sample recipes
            DispatchQueue.main.async {
                self?.myrecipes = MyRecipeModel.data
            }
            //#endif
            return
        }
                
        // use jsondecoder to decode scrum data
        guard let myRecipes = try? JSONDecoder().decode([MyRecipeModel].self, from: data) else {
            // error decoding file
            fatalError("Unsucessful at decoding recipe file")
        }
        // on main queue set myrecipes equal to folder data
        DispatchQueue.main.async {
            self?.myrecipes = myRecipes
            }
        }
    }
    
    // function to save user's recipes
    func save(){
        DispatchQueue.global(qos: .background).async { [weak self] in
            // make sure self is in scope
            guard let myrecipes = self?.myrecipes else { fatalError("self is out of scope")}
            
            // encode recipes using json encoder
            guard let data = try? JSONEncoder().encode(myrecipes) else { fatalError("error encoding the recipes in json")}
            
            // write encoded recipes to file myrecipes.data
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile) // write data to file
            } catch {
                fatalError("cant write to file")    // error
            }
        }
    }
}
