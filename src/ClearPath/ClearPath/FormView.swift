//
//  DicasView.swift
//  ClearPath
//
//  Created by Turma01-Backup on 04/04/25.
//

import SwiftUI

struct FormView: View {
    @State private var nome: String = ""
    @State private var nascimento: String = ""
    @State private var cigarrosDia: String = ""
    @State private var precoMedio: String = ""
    @State private var tempoFumante: String = ""
    @State var isLoading = false
    @State var showAlert = false
    @State var alertMessage = ""
    @State private var shouldNavigate = false
    
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
                            }
                            Text("Conte mais sobre seus hábitos para personalizarmos seu plano")
                                .foregroundStyle(Color.white)
                                .padding(.horizontal)
                            
                        }
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
                            }
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
                            }
                            VStack {
                                TextField(" ", text: $nascimento)
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
                            }
                            VStack {
                                TextField(" ", text: $cigarrosDia)
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
                            }
                            VStack {
                                TextField(" ", text: $precoMedio)
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
                            }
                            VStack {
                                TextField(" ", text: $tempoFumante)
                                    .foregroundStyle(Color.black)
                                    .padding(.horizontal, 10)
                                    .font(.system(size: 15))
                                    .bold()
                            }
                            .frame(width: 295, height: 30)
                            .background(Color.cinza)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.bottom)
                            
                        }
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
                            }
                            Text("- Seu gasto mensal com cigarros\n- Metas personalizadas de redução\n- Impacto na sua saúde")
                                .foregroundStyle(Color.white)
                                .padding(.horizontal)
                                .padding(.top, 1)
                                .font(.system(size: 15))
                                .bold()
                            
                        }
                        .frame(width: 330, height: 116)
                        .background(Color.verde)
                        .cornerRadius(17)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .shadow(radius: 6)
                        
                        Button(action: {
                            enviarDados()
                        }) {
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            } else {
                                VStack {
                                    HStack {
                                        Text("Salvar e Continuar")
                                            .foregroundColor(.white)
                                            .font(.system(size: 25))
                                            .padding(.horizontal, 20)
                                            .fontWeight(.heavy)
                                    }
                                }
                                .frame(width: 330, height: 50)
                                .background(Color.verdeClaro)
                                .cornerRadius(17)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .shadow(radius: 6)
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .alert("Atenção", isPresented: $showAlert) {
                Button("OK", role: .cancel) { shouldNavigate = true }
                
            } message: {
                Text(alertMessage)
            }
            
            NavigationLink(
                destination: MainView(),
                isActive: $shouldNavigate,
                label: { EmptyView() }
            )
        }
    }
    
    func enviarDados() {
        guard !nome.isEmpty else {
            alertMessage = "Por favor, preencha seu nome"
            showAlert = true
            return
        }
        
        guard !nascimento.isEmpty else {
            alertMessage = "Por favor, preencha sua data de nascimento"
            showAlert = true
            return
        }
        
        guard !cigarrosDia.isEmpty else {
            alertMessage = "Por favor, informe quantos cigarros fuma por dia"
            showAlert = true
            return
        }
        
        guard !precoMedio.isEmpty else {
            alertMessage = "Por favor, informe o preço médio do maço"
            showAlert = true
            return
        }
        
        guard !tempoFumante.isEmpty else {
            alertMessage = "Por favor, informe há quantos anos fuma"
            showAlert = true
            return
        }
        
        isLoading = true
        
        let novoUsuario: [String: Any] = [
            "nome": nome.trimmingCharacters(in: .whitespacesAndNewlines),
            "nascimento": nascimento.trimmingCharacters(in: .whitespacesAndNewlines),
            "cigarrosDia": cigarrosDia.trimmingCharacters(in: .whitespacesAndNewlines),
            "valorPacote": precoMedio.trimmingCharacters(in: .whitespacesAndNewlines),
            "tempoFumado": tempoFumante.trimmingCharacters(in: .whitespacesAndNewlines),
            "id": "",
            "maiorStreak": 0,
            "streakAtual": 0,
            "pontosAdquiridos": 0,
            "fotoPerfil": "",
            "amigos": [],
            "comentarios": [],
            "posAtual": 0,
            "melhorPos": 0,
            "metaCigarros": 0,
            "metaUsuario": 0
        ]
        
        guard let url = URL(string: "http://192.168.128.25:1880/usuarioPost") else {
            alertMessage = "URL inválida"
            showAlert = true
            isLoading = false
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: novoUsuario, options: [])
        } catch {
            alertMessage = "Erro ao criar o JSON: \(error.localizedDescription)"
            showAlert = true
            isLoading = false
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false
                
                if let error = error {
                    alertMessage = "Erro na requisição: \(error.localizedDescription)"
                    showAlert = true
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        nome = ""
                        nascimento = ""
                        cigarrosDia = ""
                        precoMedio = ""
                        tempoFumante = ""
                        
                        alertMessage = "Dados enviados com sucesso!"
                        showAlert = true
                        shouldNavigate = true
                    } else {
                        alertMessage = "Erro ao enviar dados (Status: \(httpResponse.statusCode))"
                        showAlert = true
                    }
                } else {
                    alertMessage = "Resposta inválida do servidor"
                    showAlert = true
                }
            }
        }
        
        task.resume()
    }
}

#Preview {
    FormView()
}
