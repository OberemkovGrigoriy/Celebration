//
//  LocalJsonServiceError.swift
//  Celebration
//
//  Created by Eugene on 09/05/2019.
//  Copyright © 2019 Gregory Oberemkov. All rights reserved.
//

enum LocalJsonServiceError: Error {
    
    case fileNotFound
    case dataNotExists
    case decodingError
}
