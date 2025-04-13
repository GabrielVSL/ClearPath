//
//  NavegacaoView.swift
//  Perfil
//
//  Created by Turma01-17 on 09/04/25.
//

import SwiftUI

struct NavegacaoView: View {
    var body: some View {
        TabView{
            MainView()
                .tabItem {
                    Label("Início", systemImage: "house.fill")
                }
            PerfilView()
                .tabItem {
                    Label("Perfil", systemImage: "person.fill")
                }
        }
        .accentColor(.verdeClaro)
    }
}

#Preview {
    NavegacaoView()
}

// diaslimpos += cigarrosPorDia
