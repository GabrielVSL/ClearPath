//
//  Model.swift
//  ClearPath
//
//  Created by Turma01-20 on 04/04/25.
//

import Foundation

struct Usuario: Decodable, Identifiable{
    let nome: String?
    let id: String?
    let nascimento: String?
    let tempoFumado: String?
    let valorPacote: Double?
    let cigarrosDia: Int?
    let maiorStreak: Int?
    let streakAtual: Int?
    let pontosAdquiridos: Int?
    let fotoPerfil: String?
    let amigos: [String]?
    let comentarios: [Comentarios]?
    let posAtual: Int?
    let melhorPos: Int?
    let metaCigarros: Int?
    let metaUsuario: Int?
//  let grupo: String?
}

struct Grupo: Decodable, Identifiable{
    let id: String?
    let usuarios: [Usuario]?
    let nome: String?
    let quantidade: Int?
}

struct Comentarios: Decodable, Hashable {
    let data: Int?
    let comentario: String?
}
