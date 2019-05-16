//
//  WEvent.swift
//  Celebration
//
//  Created by Eugene on 12/05/2019.
//  Copyright © 2019 Gregory Oberemkov. All rights reserved.
//

struct WEvent: Codable {
    
    let country: String
    let zoomLocations: [Int: EventLocation]
    
    enum CodingKeys: String, CodingKey {
        case country
        case zoomLocations = "ZoomLocations"
    }
}
