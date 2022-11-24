//
//  UpcomingFilmsView.swift
//  Cinemates
//
//  Created by Mattia Golino on 08/11/22.
//

import SwiftUI
import Alamofire
import Kingfisher

struct UpcomingFilmsView: View {
    
    let layout = [GridItem(.flexible()),]
    @State var upcomingMovieDetail = [MovieResponseResults]()
    
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal, showsIndicators: false){
                LazyHGrid(rows: layout,spacing: 20){
                    ForEach(upcomingMovieDetail) { detail in
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
                    PrendiUpcomingFilm()
                }
            }
        }
    }
    func PrendiUpcomingFilm(){
        AF.request("https://api.themoviedb.org/3/movie/upcoming?api_key=a3c55960c810bc8ae9b2e8d77d4f227c&language=en-US").validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do{
                            let upcomingResponce = try JSONDecoder().decode(UpcomingResponse.self, from: data)
                            upcomingMovieDetail.append(contentsOf: upcomingResponce.results!)
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
