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
                        .font(.system(size:22))
                        .fontWeight(.heavy)
                    HStack {
                        Image("trofeu")
                            .resizable()
                            .frame(width: 23, height: 23)
                        Text("Ranking da comunidade")
                            .font(.system(size:22))
                            .fontWeight(.bold)
                    }
                    
                    HStack {
                        VStack {
                            Text("#4")
                                .font(.system(size: 40))
                                .fontWeight(.heavy)
                            Text("sua posição")
                                .font(.system(size: 14))
                                .offset(y:-10)
                                .fontWeight(.semibold)
                        }
                        .padding(4)
                        
                        VStack(alignment:.leading) {
                            HStack {
                                Image("Streak")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                Text("45 Dias limpo(a)")
                                    .font(.system(size: 14))
                            }
                            HStack {
                                Image("Coroa")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                Text("Melhor posição: #2")
                                    .font(.system(size: 14))
                                    .offset(y: 1)
                            }
                        }
                        .padding(10)
                        .fontWeight(.semibold)
                    }
                    .frame(width: 300, height: 100)
                    .background(Color.verdeEscuro)
                    .cornerRadius(8)

                }
                .padding()
                .frame(width: 350)
                .background(Color.verdeMorto)
                .foregroundColor(.cinza)
                .cornerRadius(8)
                .shadow(radius: 6)

                HStack {
                    VStack {
                        Image("segundo")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.top, 5)
                        Text("Fumante Soares")
                            .font(.system(size: 15))
                            .padding(.top, 5)
                        Text("18 dias")
                            .padding(.top)
                            .padding(.bottom, 5)
                            .font(.system(size: 15))
                        
                    }
                    .multilineTextAlignment(.center)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 160)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(radius: 6)
                    
                    Spacer()
                    
                    VStack {
                        Image("primeiro")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(.bottom, 15)
                        Text("Fumante Soares")
                        Text("18 dias")
                            .padding(.top)
                        
                    }
                    .multilineTextAlignment(.center)
                    .frame(width: 120, height: 190)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(radius: 6)

                    Spacer()
                    
                    VStack {
                        Image("terceiro")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.top, 5)
                        Text("Fumante Soares")
                            .padding(.top, 5)
                        Text("18 dias")
                            .padding(.top)
                            .padding(.bottom, 5)
                        
                    }
                    .multilineTextAlignment(.center)
                    .frame(width: 100, height: 160)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(radius: 6)

            
                }
                .frame(width: 350)
                .padding(2)
                .fontWeight(.semibold)
                .padding(.top, 15)
                
                ScrollView {
                    Text("Classificação completa")
                         .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                         .font(.system(size: 24))
                         .padding(.top, 10)
                    VStack(alignment: .leading) {
                        
                        HStack() {
                            Text("1")
                                .frame(width: 35,height: 35)
                                .background(.cinza)
                                .cornerRadius(5)
                            Image("1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 39, height: 39)
                            VStack(alignment: .leading){
                                Text("Fumante Contumaz")
                                    .fontWeight(.semibold)
                                    .offset(y:3)
                                Text("5 dias")
                                    .fontWeight(.ultraLight)
                                    .font(.system(size: 15))
                                    .offset(y: -2)
                            }
                            Spacer()
                            VStack {
                                Text("55")
                                    .font(.system(size: 15))
                                    .fontWeight(.heavy)
                                    .offset(y: 5)
                                Text("dias")
                                    .font(.system(size: 15))
                                    .padding(.bottom, 3)
                                
                            }
                            .frame(width: 40,height: 40)
                            .background(.verdeClaro)
                            .foregroundColor(.cinza)
                            .cornerRadius(5)
                            
                        }
                        .padding(.horizontal)
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
