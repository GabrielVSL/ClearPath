//
//  ViewModel.swift
//  ClearPath
//
//  Created by Turma01-20 on 04/04/25.
//

import Foundation


class ViewModelGrupo: ObservableObject {
    @Published var grupo: [Grupo] = []
    
    func fetch() {
        guard let url = URL(string: "http://192.168.128.25:1880/grupoGet") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print("Error fetching data:", error?.localizedDescription ?? "Unknown error")
                return
            }
            
            do {
                // Decodifica primeiro para um array de dicionários genéricos
                let jsonArray = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] ?? []
                
                // Filtra apenas os objetos que têm a estrutura de Grupo
                let validGroups = jsonArray.compactMap { dict -> Grupo? in
                    guard dict["id"] != nil else { return nil }
                    guard let groupData = try? JSONSerialization.data(withJSONObject: dict) else { return nil }
                    return try? JSONDecoder().decode(Grupo.self, from: groupData)
                }
                
                DispatchQueue.main.async {
                    self?.grupo = validGroups
                    print("Grupos carregados:", validGroups)
                }
            } catch {
                print("Decoding error:", error)
            }
        }
        
        task.resume()
    }
}
