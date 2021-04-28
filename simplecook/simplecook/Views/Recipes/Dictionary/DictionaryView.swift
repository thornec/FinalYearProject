//
//  DictionaryView.swift
//  simplecook
//
//  Created by Conor Thorne on 12/03/2021.
//

import SwiftUI

// view for displaying dictionary
struct DictionaryView: View {
    @EnvironmentObject var modelData: ModelData     // dictionary data
    @Binding var word : String                      // word to define
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                // nav bar header
                Text("dictionary")
                        .bold()
                        .font(.title)
                    
                Divider()               // line
                
                // dict imag
                Image(word)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 1))
                
                // word to be defined
                Text(word)
                    .italic()
                    .font(.title2)
                    
                Divider()               // line
                    
                let definition = ModelData().dictionaryEntries[word]!   // get definiton of word from model data dictionary
                Text(definition)    // display definition
            }
            .padding(20)
            .padding(.horizontal)                       // creates wide rectangle
            .background(Color.white)                    // make box white
            .foregroundColor(.black)                    // sets color of text
            .cornerRadius(20)                           // rounds corners
            .shadow(radius:9)                           // add shadow
        }
        .offset(y:-150)
    }
}

struct DictionaryView_Previews: PreviewProvider {
    static let word = "onion"       // test data
    static var previews: some View {
        DictionaryView(word:.constant("onion")).environmentObject(ModelData())
    }
}

