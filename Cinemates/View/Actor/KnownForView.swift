//
//  KnowForView.swift
//  Cinemates
//
//  Created by Mattia Golino on 14/11/22.
//

import SwiftUI

struct KnownForView: View {
    
    @State var knownFor =  [AttoriResponseResultsKnownFor]()
    
    var body: some View {
        VStack{
            if(!(knownFor.isEmpty)){
                ForEach(knownFor) { kfor in
                    Text(kfor.title!).foregroundColor(Color.CineOrange)
                }
            }else{
                Text("There Is No Film").foregroundColor(Color.CineOrange)
            }
        }
    }
}
