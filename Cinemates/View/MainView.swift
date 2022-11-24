//
//  ContentView.swift
//  Cinemates
//
//  Created by Mattia Golino on 03/11/22.
//

import SwiftUI
import Lottie

struct MainView: View {
    
    @State private var isMoved = false
    @State private var isTextAppear = false
    @State private var isButtonAppear = false
    @State private var isTextOpacity = true
    @State private var isButtonOpacity = true
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    if(!(isMoved)){
                        LottieView(lottieFile: "welcome_anim")
                    }
                    Image("LogoCinemates")
                }
                if(isMoved){
                    Spacer().frame(height: 100)
                    VStack{
                        if(isTextAppear){
                            Text("La piattaforma social").foregroundColor(Color.CineWhite).font(.system(size: 30)).opacity(isTextOpacity ? 0.1: 1.0)
                            Text("che fa discutere anche in sala!").foregroundColor(Color.CineWhite).font(.system(size: 30)).opacity(isTextOpacity ? 0.1 : 1.0)
                        }
                    }.onAppear(){
                        withAnimation(.easeIn(duration: 1), {
                            isTextAppear.toggle()
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
                                isTextOpacity.toggle()
                            }
                        })
                    }
                    Spacer().frame(height: 100)
                    VStack{
                        VStack{
                            if(isButtonAppear){
                                NavigationLink(destination: LogInView().navigationBarBackButtonHidden(true)){
                                    Text("Accedi").font(.title3).frame(width: 160,height: 50).background(Color.CineOrange).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.CineBlack)
                                }.opacity(isButtonOpacity ? 0.1 : 1.0)
                            }
                        }.frame(maxWidth: .infinity,maxHeight: .infinity)
                        VStack{
                            if(isButtonAppear){
                                NavigationLink {
                                    
                                } label: {
                                    Text("Registrati").font(.title3).frame(width: 160,height: 50).background(Color.CineOrange).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.CineBlack)
                                }.opacity(isButtonOpacity ? 0.1 : 1.0)
                            }
                        }.onAppear(){
                            withAnimation(.easeIn(duration: 1), {
                                isButtonAppear.toggle()
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
                                    isButtonOpacity.toggle()
                                }
                            })
                        }
                    }.frame(maxWidth: .infinity,maxHeight: .infinity)
                    Spacer().frame(height: 250)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.CineBlack).transition(AnyTransition.move(edge: .top).combined(with: .opacity)).onTapGesture {
                isMoved.toggle()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
