//
//  MovieDetailView.swift
//  Cinemates
//
//  Created by Mattia Golino on 08/11/22.
//

import SwiftUI
import Alamofire
import Kingfisher

struct MovieDetailView: View {
    
    @State var movieId: Int?
    @State var arrayDetail = [MovieDetail]()
    @Environment(\.presentationMode) var presentationMode
    @State var firstTime = true
    
    
    var body: some View {
        NavigationStack{
            VStack{
                ForEach(arrayDetail) { detail in
                    VStack{
                        HStack{
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "arrowtriangle.backward").foregroundColor(Color.CineOrange).padding()
                            }
                            Spacer()
                        }
                        HStack{
                            KFImage( URL(string: "https://image.tmdb.org/t/p/w500" + detail.poster_path!)!).resizable().frame(maxWidth: 150, maxHeight: 250).padding()
                            Spacer()
                            VStack{
                                HStack{
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "heart").foregroundColor(Color.CineOrange).padding()
                                    }
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "heart").foregroundColor(Color.CineOrange).padding()
                                    }
                                    Spacer()
                                }
                                Spacer()
                                HStack{
                                    Spacer()
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10).stroke().foregroundColor(Color.CineOrange).frame(width: 50, height: 30).background(Color.CineBlack)
                                        Text(String(detail.vote_average!)).foregroundColor(Color.CineOrange)
                                    }.padding()
                                }
                            }
                            
                        }
                        Text(detail.title!).foregroundColor(Color.CineOrange).font(.system(size: 30))
                        HStack{
                            Button {
                                
                            } label: {
                                (Text("Add On") + Text(" ") + Text(Image(systemName: "arrowtriangle.down.fill"))).foregroundColor(Color.CineOrange)
                            }
                            Spacer()
                            NavigationLink(destination: EmptyView()) {
                                Text("Reviews").foregroundColor(Color.CineOrange)
                            }
                        }.padding()
                        Spacer()
                        ScrollView(showsIndicators: false){
                            VStack{
                                VStack{
                                    ZStack{
                                        Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                        Text("Original Title").foregroundColor(Color.CineBlack)
                                    }
                                    Text(detail.original_title!).foregroundColor(Color.CineOrange).padding()
                                }
                                VStack{
                                    ZStack{
                                        Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                        Text("Release Date").foregroundColor(Color.CineBlack)
                                    }
                                    Text(detail.release_date!).foregroundColor(Color.CineOrange).padding()
                                }
                                VStack{
                                    ZStack{
                                        Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                        Text("Original Language").foregroundColor(Color.CineBlack)
                                    }
                                    Text(detail.original_language!).foregroundColor(Color.CineOrange).padding()
                                }
                                VStack{
                                    ZStack{
                                        Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                        Text("Overview").foregroundColor(Color.CineBlack)
                                    }
                                    Text(detail.overview!).foregroundColor(Color.CineOrange).padding()
                                }
                                VStack{
                                    ZStack{
                                        Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                        Text("Status").foregroundColor(Color.CineBlack)
                                    }
                                    Text(detail.status!).foregroundColor(Color.CineOrange).padding()
                                }
                                VStack{
                                    ZStack{
                                        Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                        Text("Genres").foregroundColor(Color.CineBlack)
                                    }
                                    GeneriView(generi: detail.genres!)
                                }
                                VStack{
                                    ZStack{
                                        Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                        Text("Production Companies").foregroundColor(Color.CineBlack)
                                    }
                                    ProdactionView(produzione: detail.production_companies!)
                                }
                                VStack{
                                    ZStack{
                                        Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                        Text("Posters").foregroundColor(Color.CineBlack)
                                    }
                                  FilmPosterView(movieId: $movieId)
                                }
                            }
                        }
                    }
               }
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.CineBlack).onAppear(){
                if(firstTime){
                    firstTime.toggle()
                    PrendiDettagliFilm()
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.CineBlack)
    }
    
    func PrendiDettagliFilm(){
        AF.request("https://api.themoviedb.org/3/movie/" + String($movieId.wrappedValue!) + "?api_key=a3c55960c810bc8ae9b2e8d77d4f227c&language=en-US").validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do{
                            let detailResponce = try JSONDecoder().decode(MovieDetail.self, from: data)
                            arrayDetail.append(detailResponce)
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

