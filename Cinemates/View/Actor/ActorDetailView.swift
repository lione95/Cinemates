//
//  ActorDetailView.swift
//  Cinemates
//
//  Created by Mattia Golino on 11/11/22.
//

import SwiftUI
import Alamofire
import Kingfisher

struct ActorDetailView: View {
    
    @State var celebrityId: Int?
    @Environment(\.presentationMode) var presentationMode
    @State var arrayDetail = [ActorDetail]()
    @State var knowFor =  [AttoriResponseResultsKnownFor]()
    
    var body: some View {
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
                        KFImage( URL(string: "https://image.tmdb.org/t/p/w500" + detail.profile_path!)!).resizable().frame(maxWidth: 200, maxHeight: 250).padding()
                    }
                    Spacer()
                    Text(detail.name!).foregroundColor(Color.CineOrange).font(.system(size: 30))
                    ScrollView(showsIndicators: false){
                        VStack{
                            VStack{
                                ZStack{
                                    Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                    Text("Biography").foregroundColor(Color.CineBlack)
                                }
                                Text(detail.biography!).foregroundColor(Color.CineOrange).padding()
                            }
                            VStack{
                                ZStack{
                                    Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                    Text("Also Known As").foregroundColor(Color.CineBlack)
                                }
                                AlsoKnowView(alsoKnow: detail.also_known_as!)
                            }
                            VStack{
                                ZStack{
                                    Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                    Text("Place Of Birth").foregroundColor(Color.CineBlack)
                                }
                                Text(detail.place_of_birth!).foregroundColor(Color.CineOrange)
                            }
                            VStack{
                                ZStack{
                                    Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                    Text("Birthday").foregroundColor(Color.CineBlack)
                                }
                                Text(detail.birthday!).foregroundColor(Color.CineOrange)
                            }
                            VStack{
                                ZStack{
                                    Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                    Text("Deathday").foregroundColor(Color.CineBlack)
                                }
                                if(!(detail.deathday == nil)){
                                    Text(detail.deathday!).foregroundColor(Color.CineOrange)
                                }else{
                                    Text("TThere Is No Date Of Death").foregroundColor(Color.CineOrange)
                                }
                            }
                            VStack{
                                ZStack{
                                    Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                    Text("Role").foregroundColor(Color.CineBlack)
                                }
                                if(!(detail.known_for_department!.isEmpty)){
                                    Text(detail.known_for_department!).foregroundColor(Color.CineOrange)
                                }else{
                                    Text("There Is No Role For This Actor").foregroundColor(Color.CineOrange)
                                }
                            }
                            VStack{
                                ZStack{
                                    Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                    Text("Known For").foregroundColor(Color.CineBlack)
                                }
                                KnownForView(knownFor: knowFor)
                            }
                            VStack{
                                ZStack{
                                    Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                    Text("Homepage").foregroundColor(Color.CineBlack)
                                }
                                if(!(detail.homepage == nil)){
                                    Text(detail.homepage!).foregroundColor(Color.CineOrange)
                                }else{
                                    Text("There Is No Homepage").foregroundColor(Color.CineOrange)
                                }
                            }
                            VStack{
                                ZStack{
                                    Rectangle().fill(Color.CineOrange).frame(maxWidth: .infinity, maxHeight: 25)
                                    Text("Profile Image").foregroundColor(Color.CineBlack)
                                }
                               ProfileImageView(celebrityId: celebrityId)
                            }
                        }
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.CineBlack).onAppear(){
            PrendiDettagliAttore()
        }
    }
    
    func PrendiDettagliAttore(){
        AF.request("https://api.themoviedb.org/3/person/" + String($celebrityId.wrappedValue!) + "?api_key=a3c55960c810bc8ae9b2e8d77d4f227c&language=en-US").validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do{
                            let detailResponce = try JSONDecoder().decode(ActorDetail.self, from: data)
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
