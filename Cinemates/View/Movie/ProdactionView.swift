//
//  ProdactionView.swift
//  Cinemates
//
//  Created by Mattia Golino on 10/11/22.
//

import SwiftUI

struct ProdactionView: View {
    
    @State var produzione: [Produttori]
    
    var body: some View {
        VStack{
            if(!(produzione.isEmpty)){
                ForEach(produzione) { produttori in
                    Text(produttori.name!).foregroundColor(Color.CineOrange).padding()
                }
            }else{
                Text("No Production Companies Present").foregroundColor(Color.CineOrange).padding()
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).foregroundColor(Color.CineBlack)
    }
}
