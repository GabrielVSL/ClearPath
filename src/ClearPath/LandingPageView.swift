//
//  ContentView.swift
//  ClearPath
//
//  Created by Turma01-27 on 04/04/25.
//

import SwiftUI

struct LandingPageView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(.verdeFundo)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Image("imageSmoker")
                    .resizable()
                    .frame(width: 400 ,height: 450)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    Spacer()
                VStack {
                    VStack {
                        Text("Quer para de fumar?")
                            .foregroundColor(Color.cinza)
                            .fontWeight(.heavy)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Text("Dar o primeiro passo para uma vida sem cigarros é mais fácil do que você imagina. Com apoio, motivação e ferramentas personalizadas, você pode conquistar sua liberdade e melhorar sua saúde.")
                            .foregroundColor(.cinza)
                            .frame(width: 230)
                        Spacer()
                        NavigationLink(destination: FormView()) {
                            Text("Vamos começar essa jornada juntos!")
                                .frame(width: 250, height: 70)
                                .background(Color.verdeClaro)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .offset(y:-10)
                            }
                        }
                        
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    Spacer()
                    HStack {
                        VStack {
                            Image(systemName: "checkmark.square")
                                .padding(1.5)
                                .bold()
                            Image(systemName: "checkmark.square")
                                .padding(1.5)
                                .bold()
                            Image(systemName: "checkmark.square")
                                .padding(1.5)
                                .bold()
                            Image(systemName: "square")
                                .padding(1.5)
                                .bold()
                        }
                        .foregroundColor(.cinza)
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Motivação diária")
                                .padding(1)
                                .bold()
                            Text("Acompanhe sua evolução")
                                .padding(1)
                                .bold()
                            Text("Compare seu desempenho")
                                .padding(1)
                                .bold()
                            Text("Pare de fumar!")
                                .padding(1)
                                .bold()
                        }
                        .foregroundColor(.cinza)
                        Spacer()
                    }
                    .padding(60)
                }
            }
        }
    }
}

#Preview {
    LandingPageView()
}
