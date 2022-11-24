//
//  GeneriView.swift
//  Cinemates
//
//  Created by Mattia Golino on 10/11/22.
//

import SwiftUI

struct GeneriView: View {
    
    @State var generi: [Generi]
    
    var body: some View {
        VStack{
            if(!(generi.isEmpty)){
                ForEach(generi) { genere in
                    Text(genere.name!).foregroundColor(Color.CineOrange).padding()
                }
            }else{
                Text("No Genres Present").foregroundColor(Color.CineOrange).padding()
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.CineBlack)
    }
}


