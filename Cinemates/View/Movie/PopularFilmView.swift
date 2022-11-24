//
//  PopularFilmView.swift
//  Cinemates
//
//  Created by Mattia Golino on 11/11/22.
//

import SwiftUI
import Alamofire
import Kingfisher

struct PopularFilmView: View {
    
    let layout = [GridItem(.flexible()),]
    @State var popularMovieDetail = [MovieResponseResults]()
    
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal, showsIndicators: false){
                LazyHGrid(rows: layout,spacing: 30){
                    ForEach(popularMovieDetail) { detail in
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous).fill(Color.CineOrange).shadow(radius: 10)
                            NavigationLink(destination: MovieDetailView(movieId: detail.id!).navigationBarBackButtonHidden(true)) {
                                VStack{
                                    KFImage(URL(string: "https://image.tmdb.org/t/p/w500" + detail.poster_path!)!).resizable().frame(maxWidth: 150, maxHeight: 300).padding()
                                    Divider().background(Color.CineBlack)
                                Text(detail.title!).foregroundColor(Color.CineBlack)
                                }.frame(width: 160, height: 300)
                            }
                        }.padding(.top).padding(.horizontal)
                    }
                }.onAppear(){
                    PrendiPopularFilm()
                }
            }
        }
    }
    
    func PrendiPopularFilm(){
        AF.request("https://api.themoviedb.org/3/movie/popular?api_key=a3c55960c810bc8ae9b2e8d77d4f227c&language=en-US").validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do{
                            let popularResponce = try JSONDecoder().decode(PopularResponce.self, from: data)
                            popularMovieDetail.append(contentsOf: popularResponce.results!)
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
