import SwiftUI

struct Search: View {
    
    //let recipes = ["pasta pesto", "toast"]
    
    // state of search string
    @State private var searchText : String = ""
    
    @EnvironmentObject var modelData: ModelData     // allows modelData to get its value automatically
    
    @State private var showSavedOnly = false


    // compute filtered version of list
    var filteredSearch : [Recipe] {
        modelData.recipes.filter { recipe in
            (recipe.name.lowercased().contains(self.searchText.lowercased()) || self.searchText.isEmpty) && (!showSavedOnly || recipe.isSaved)
        }
    }
    
    // filtered version displaying saved recipes only
    var filteredRecipes: [Recipe] {
        modelData.recipes.filter { recipe in
            (!showSavedOnly || recipe.isSaved)
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
                SearchBar(text: $searchText, placeholder: "search by recipe or ingredients")
                
                // list recipes row and destination
                VStack(){
                    ScrollView{
                        Toggle(isOn: $showSavedOnly){
                            Text("saved recipes")
                        }
                        ForEach(filteredSearch){ recipe in
                        NavigationLink(destination: RecipeDetails(recipe: recipe)){
                            RecipeRow(recipe: recipe)
                            
                        }
                        .offset(x:-10)
                        
                        }
                    }
                        

                        

                }
            }
        }
    }
}



struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
            .environmentObject(ModelData())
            .onAppear(perform: {
                UITableView.appearance().separatorColor = .clear
            })
        
    }
}
