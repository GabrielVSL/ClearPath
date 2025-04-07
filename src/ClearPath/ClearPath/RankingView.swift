//
//  RankingView.swift
//  ClearPath
//
//  Created by Turma01-27 on 07/04/25.
//

import SwiftUI

struct RankingView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.cinza
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                VStack {
                    Text("Nome do grupo")
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .padding(1)
                    Text("🏆  Ranking da comunidade")
                        .font(.system(size:25))
                        .fontWeight(.bold)
                    HStack {
                        VStack {
                            Text("#4")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                            Text("sua posição")
                                .offset(y:-10)
                                .fontWeight(.semibold)
                        }
                        .padding(1)
                        
                        VStack(alignment:.leading) {
                            Text("🔥45 Dias limpo(a)")
                            Text("👑Melhor sequência:321")
                        }
                        .padding(10)
                        .fontWeight(.semibold)
                    }
                    .frame(width: 330, height: 100)
                    .background(Color.verdeEscuro)
                    .cornerRadius(8)

                }
                .padding()
                .frame(width: 350)
                .background(Color.verde)
                .foregroundColor(.cinza)
                .cornerRadius(8)
                .shadow(radius: 6)

                HStack {
                    VStack {
                        Text("🥈")
                            .font(.system(size: 30))
                            .padding(.top, 5)
                        Text("Fumante Soares")
                            .padding(.top, 5)
                        Text("18 dias")
                            .padding(.top)
                            .padding(.bottom, 5)
                        
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(radius: 6)
                    Spacer()
                    VStack {
                        Text("🥇")
                            .font(.system(size: 40))
                            .padding(.bottom, 10)
                        Text("Fumante Soares")
                        Text("18 dias")
                            .padding(.top)
                        
                    }
                    .frame(width: 120, height: 190)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(radius: 6)

                    Spacer()
                    VStack {
                        Text("🥉")
                            .font(.system(size: 30))
                            .padding(.top, 5)
                        Text("Fumante Soares")
                            .padding(.top, 5)
                        Text("18 dias")
                            .padding(.top)
                            .padding(.bottom, 5)
                        
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(radius: 6)

            
                }
                .frame(width: 350)
                .padding(2)
                .fontWeight(.semibold)
                
                ScrollView {
                    Text("Classificação completa")
                         .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                         .font(.system(size: 20))
                         .padding(.top, 10)
                    VStack(alignment: .leading) {

                        HStack() {
                           Text("1")
                                .frame(width: 40,height: 40)
                                .background(.cinza)
                                .cornerRadius(5)
                            VStack(alignment: .leading){
                                Text("Fumante Contumaz")
                                    .fontWeight(.semibold)
                                    .offset(y:3)
                                Text("5 dias")
                                    .fontWeight(.ultraLight)
                                    .font(.system(size: 15))
                                    .offset(y: -2)
                            }
                            VStack {
                                Text("55")
                                    .fontWeight(.heavy)
                                    .offset(y: 3)
                                Text("dias")
                                    .font(.system(size: 15))
                                    .offset(y: -3)

                            }
                            .frame(width: 40,height: 40)
                            .background(.verdeClaro)
                            .foregroundColor(.cinza)
                            .cornerRadius(5)
                            
                        }
                    }
                    
                }
                .frame(width: 350)
                .background(.white)
                .cornerRadius(8)
                .shadow(radius: 6)

            }
            
        }
    }
}

#Preview {
    RankingView()
}
