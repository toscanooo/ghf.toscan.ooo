//
//  ErrorMessage.swift
//  ghf
//
//  Created by Marcelo Toscano Rodrigues on 10/03/21.
//

import Foundation


enum GFError: String, Error {
    case invalidURL         = "URL inválida."
    case InvalidConection   = "Algum problema com sua conexão."
    case invalidUserName    = "Não encontrei este usuário."
    case unableToComplete   = "Oooops não foi possivél completar a solicitação."
    case invalidResponse    = "Servidor não respondeu corretamente."
    case invalidData        = "Alguma coisa errado com a informação."
}
