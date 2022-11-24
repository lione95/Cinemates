//
//  SearchView.swift
//  Cinemates
//
//  Created by Mattia Golino on 15/11/22.
//

import SwiftUI
import Alamofire
import Kingfisher
import RadioGroup

struct SearchView: View {
    
    @State var serched: String = ""
    @State private var searchAs = 0
    @State private var written = "What do you want to search..."
    @State var genreFilmDetail = [Generi]()
    @State var serchedFilmDetail = [MovieResponseResults]()
    @State var serchedActorDetail = [ActorResponseResult]()
    @State var error = false
    @State var isFilmSerched = false
    @State var isActorSerched = false
    @State var isUserSerched = false
    
    var body: some View {
        VStack{
            HStack{
                Image("OscarSearch").resizable().frame(width: 38,height: 38)
                Text("CINESEARCH").foregroundColor(Color.CineOrange).font(.system(size: 30))
            }
            HStack{
                TextField(text: $serched, prompt: Text(written).foregroundColor(error ? Color.CineRed : Color.CineOrange)) {
                }.foregroundColor(Color.CineOrange).autocorrectionDisabled(true).frame(width: 300,height: 50)
                Button {
                    if(serched.isEmpty){
                        written = "Write Something"
                        error.toggle()
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                            error.toggle()
                            written = "What do you want to search..."
                        }
                    }else{
                        switch searchAs {
                        case 1:
                            CercaAttori()
                            isActorSerched.toggle()
                        case 2:
                            CercaUtenti()
                            isUserSerched.toggle()
                        default:
                            CercaFilm()
                            isFilmSerched.toggle()
                        }
                    }
                } label: {
                    Image(systemName: "magnifyingglass").foregroundColor(Color.CineOrange)
                }
            }
            HStack{
                RadioGroupPicker(selectedIndex: $searchAs, titles: ["Movie", "Actor", "Users"], tintColor: UIColor(named: "CineBlack")!, titleColor: UIColor(named: "CineBlack")!).isVertical(false).fixedSize()
            }.frame(maxWidth: .infinity, maxHeight: 40).background(Color.CineOrange)
            if(isFilmSerched){
                ScrollView(showsIndicators: false){
                    ForEach(serchedFilmDetail) { film in
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous).fill(Color.CineBlack).shadow(radius: 10)
                            NavigationLink(destination: MovieDetailView(movieId: film.id!).navigationBarBackButtonHidden(true)) {
                                HStack{
                                    KFImage(URL(string: "https://image.tmdb.org/t/p/w500" + film.poster_path!)!).resizable().frame(maxWidth: 150, maxHeight: 250).padding(.top).padding(.horizontal)
                                    VStack{
                                        Text(film.title!).foregroundColor(Color.CineOrange).font(.system(size: 18)).padding(.horizontal)
                                        Spacer()
                                        VStack{
                                            Text("Overview:").foregroundColor(Color.CineOrange).font(.system(size: 15))
                                            (Text(film.overview!.isEmpty ? "Non Disponibile" : film.overview!.prefix(40)) + Text(film.overview!.isEmpty ? "" : "...\nKeep Reading")).foregroundColor(Color.CineOrange).font(.system(size: 13))
                                        }
                                        Spacer()
                                        HStack{
                                            Text("Vote TMDB:").foregroundColor(Color.CineOrange).font(.system(size: 15))
                                            Text(String(film.vote_average!)).foregroundColor(Color.CineOrange)
                                        }
                                        Spacer()
                                        HStack{
                                            Text("Vote Cinemates: ").foregroundColor(Color.CineOrange).font(.system(size: 15))
                                            Text("0").foregroundColor(Color.CineOrange)
                                            Text("/5").foregroundColor(Color.CineOrange)
                                        }
                                    }
                                }
                            }
                        }.padding(.top).padding(.horizontal)
                    }
                }.onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
                        if(isActorSerched){
                            isActorSerched.toggle()
                        }else if(isUserSerched){
                            isUserSerched.toggle()
                        }
                    }
                }
            }
            if(isActorSerched){
                ScrollView(showsIndicators: false){
                    ForEach(serchedActorDetail) { detail in
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous).fill(Color.CineBlack).shadow(radius: 10)
                            NavigationLink(destination: ActorDetailView(celebrityId: detail.id!).navigationBarBackButtonHidden(true)) {
                                HStack{
                                    KFImage( URL(string: "https://image.tmdb.org/t/p/w500" + detail.profile_path!)!).resizable().frame(width: 150, height: 150).clipShape(Circle()).padding()
                                    VStack{
                                        Text(detail.name!).foregroundColor(Color.CineOrange).padding()
                                        Text(detail.known_for_department!).foregroundColor(Color.CineOrange).padding()
                                    }
                                }
                            }
                        }
                    }
                }.onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
                        if(isFilmSerched){
                            isFilmSerched.toggle()
                        }else if(isUserSerched){
                            isUserSerched.toggle()
                        }
                    }
                }
            }
            if(isUserSerched){
                ScrollView(showsIndicators: false){
                    
                }.onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
                        if(isFilmSerched){
                            isFilmSerched.toggle()
                        }else if(isActorSerched){
                            isActorSerched.toggle()
                        }
                    }
                }
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.CineBlack)
    }
    
    func CercaAttori(){
        AF.request("https://api.themoviedb.org/3/search/person?api_key=a3c55960c810bc8ae9b2e8d77d4f227c&language=en-US&query=" + serched.replacing(" ", with: "+")).validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do{
                            let actorSearchResponce = try JSONDecoder().decode(ActorResponse.self, from: data)
                            serchedActorDetail.append(contentsOf: actorSearchResponce.results!)
                        }catch let error{
                            print(String(describing: error))
                        }
                    }
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    func CercaUtenti(){
        print("Utenti")
    }
    
    func CercaFilm(){
        AF.request("https://api.themoviedb.org/3/search/movie?api_key=a3c55960c810bc8ae9b2e8d77d4f227c&language=en-US&query=" + serched.replacing(" ", with: "+")).validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do{
                            let filmSearchResponce = try JSONDecoder().decode(MovieResponse.self, from: data)
                            serchedFilmDetail.append(contentsOf: filmSearchResponce.results!)
                        }catch let error{
                            print(String(describing: error))
                        }
                    }
                case let .failure(error):
                    print(error)
                }
            }
    }
}
