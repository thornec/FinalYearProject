import SwiftUI

struct Search: View {
    
    let recipes = ["pasta pesto", "toast"]
    @State private var searchText : String = ""

    var body: some View {
        NavigationView{
            VStack{
                SearchBar(text: $searchText, placeholder: "search by recipe or ingredients")
                
                RecipeList().environmentObject(ModelData())

                // list results
                List {
                    ForEach(self.recipes.filter{
                        // if empty search all cars otherwise check if cars contain search text
                        self.searchText.isEmpty ? true : $0.lowercased().contains(self.searchText.lowercased()) // change to lowercase
                    }, id: \.self) { recipe in
                        Text(recipe)
                    }
                }
            }
        }
    }
}



struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
