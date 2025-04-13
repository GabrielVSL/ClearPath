import SwiftUI

struct ComentariosView: View {
    @StateObject var viewModel = ViewModelComentario()
    @State private var texto = ""
    @State private var isLoading = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            Color.verdeFundo
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                // Campo de texto e botão
                VStack(alignment: .leading, spacing: 10) {
                    Text("Comunidade")
                        .foregroundStyle(Color.verdeClaro)
                        .font(.system(size: 22))
                        .fontWeight(.heavy)
                    
                    Text("Escreva sua mensagem:")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                    
                    TextEditor(text: $texto)
                        .scrollContentBackground(.hidden)
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .frame(height: 88)
                        .padding(8)
                        .background(Color.cinza)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    // Botão de enviar
                    Button(action: enviarComentario) {
                        if isLoading {
                            ProgressView()
                                .frame(width: 290, height: 55)
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            Text("Enviar Mensagem")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                    }
                    .background(Color.verde)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .disabled(texto.isEmpty || isLoading)
                    .opacity(texto.isEmpty ? 0.6 : 1.0)
                }
                .padding(.all, 20)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 6)
                .frame(maxWidth: 330)
                .padding(.horizontal, 10)
                
                // Lista de mensagens
                VStack {
                    ForEach(viewModel.usuario) { usuario in
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 10) {
                                Image("1")
                                    .resizable()
                                    .frame(width: 38, height: 38)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    if let nome = usuario.nome {
                                        Text(nome)
                                            .foregroundStyle(Color.black)
                                            .font(.system(size: 18))
                                            .fontWeight(.heavy)
                                    }
                                    
                                    if let nascimentoStr = usuario.nascimento {
                                        let partes = nascimentoStr.components(separatedBy: "-")
                                        if partes.count == 3,
                                           let ano = Int(partes[0]),
                                           let mes = Int(partes[1]),
                                           let dia = Int(partes[2]),
                                           let nascimentoDate = Calendar.current.date(from: DateComponents(year: ano, month: mes, day: dia)) {
                                            
                                            let idade = Calendar.current.dateComponents([.year], from: nascimentoDate, to: Date()).year ?? 0
                                            Text("\(idade) anos")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    }
                                }
                                
                                Spacer()
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(usuario.comentarios ?? [], id: \.self) { comentario in
                                    Text(comentario.comentario ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15))
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                        .padding(.all, 20)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 6)
                        .frame(maxWidth: 330)
                        .padding(.horizontal, 10)
                    }
                }
            }
        }
        .alert("Sucesso", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
        .onAppear {
            viewModel.fetch()
        }
    }
    
    private func enviarComentario() {
        guard !texto.isEmpty else { return }
        
        isLoading = true
        
        let novoComentario = Comentarios(
            data: Int(Date().timeIntervalSince1970),
            comentario: texto
        )
        
        let usuarioTemp = Usuario(
            nome: "Carlos Eduardo",
            id: "u0033",
            nascimento: "1982-03-14",
            tempoFumado: "20 anos",
            valorPacote: "12.00",
            cigarrosDia: "30",
            maiorStreak: 21,
            streakAtual: 7,
            pontosAdquiridos: 150,
            fotoPerfil: "2",
            amigos: ["u004"],
            comentarios: [novoComentario],
            posAtual: nil,
            melhorPos: nil,
            metaCigarros: nil,
            metaUsuario: nil
        )
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            viewModel.post(usuarioTemp)
            viewModel.fetch()
            
            // Limpa e mostra alerta
            texto = ""
            isLoading = false
            alertMessage = "Mensagem enviada com sucesso!"
            showAlert = true
        }
    }
}

#Preview {
    ComentariosView()
}
