//
//  AlsoKnowView.swift
//  Cinemates
//
//  Created by Mattia Golino on 14/11/22.
//

import SwiftUI

struct AlsoKnowView: View {
    
    @State var alsoKnow: [String]
    
    var body: some View {
        VStack{
            ForEach(alsoKnow, id: \.count){ name in
                Text(String(name.description)).foregroundColor(Color.CineOrange)
            }
        }
    }
}
