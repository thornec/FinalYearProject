//
//  CheckList.swift
//  simplecook
//
//  Created by Conor Thorne on 24/02/2021.
//

import SwiftUI

struct CheckList: View {
    
    var ingredients : [String]
        
    
    var body: some View {
        
        VStack {
            
            // convert ingredient list into checklist struct array
            var checklist = createList(ingredientslist: ingredients)
            
            List{
                ForEach(checklist, id: \.self){ item in
                    HStack{
                        Text(item.title)
                        
                        Spacer()
                        
                        ZStack{
                            CheckBox(checked: item.isChecked)
                        }
                    }
            }

        }

    }
}
}

struct CheckList_Previews: PreviewProvider {
    static var previews: some View {
        CheckList(ingredients : shoppinglist[0].ingredients)
    }
}

    struct checkListItem : Hashable {
    var isChecked : Bool = false     // default val false
    var title : String
}


// function to convert list of ingredients into checklist array
func createList(ingredientslist : [String]) -> [checkListItem] {
    
    var checklist = [checkListItem]()
    
    for item in ingredientslist {
        let check = checkListItem(title: item)
        checklist.append(check)
    }
    
    return checklist
    
}

