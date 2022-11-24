//
//  ProfileImageView.swift
//  Cinemates
//
//  Created by Mattia Golino on 14/11/22.
//

import SwiftUI
import Alamofire
import Kingfisher

struct ProfileImageView: View {
    
    @State var celebrityId: Int?
    @State var arrayFoto = [ActorFotoResponce]()
    @State var image = [ActorImage]()
        
        var body: some View {
            VStack{
                if(!(image.isEmpty)){
                    ForEach(image) { poster in
                        ScrollView(.horizontal, showsIndicators: false){
                            KFImage(URL(string: "https://image.tmdb.org/t/p/w500" + poster.file_path!)!).resizable().frame(maxWidth: 150, maxHeight: 300).padding()
                        }
                    }
                }else{
                    Text("No Poster Present").foregroundColor(Color.CineOrange)
                }
            }.onAppear(){
                PrendiFotoFilm()
                if(!(arrayFoto.isEmpty)){
                    for foto in arrayFoto{
                        image.append(contentsOf: foto.profiles!)
                    }
                }
            }
        }
        
        func PrendiFotoFilm(){
            AF.request("https://api.themoviedb.org/3/person/" + String(celebrityId!) + "/images?api_key=a3c55960c810bc8ae9b2e8d77d4f227c&language=en-US").validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result {
                    case .success:
                        if let data = response.data {
                            do{
                                let detailResponce = try JSONDecoder().decode(ActorFotoResponce.self, from: data)
                                arrayFoto.append(detailResponce)
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
