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
}
