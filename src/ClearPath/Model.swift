//
//  Model.swift
//  ClearPath
//
//  Created by Turma01-20 on 04/04/25.
//

import Foundation

struct Usuario: Codable, Identifiable{
    
    let nome: String?
    let id: String?
    let nascimento: String?
    let tempoFumado: String?
    let valorPacote: String?
    let cigarrosDia: String?
    var maiorStreak: Int?
    var streakAtual: Int?
    let pontosAdquiridos: Int?
    let fotoPerfil: String?
    let amigos: [String]?
    let comentarios: [Comentarios]?
    let posAtual: Int?
    let melhorPos: Int?
    let metaCigarros: Int?
    let metaUsuario: Int?
}

struct UsuarioPerfil: Codable, Identifiable{
    
    let nome: String?
    let id: String?
    let nascimento: String?
    let tempoFumado: String?
    let valorPacote: String?
    let cigarrosDia: String?
    var maiorStreak: Int?
    var streakAtual: Int?
    let pontosAdquiridos: Int?
    let fotoPerfil: String?
    let amigos: [String]?
    let comentarios: [String]?
    let posAtual: Int?
    let melhorPos: Int?
    let metaCigarros: Int?
    let metaUsuario: Int?
}

struct Grupo: Decodable, Identifiable{
    let id: String?
    let usuarios: [Usuario]?
    let nome: String?
    let quantidade: Int?
}

struct Comentarios: Codable, Hashable {
    let data: Int?
    let comentario: String? //[Usuario]
}
//struct Comentarios2: Codable, Hashable {
//    let data: Int?
//    let comentario: String?
//}
