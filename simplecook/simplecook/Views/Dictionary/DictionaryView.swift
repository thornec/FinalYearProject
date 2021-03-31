//
//  DictionaryView.swift
//  simplecook
//
//  Created by Conor Thorne on 12/03/2021.
//

import SwiftUI

struct DictionaryView: View {
    
    @Binding var word : String
    @EnvironmentObject var modelData: ModelData     // allows modelData to get its value automatically
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading){
                    Text("dictionary")
                        .bold()
                        .font(.title)
                    
                    Divider()
                    
                    Image(word)
                        .resizable()
                        //.frame(width:200,height:200)
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 1))
                    
                    Text(word)
                        .italic()
                        .font(.title2)
                    
                    Divider()
                    
                    let definition = ModelData().dictionaryEntries[word]!
                    
                    Text(definition)
                }
                .padding(20)
                .padding(.horizontal)                      // creates wide rectangle
                .background(Color.white)
                .foregroundColor(.black)                    // sets color of text
                .cornerRadius(20)                           // rounds corners
                .shadow(radius:9)
                
            }
            .offset(y:-150)
            
        }
    }
}

struct DictionaryView_Previews: PreviewProvider {
    
    static let word = "onion"

    static var previews: some View {
        DictionaryView(word:.constant("onion")).environmentObject(ModelData())

    }
}

