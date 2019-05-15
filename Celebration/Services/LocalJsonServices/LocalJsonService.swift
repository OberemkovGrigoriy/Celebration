//
//  PlistsService.swift
//  Celebration
//
//  Created by Eugene on 09/05/2019.
//  Copyright © 2019 Gregory Oberemkov. All rights reserved.
//

import Foundation

protocol LocalJsonService {
    
    associatedtype Value: Codable
    
    var fileName: String { get }
    func getContent() -> Result<Value, LocalJsonServiceError>
}

// MARK: - Default implementation
extension LocalJsonService {
    
    func getContent() -> Result<Value, LocalJsonServiceError> {
        
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: ".json") else {
            return .failure(.fileNotFound)
        }
        
        guard let fileData = FileManager.default.contents(atPath: filePath) else {
            return .failure(.dataNotExists)
        }
        
        guard let value = try? JSONDecoder().decode(Value.self, from: fileData) else {
            return .failure(.decodingError)
        }
        
        return .success(value)
    }
    
}
