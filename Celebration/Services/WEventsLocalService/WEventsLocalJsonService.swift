//
//  CountriesPlistService.swift
//  Celebration
//
//  Created by Eugene on 09/05/2019.
//  Copyright © 2019 Gregory Oberemkov. All rights reserved.
//

import GoogleMaps

protocol WEventsLocalJsonService {
    var worldEvents: [WEvent] { get }
    func worldEvent(for key: CountryKey) -> WEvent?
}


final class WEventsLocalJsonServiceImp: LocalJsonService {
    
    // MARK: - LocalJsonService
    
    typealias Value = [String: WEvent]
    let fileName: String = "WorldEvents"

    // MARK: - Nested types
    

    
    // MARK: - Properties
    
    static let shared = WEventsLocalJsonServiceImp()
    private var eventsJson: Value = [:]
    
    // MARK: - Init
    
    private init() {
        
        let content = getContent()
        
        switch content {
        case .success(let events):
            eventsJson = events
            
        case .failure(let error):
            print(error)
            assertionFailure()
        }
        
    }
    
}


// MARK: - CountriesLocalJsonService
extension WEventsLocalJsonServiceImp: WEventsLocalJsonService {
    
    var worldEvents: [WEvent] {
        return Array(eventsJson.values)
    }
    
    func worldEvent(for key: CountryKey) -> WEvent? {
        return eventsJson[key.rawValue]
    }
    
}
