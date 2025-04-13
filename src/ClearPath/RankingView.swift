//
//  RankingView.swift
//  ClearPath
//
//  Created by Turma01-27 on 07/04/25.
//

import SwiftUI

struct RankingView: View {
    @StateObject var viewModelUsuario = ViewModelUsuario()
    @StateObject var viewModelGrupo = ViewModelGrupo()
    @State var grupoAtual: Grupo?
    @State var usuariosSorted: [Usuario]?

    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.cinza
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ScrollView {
                VStack{
                    VStack {
                        ForEach(viewModelGrupo.grupo) {grupo in
                            if(grupo.id == "g002") {
                                Text("\(grupo.nome!)")
                                    .font(.system(size:22))
                                    .fontWeight(.heavy)
                            }
                        }
                        
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
                                    Text("7 Dias limpo(a)")
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

                    if let grupoSelecionado = viewModelGrupo.grupo.first(where: { $0.nome == "Equipe Superação" }),
                       let usuarios = grupoSelecionado.usuarios {

                        let usuariosOrdenados = usuarios.sorted {
                            ($0.pontosAdquiridos ?? 0) > ($1.pontosAdquiridos ?? 0)
                        }

                        let top3 = Array(usuariosOrdenados.prefix(3))

                        HStack {
                            // Segundo lugar - Esquerda
                            if top3.indices.contains(1) {
                                let usuario = top3[1]
                                VStack {
                                    Image("segundo")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .padding(.top, 5)
                                    Text(usuario.nome ?? "Sem nome")
                                        .font(.system(size: 15))
                                        .padding(.top, 5)
                                    Text("\(usuario.streakAtual ?? 0) dias")
                                        .padding(.top)
                                        .padding(.bottom, 5)
                                        .font(.system(size: 15))
                                }
                                .multilineTextAlignment(.center)
                                .frame(width: 100, height: 160)
                                .background(.white)
                                .cornerRadius(8)
                                .shadow(radius: 6)
                            }

                            Spacer()

                            // Primeiro lugar - Centro
                            if top3.indices.contains(0) {
                                let usuario = top3[0]
                                VStack {
                                    Image("primeiro")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .padding(.bottom, 15)
                                    Text(usuario.nome ?? "Sem nome")
                                    Text("\(usuario.streakAtual ?? 0) dias")
                                        .padding(.top)
                                }
                                .multilineTextAlignment(.center)
                                .frame(width: 120, height: 190)
                                .background(.white)
                                .cornerRadius(8)
                                .shadow(radius: 6)
                            }

                            Spacer()

                            // Terceiro lugar - Direita
                            if top3.indices.contains(2) {
                                let usuario = top3[2]
                                VStack {
                                    Image("terceiro")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .padding(.top, 5)
                                    Text(usuario.nome ?? "Sem nome")
                                        .padding(.top, 5)
                                    Text("\(usuario.streakAtual ?? 0) dias")
                                        .padding(.top)
                                        .padding(.bottom, 5)
                                }
                                .multilineTextAlignment(.center)
                                .frame(width: 100, height: 160)
                                .background(.white)
                                .cornerRadius(8)
                                .shadow(radius: 6)
                            }
                        }
                        .frame(width: 350)
                        .padding(2)
                        .fontWeight(.semibold)
                        .padding(.top, 15)
                    }

                        VStack() {
                            Text("Classificação completa")
                                 .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                 .font(.system(size: 24))
                                 .padding(.top, 10)
                            if let grupoSelecionado = viewModelGrupo.grupo.first(where: { $0.nome == "Equipe Superação" }),
                               let usuarios = grupoSelecionado.usuarios {
                                
                                let usuariosOrdenados = usuarios.sorted {
                                    ($0.pontosAdquiridos ?? 0) > ($1.pontosAdquiridos ?? 0)
                                }

                                ForEach(Array(usuariosOrdenados.enumerated()), id: \.element.id) { index, usuario in
                                    HStack {
                                        Text("#\(index + 1)")
                                            .frame(width: 40,height: 40)
                                            .background(.cinza)
                                            .cornerRadius(5)
                                        Image(usuario.fotoPerfil!)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 39, height: 39)
                                        VStack(alignment: .leading){
                                            Text(usuario.nome!)
                                                .fontWeight(.semibold)
                                                .offset(y:3)
                                            Text(usuario.tempoFumado!)
                                                .fontWeight(.ultraLight)
                                                .font(.system(size: 15))
                                                .offset(y: -2)
                                        }
                                        Spacer()
                                        VStack {
                                            Text("\(usuario.streakAtual ?? 0)")
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
                                Spacer()
                            }
                            

                            
                        }
                        .frame(width: 350)
                        .background(.white)
                        .cornerRadius(8)
                        .shadow(radius: 6)

            }
            
            }
            
        }
        .onAppear{ viewModelGrupo.fetch() }
        .onAppear {viewModelUsuario.fetch()}
    }
}

#Preview {
    RankingView()
}
