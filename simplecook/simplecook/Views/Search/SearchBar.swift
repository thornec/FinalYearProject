//
//  SearchBar.swift
//  simplecook
//
//  Created by Conor Thorne on 19/02/2021.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    @Binding var text : String      // variable for search query
    var placeholder : String        // variable for placeholder text

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text : String      // variable for search query
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
            text = searchText
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = placeholder
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
    
}


