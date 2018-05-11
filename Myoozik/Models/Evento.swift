//
//  Evento.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 04/04/18.
//  Copyright © 2018 Mussini SAS. All rights reserved.
//

import Foundation

struct Evento {
    let nome: String
    let artisti: [Artista]
    let luogo: Luogo
    let token: String
    let data: String
    let cover: URL?
}
