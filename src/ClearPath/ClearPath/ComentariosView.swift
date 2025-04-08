
import SwiftUI

struct ComentariosView: View {
    @StateObject var viewModelGrupo = ViewModelGrupo()
    @State var texto = ""
    @State var isLoading = false
    @State var showAlert = false
    @State var alertMessage = ""
    
    var body: some View {
        ZStack {
            Color.verdeFundo
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                // VStack com o campo de texto
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
                    Button(action: {
                        enviarMensagem()
                    }) {
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
                    ForEach(viewModelGrupo.grupo, id: \.id) { grupo in
                        ForEach(grupo.usuarios ?? [], id: \.id) { usuario in
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
                                        if let textoComentario = comentario.comentario {
                                            Text(textoComentario)
                                                .foregroundColor(.black)
                                                .font(.system(size: 15))
                                                .fixedSize(horizontal: false, vertical: true)
                                        }
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
        }
        .alert("Mensagem", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
        .onAppear {
            viewModelGrupo.fetch()
        }
    }
    
    func enviarMensagem() {
        guard !texto.isEmpty else {
            return
        }
        
        isLoading = true
        
        // Usuário padrão (Carlos Eduardo)
        let usuarioId = "u003"
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let dataString = dateFormatter.string(from: currentDate)
        
        let novoComentario = [
            "usuarioId": usuarioId,
            "comentario": texto,
            "data": Int(dataString) ?? 20240401
        ] as [String : Any]
        
        guard let url = URL(string: "http://192.168.128.25:1880/grupoPost") else {
            alertMessage = "URL inválida"
            showAlert = true
            isLoading = false
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: novoComentario, options: [])
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
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    alertMessage = "Mensagem enviada com sucesso!"
                    showAlert = true
                    texto = ""
                    viewModelGrupo.fetch() // Atualiza a lista de mensagens
                } else {
                    alertMessage = "Erro ao enviar mensagem"
                    showAlert = true
                }
            }
        }
        
        task.resume()
    }
}

#Preview {
    ComentariosView()
}
