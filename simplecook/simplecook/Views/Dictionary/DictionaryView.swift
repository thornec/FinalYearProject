//
//  DictionaryView.swift
//  simplecook
//
//  Created by Conor Thorne on 12/03/2021.
//

import SwiftUI

struct DictionaryView: View {
    
    let word : String
    @EnvironmentObject var modelData: ModelData     // allows modelData to get its value automatically
    
    var body: some View {
        VStack(alignment: .leading){
            Text("dictionary")
                .bold()
                .font(.title)
            
            Divider()
            
            Text(word)
                .italic()
                .font(.title2)
            
            Divider()
            
            let definition = ModelData().dictionaryEntries[word]!
            
            Text(definition)
        }
        .padding(20)
        .frame(width:350,height:400)
        .padding(.horizontal)                      // creates wide rectangle
        .background(Color.white)
        .foregroundColor(.black)                    // sets color of text
        .cornerRadius(20)                           // rounds corners
        .shadow(radius:9)
        

    }
}

struct DictionaryView_Previews: PreviewProvider {
    
    static let word = "poached"

    static var previews: some View {
        DictionaryView(word:word).environmentObject(ModelData())

    }
}

