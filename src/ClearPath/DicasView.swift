//
//  DicasView.swift
//  ClearPath
//
//  Created by Turma01-Backup on 04/04/25.
//

import SwiftUI

struct DicasView: View {
    var body: some View {
        ZStack {
            Color.verdeFundo
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    VStack {
                        HStack {
                            Text("Dicas Diárias")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 25))
                                .padding(.horizontal, 20)
                                .fontWeight(.heavy)
                            
                            Spacer()
                        } // HStack
                        Text("Informações importantes para acabar com seu vicio!")
                            .foregroundStyle(Color.white)
                            .padding(.horizontal)
                    } //Vstack - Dicas Diarias
                    .frame(width: 330, height: 116)
                    .background(Color.verdeClaro)
                    .cornerRadius(17)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .shadow(radius: 6)
                    
                    VStack {
                        HStack {
                            Image("atividadeFisica")
                                .resizable()
                                .frame(width:38, height:38)
                                .padding(.leading, 20)
                            Text("Atividades físicas")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 22))
                                .padding(.horizontal, 10)
                                .fontWeight(.heavy)
                            
                            Spacer()
                        } // HStack
                        VStack {
                            Text("Exercícios liberam endorfina e ajudam a reduzir os sintomas da abstinência. Comece com caminhadas de 10 minutos")
                                .foregroundStyle(Color.black)
                                .padding(.vertical, 17)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .bold()
                        }
                        .frame(width: 295, height: 112)
                        .background(Color.cinza)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    } //Vstack - Atividades físicas
                    .frame(width: 330, height: 200)
                    .background(Color.white)
                    .cornerRadius(17)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .shadow(radius: 6)
                    
                    VStack {
                        HStack {
                            Image("agua")
                                .resizable()
                                .frame(width:38, height:38)
                                .padding(.leading, 20)
                            Text("Hidrate-se")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 22))
                                .padding(.horizontal, 10)
                                .fontWeight(.heavy)
                            
                            Spacer()
                        } // HStack
                        VStack {
                            Text("Beber água gelada com canudo ajuda a reduzir a ansiedade e simula o gesto de fumar")
                                .foregroundStyle(Color.black)
                                .padding(.vertical, 17)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .bold()
                        }
                        .frame(width: 295, height: 88)
                        .background(Color.cinza)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    } //Vstack - Hidrate-se
                    .frame(width: 330, height: 180)
                    .background(Color.white)
                    .cornerRadius(17)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .shadow(radius: 6)
                    
                    
                    VStack {
                        HStack {
                            Image("chain")
                                .resizable()
                                .frame(width:38, height:38)
                                .padding(.leading, 20)
                            Text("Lidando com a fissura")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 22))
                                .padding(.horizontal, 10)
                                .fontWeight(.heavy)
                            
                            Spacer()
                        } // HStack
                        VStack {
                            Text("Quando sentir vontade de fumar, experimente a técnica dos 5 minutos: espere 5 minutos ocupando-se com outra atividade. A fissura geralmente passa!")
                                .foregroundStyle(Color.black)
                                .padding(.vertical, 17)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .bold()
                        }
                        .frame(width: 295, height: 124)
                        .background(Color.cinza)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        
                    } //Vstack - Atividades físicas
                    .frame(width: 330, height: 200)
                    .background(Color.white)
                    .cornerRadius(17)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .shadow(radius: 6)
                    
//                    VStack {
//                        HStack {
//                            
//                            
//                            Text("Assistente Virtual")
//                                .foregroundStyle(Color.white)
//                                .font(.system(size: 25))
//                                .padding(.horizontal, 20)
//                                .fontWeight(.heavy)
//                                .offset(x: 10)
//                            
//                            Image(systemName: "chevron.up")
//                                .foregroundStyle(Color.white)
//                                .padding(.horizontal)
//                                .fontWeight(.heavy)
//                                .offset(x: -20)
//                            
//                        } // HStack
//                        
//                    } //Vstack - Dicas Diarias
//                    .frame(width: 330, height: 50)
//                    .background(Color.verdeClaro)
//                    .cornerRadius(17)
//                    .padding(.horizontal, 20)
//                    .padding(.vertical, 8)
//                    .shadow(radius: 6)
                    
                } // VStack - Total
            } //ScrollView
        } // ZStack
    }
    
}

#Preview {
    DicasView()
}
