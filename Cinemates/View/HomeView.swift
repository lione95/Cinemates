//
//  HomeView.swift
//  Cinemates
//
//  Created by Mattia Golino on 07/11/22.
//

import SwiftUI
import Alamofire



struct HomeView: View {
        
    var body: some View {
        VStack{
            Image("LogoCinemates")
            Spacer()
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    (Text("Upcoming Films").font(.system(size: 30)) /*+ Text(Image(""))*/).foregroundColor(Color.CineOrange)
                    UpcomingFilmsView()
                }
                Spacer()
                VStack{
                    (Text("Popular Celebrity").font(.system(size: 30)) /*+ Text(Image(""))*/).foregroundColor(Color.CineOrange)
                    PopularCelebrityView()
                }
                Spacer()
                VStack{
                    (Text("Popular Films").font(.system(size: 30)) /*+ Text(Image(""))*/).foregroundColor(Color.CineOrange)
                    PopularFilmView()
                }
                Spacer()
                VStack{
                    (Text("Top Rated Films").font(.system(size: 30)) /*+ Text(Image(""))*/).foregroundColor(Color.CineOrange)
                    TopRatedView()
                }
                Spacer()
                VStack{
                    (Text("Now Playng Films").font(.system(size: 30)) /*+ Text(Image(""))*/).foregroundColor(Color.CineOrange)
                    NowPlayingView()
                }
            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color.CineBlack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
