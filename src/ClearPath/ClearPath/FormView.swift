//
//  DicasView.swift
//  ClearPath
//
//  Created by Turma01-Backup on 04/04/25.
//

import SwiftUI

struct FormView: View {
    @State private var nome: String = " "
    var body: some View {
        ZStack {
            Color.verdeFundo
                .edgesIgnoringSafeArea(.all)
            NavigationStack {
                ScrollView {
                    VStack {
                        VStack {
                            HStack {
                                Text("Perfil de Fumante")
                                    .foregroundStyle(Color.white)
                                    .font(.system(size: 25))
                                    .padding(.leading, 25)
                                    .fontWeight(.heavy)
                                
                                Spacer()
                            } // HStack
                            Text("Conte mais sobre seus hábitos para personalizarmos seu plano")
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
                                Text("Nome completo")
                                    .foregroundStyle(Color.black)
                                    .font(.system(size: 17))
                                    .padding(.horizontal, 20)
                                    .padding(.top)
                                    .fontWeight(.heavy)
                                
                                Spacer()
                            } // HStack
                            VStack {
                                TextField(" ", text: $nome)
                                    .foregroundStyle(Color.black)
                                    .padding(.vertical, 17)
                                    .padding(.horizontal, 10)
                                    .font(.system(size: 15))
                                    .bold()
                            }
                            .frame(width: 295, height: 30)
                            .background(Color.cinza)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            HStack {
                                Text("Data de nascimento")
                                    .foregroundStyle(Color.black)
                                    .font(.system(size: 17))
                                    .padding(.horizontal, 20)
                                    .fontWeight(.heavy)
                                
                                Spacer()
                            } // HStack
                            VStack {
                                TextField(" ", text: $nome)
                                    .foregroundStyle(Color.black)
                                    .padding(.vertical, 17)
                                    .padding(.horizontal, 10)
                                    .font(.system(size: 15))
                                    .bold()
                            }
                            .frame(width: 295, height: 30)
                            .background(Color.cinza)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            HStack {
                                Text("Cigarros por dia")
                                    .foregroundStyle(Color.black)
                                    .font(.system(size: 17))
                                    .padding(.horizontal, 20)
                                    .fontWeight(.heavy)
                                
                                Spacer()
                            } // HStack
                            VStack {
                                TextField(" ", text: $nome)
                                    .foregroundStyle(Color.black)
                                    .padding(.vertical, 17)
                                    .padding(.horizontal, 10)
                                    .font(.system(size: 15))
                                    .bold()
                            }
                            .frame(width: 295, height: 30)
                            .background(Color.cinza)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            HStack {
                                Text("Preço médio do maço")
                                    .foregroundStyle(Color.black)
                                    .font(.system(size: 17))
                                    .padding(.horizontal, 20)
                                    .fontWeight(.heavy)
                                
                                Spacer()
                            } // HStack
                            VStack {
                                TextField(" ", text: $nome)
                                    .foregroundStyle(Color.black)
                                    .padding(.vertical, 17)
                                    .padding(.horizontal, 10)
                                    .font(.system(size: 15))
                                    .bold()
                            }
                            .frame(width: 295, height: 30)
                            .background(Color.cinza)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            HStack {
                                Text("Há quantos anos fuma?")
                                    .foregroundStyle(Color.black)
                                    .font(.system(size: 17))
                                    .padding(.horizontal, 20)
                                    .fontWeight(.heavy)
                                
                                Spacer()
                            } // HStack
                            VStack {
                                TextField(" ", text: $nome)
                                    .foregroundStyle(Color.black)
                                    .padding(.horizontal, 10)
                                    .font(.system(size: 15))
                                    .bold()
                            }
                            .frame(width: 295, height: 30)
                            .background(Color.cinza)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.bottom)
                            
                            
                        } //Vstack - Campos de Resposta
                        .background(Color.white)
                        .cornerRadius(17)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .shadow(radius: 6)
                        
                        VStack {
                            HStack {
                                ZStack(alignment: .leading) {
                                    Image("info")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(Color.blue)
                                        .bold()
                                    
                                }
                                .padding(.horizontal, 20)
                                .background(Color.white)
                                .clipShape(Circle())
                                Text("Estes dados nos ajudam a calcular:")
                                    .foregroundStyle(Color.white)
                                    .font(.system(size: 14))
                                    .fontWeight(.heavy)
                                    .offset(x: -17)
                                
                                Spacer()
                            } // HStack
                            Text("- Seu gasto mensal com cigarros\n- Metas personalizadas de redução\n- Impacto na sua saúde")
                                .foregroundStyle(Color.white)
                                .padding(.horizontal)
                                .padding(.top, 1)
                                .font(.system(size: 15))
                                .bold()
                            
                        } //Vstack - Dicas Diarias
                        .frame(width: 330, height: 116)
                        .background(Color.verde)
                        .cornerRadius(17)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .shadow(radius: 6)
                        
                        NavigationLink(destination: MainView()) {
                            
                                VStack {
                                    HStack {
                                        Text("Salvar e Continuar")
                                            .foregroundColor(.white)
                                            .font(.system(size: 25))
                                            .padding(.horizontal, 20)
                                            .fontWeight(.heavy)
                                    } // HStack
                                } // VStack
                                .frame(width: 330, height: 50)
                                .background(Color.verdeClaro) // Certifique-se de que você tenha essa cor definida
                                .cornerRadius(17)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .shadow(radius: 6)
                            }
                        }

                    }// VStack - Total
                } // ScrollView
            } // NavigationStack
        .navigationBarBackButtonHidden(true)
        } // ZStack
    }
    


#Preview {
    FormView()
}
