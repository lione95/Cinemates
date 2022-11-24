//
//  PopularCelebrityView.swift
//  Cinemates
//
//  Created by Mattia Golino on 11/11/22.
//

import SwiftUI
import Alamofire
import Kingfisher

struct PopularCelebrityView: View {
    
    let layout = [GridItem(.flexible()),]
    @State var actorDetaill = [ActorResponseResult]()
    
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal, showsIndicators: false){
                LazyHGrid(rows: layout,spacing: 30){
                    ForEach(actorDetaill) { detail in
                        NavigationLink(destination: ActorDetailView(celebrityId: detail.id!, knowFor: detail.known_for!).navigationBarBackButtonHidden(true)) {
                            VStack{
                                KFImage(URL(string: "https://image.tmdb.org/t/p/w500" + detail.profile_path!)!).resizable().frame(width: 150, height: 150).clipShape(Circle()).padding()
                                Text(detail.name!).foregroundColor(Color.CineOrange)
                            }.frame(width: 200, height: 250)
                        }
                    }
                }.onAppear(){
                    PrendiPopularCelebrity()
                }
            }
        }
    }
    func PrendiPopularCelebrity(){
        AF.request("https://api.themoviedb.org/3/person/popular?api_key=a3c55960c810bc8ae9b2e8d77d4f227c&language=en-US").validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do{
                            let actorResponce = try JSONDecoder().decode(ActorResponse.self, from: data)
                            actorDetaill.append(contentsOf: actorResponce.results!)
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
