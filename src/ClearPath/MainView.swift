//
//  MainView.swift
//  ClearPath
//
//  Created by Turma01-Backup on 04/04/25.
//

import SwiftUI

struct MainView: View {
    @State private var diasSemFumar: Int = 0
    @State private var cigarrosEvitados: Int = 0
    @State private var cigarrosFumadosPorDia: Double = 0
    
    @StateObject var viewModel = ViewModelUsuario()
    
    private func registrarDiaLimpo() {
        diasSemFumar += 1
        registrarCigarrosEvitados()
    }
    private func registrarCigarrosEvitados() {
        
        for usuario in viewModel.usuarioPerfil {
            cigarrosFumadosPorDia = Double(usuario.cigarrosDia!) ?? 0
            cigarrosEvitados += Int(cigarrosFumadosPorDia)
        }
//        ForEach(viewModel.usuario, id: \.id) { usuario in
////            if var cigarrosDia = usuario.cigarrosDia {
//            cigarrosFumadosPorDia = Double(usuario.cigarrosDia!) ?? 0
//                cigarrosEvitados += Int(cigarrosFumadosPorDia)
////            }
//        }
    }

    
//    private func
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.verdeFundo
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack {
                        VStack {
                            HStack {
                                Text("Meu progresso")
                                    .foregroundStyle(Color.verde)
                                    .font(.system(size: 25))
                                    .padding(.horizontal, 20)
                                    .fontWeight(.heavy)
                                
                                Spacer()
                            } // HStack
                            .padding(.bottom, 1)
                            
                            HStack {
                                VStack {
                                    Text("\(diasSemFumar)")
                                        .font(.system(size: 45))
                                        .foregroundStyle(Color.verde)
                                        .fontWeight(.heavy)
                                    
                                    Text("dias limpos")
                                        .foregroundStyle(Color.verde)
                                        .font(.system(size: 15))
                                }
                                
                                VStack {
                                    Text ("Melhor sequencia: 23 dias")
                                        .foregroundStyle(Color.verde)
                                        .font(.system(size: 14, weight: .light))
                                }
                                .frame(height: 20)
                                .padding(.horizontal)
                                .background(Color.cinza)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                            } //HStack
                            
                        } //Vstack - Meu progresso
                        .frame(width: 330, height: 140)
                        .background(Color.white)
                        .cornerRadius(17)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 2)
                        .shadow(radius: 6)
                        
                        NavigationLink(destination: RankingView()){
                            VStack {
                                HStack {
                                    
                                    
                                    Text("Grupo")
                                        .foregroundStyle(Color.white)
                                        .font(.system(size: 22))
                                        .padding(.horizontal, 20)
                                        .fontWeight(.heavy)
                                        .offset(x: 16)
                                    
                                    Image(systemName: "person.3.fill")
                                        .foregroundStyle(Color.white)
                                        .padding(.horizontal)
                                        .fontWeight(.heavy)
                                        .offset(x: -21)
                                        .offset(y: 2)
                                    
                                } // HStack
                                
                            } //Vstack - Grupo
                            .frame(width: 330, height: 50)
                            .background(Color.verdeClaro)
                            .cornerRadius(17)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 2)
                            .shadow(radius: 6)
                        }
                        
                        VStack {
                            HStack {
                                
                                Image("trofeu")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundStyle(Color.white)
                                    .padding(.horizontal)
                                    .fontWeight(.heavy)
                                
                                Text("Sua saúde agradece cada hora sem cigarro!")
                                    .foregroundStyle(Color.black)
                                    .font(.system(size: 17))
                                
                                Spacer()
                                
                            } // HStack
                            
                        } //Vstack - Mensagem motivacional
                        .frame(width: 330, height: 95)
                        .background(Color.white)
                        .cornerRadius(17)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 2)
                        .shadow(radius: 6)
                        
                        VStack {
                            HStack {
                                Text("Conquistas")
                                    .foregroundStyle(Color.black)
                                    .font(.system(size: 25))
                                    .padding(.horizontal, 20)
                                    .fontWeight(.heavy)
                                    .padding(.top, 10)
                                
                                Spacer()
                            } // HStack
                            .padding(.bottom, 1)
                            
                            HStack{
                                Text("cigarros evitados")
                                    .foregroundStyle(Color.verdeClaro)
                                Spacer()
                                
                                Text("\(cigarrosEvitados)")
                                    .foregroundStyle(Color.verdeClaro)
                                    .font(.system(size: 15))
                                    .offset(y: 2)
                            } //HStack
                            .padding(.horizontal, 20)
                            .padding(.top, 6)
                            
                            ZStack {
                                
                                Rectangle()
                                    .foregroundStyle(Color.cinza)
                                    .frame(width: 290,height: 12)
                                    .cornerRadius(10)
                                HStack {
                                    Rectangle()
                                        .foregroundStyle(Color.verdeClaro)
                                        .frame(width: CGFloat(cigarrosEvitados), height: 12)
                                        .cornerRadius(10)
                                    Spacer()
                                }
                                .padding(.horizontal, 20)
                            } //ZStack
                            
                            HStack{
                                Text("Meta: 290 cigarros evitados")
                                    .foregroundStyle(Color.black)
                                    .fontWeight(.thin)
                                    .font(.system(size: 15))
                                Spacer()
                            } //HStack
                            .padding(.horizontal, 20)
                            
                            VStack {
                                HStack {
                                    Image("dinheiro")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .padding()
                                    
                                    VStack{
                                        Text("Economizado")
                                            .fontWeight(.heavy)
                                            .font(.system(size: 20))
                                            .foregroundStyle(Color.cinzaEscuro)
                                            .padding(.top, 15)
                                        
                                        ForEach(Array(viewModel.usuarioPerfil.prefix(1)), id: \.id) { usuario in
                                            let valorPacote = Double(usuario.valorPacote!) ?? 0.0
                                            let cigarrosDia = usuario.cigarrosDia!
                                            let valorCigarro = valorPacote / 20
                                            
                                            let economiaMensal = Double(cigarrosDia)! * valorCigarro * 30
                                            
                                            Text("R$ \(String(format: "%.2f", economiaMensal))")
                                                .foregroundStyle(.verdeClaro)
                                                .bold()
                                        }
                                    }
                                    .padding(.bottom, 17)
                                    .padding()
                                    
                                }
                            }
                            .frame(width: 300, height: 100)
                            .background(Color.cinza)
                            .cornerRadius(17)
                            
                        } //Vstack - Conquistas
                        .frame(width: 330, height: 260)
                        .background(Color.white)
                        .cornerRadius(17)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 2)
                        .shadow(radius: 6)
                        
                        VStack {
                            HStack {
                                Button(action: {
                                    registrarDiaLimpo()
                                }) {
                                    Text("Registrar dia Limpo")
                                        .foregroundStyle(Color.white)
                                        .font(.system(size: 20))
                                        .padding(.horizontal, 20)
                                        .fontWeight(.heavy)
                                        .offset(x: 16)
                                }
                                
                                Image(systemName: "checkmark")
                                    .foregroundStyle(Color.white)
                                    .padding(.horizontal)
                                    .fontWeight(.heavy)
                                    .offset(x: -21)
                                
                            } // HStack
                            
                        } //Vstack - Registrar dia Limpo
                        .frame(width: 330, height: 50)
                        .background(Color.verdeClaro)
                        .cornerRadius(17)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 2)
                        .shadow(radius: 6)
                        NavigationLink(destination: ComentariosView()) {
                            VStack {
                                HStack {
                                    
                                    
                                    Text("Comunidade")
                                        .foregroundStyle(Color.white)
                                        .font(.system(size: 20))
                                        .padding(.horizontal, 20)
                                        .fontWeight(.heavy)
                                        .offset(x: 16)
                                    
                                    Image(systemName: "person")
                                        .foregroundStyle(Color.white)
                                        .padding(.horizontal)
                                        .fontWeight(.heavy)
                                        .offset(x: -21)
                                    
                                } // HStack
                                
                            } //Vstack - Comunidade
                            .frame(width: 330, height: 50)
                            .background(Color.verde)
                            .cornerRadius(17)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 2)
                            .shadow(radius: 6)
                        } //Navigationstack
                        NavigationLink(destination: DicasView()){
                            VStack {
                                HStack {
                                    
                                    
                                    Text("Dicas Diárias")
                                        .foregroundStyle(Color.white)
                                        .font(.system(size: 20))
                                        .padding(.horizontal, 20)
                                        .fontWeight(.heavy)
                                        .offset(x: 16)
                                    
                                    Image("calendario")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                        .foregroundStyle(Color.white)
                                        .padding(.horizontal)
                                        .fontWeight(.heavy)
                                        .offset(x: -21)
                                    
                                } // HStack
                                
                            } //Vstack - Dicas Diarias
                            .frame(width: 330, height: 50)
                            .background(Color.verdeEscuro)
                            .cornerRadius(17)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 2)
                            .shadow(radius: 6)
                        }
                    } // VStack
                } // ScrollView
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear(){
            viewModel.fetchPerfil()
        }
    }
}

#Preview {
    MainView()
}
