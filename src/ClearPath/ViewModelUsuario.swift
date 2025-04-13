//
//  ViewModel.swift
//  ClearPath
//
//  Created by Turma01-20 on 04/04/25.
//

import Foundation


class ViewModelUsuario: ObservableObject { // Conforma com ObservableObject para ser reativo no SwiftUI
    
    // @Published: Notifica a interface do SwiftUI sempre que o array de personagens for atualizado
    @Published var usuario: [Usuario] = []
    @Published var usuarioPerfil: [UsuarioPerfil] = []
    
    // Função responsável por buscar os personagens da API
    func fetch() {
        
        // Define a URL da API que retorna personagens da casa Grifinória
        guard let url = URL(string: "http://192.168.128.25:1880/usuarioGet") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Usuario].self, from: data)
                
                DispatchQueue.main.async {
                    self?.usuario = parsed
                }
            } catch {
                
                print(error)
            }
        }
        
        // Inicia a requisição HTTP
        task.resume()
    }
    
    func fetchPerfil() {
        
        // Define a URL da API que retorna personagens da casa Grifinória
        guard let url = URL(string: "http://192.168.128.25:1880/usuarioGet") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([UsuarioPerfil].self, from: data)
                
                DispatchQueue.main.async {
                    self?.usuarioPerfil = parsed
                }
            } catch {
                
                print(error)
            }
        }
        
        // Inicia a requisição HTTP
        task.resume()
    }
    
}

// O update estava funcionando pelo Postman, mas dentro da aplicação não estava funcionando

//    func atualizarStreak(idUsuario: String,
//                         _id: String,
//                         _rev: String,
//                         completion: @escaping (Bool) -> Void) {
//        guard let usuario = usuario.first(where: { $0.id == idUsuario }) else {
//            alertMessage = "Usuário não encontrado"
//            completion(false)
//            return
//        }
//        
//        isLoading = true
//        
//        let novoStreak = (usuario.streakAtual ?? 0) + 1
//        let maiorStreak = max(usuario.maiorStreak ?? 0, novoStreak)
//        
//        let body: [String: Any] = [
//            "_id": _id,
//            "_rev": _rev,
//            "metaCigarros": usuario.metaCigarros ?? "",
//            "id": "1",
//            "posAtual": usuario.posAtual ?? "",
//            "nascimento": "20/03/2000",
//            "metaUsuario": usuario.metaUsuario ?? "",
//            "melhorPos": usuario.melhorPos ?? "",
//            "comentarios": [],
//            "streakAtual": novoStreak,
//            "maiorStreak": maiorStreak,
//            "nome": usuario.nome ?? "",
//            "cigarrosDia": usuario.cigarrosDia ?? "",
//            "valorPacote": usuario.valorPacote ?? "",
//            "pontosAdquiridos": usuario.pontosAdquiridos ?? "",
//            "amigos": []
//        ]
//        
//        guard let url = URL(string: "http://192.168.128.25:1880/usuarioUpdate") else {
//            alertMessage = "URL inválida"
//            isLoading = false
//            completion(false)
//            return
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: body)
//        } catch {
//            alertMessage = "Erro ao criar JSON: \(error)"
//            isLoading = false
//            completion(false)
//            return
//        }
//        
//        URLSession.shared.dataTask(with: request) { [weak self] _, response, error in
//            guard let self = self else { return }
//            
//            DispatchQueue.main.async {
//                self.isLoading = false
//                
//                if let error = error {
//                    self.alertMessage = "Erro: \(error.localizedDescription)"
//                    completion(false)
//                    return
//                }
//                
//                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
//                    self.fetch()
//                    completion(true)
//                } else {
//                    self.alertMessage = "Erro no servidor"
//                    completion(false)
//                }
//            }
//        }.resume()
//    }
//}
