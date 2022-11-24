//
//  LogInView.swift
//  Cinemates
//
//  Created by Mattia Golino on 04/11/22.
//

import SwiftUI

struct LogInView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Image("LogoCinemates")
                Spacer()
                HStack{
                    TextField(text: $username, prompt: Text("Email/Username").foregroundColor(Color.CineWhite)) {
                    }.foregroundColor(Color.CineWhite).autocorrectionDisabled(true).frame(width: 300,height: 50)
                    Text(Image(systemName: "at.circle.fill")).foregroundColor(Color.CineWhite)
                }
                HStack{
                    SecureField(text: $password, prompt: Text("Password").foregroundColor(Color.CineWhite)) {
                    }.foregroundColor(Color.CineWhite).autocorrectionDisabled(true).frame(width: 300,height: 50)
                    Text(Image(systemName: "lock.fill")).foregroundColor(Color.CineWhite)
                }
                Spacer()
                HStack{
                    Text("Hai Dimenticato La Password?").foregroundColor(Color.CineWhite)
                    Button("Clicca Qui"){
                        
                    }
                }
                Spacer()
                NavigationLink(destination: RootTabView().navigationBarBackButtonHidden(true)) {
                    Text("Accedi").font(.title3).frame(width: 160,height: 50).background(Color.CineOrange).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.CineBlack)
                }
                Spacer()
            }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color.CineBlack)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
