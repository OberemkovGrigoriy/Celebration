//
//  GMSMarker+InitWithEvent.swift
//  Celebration
//
//  Created by Eugene on 05/05/2019.
//  Copyright © 2019 Gregory Oberemkov. All rights reserved.
//

import GoogleMaps

extension GMSMarker {
    
    convenience init?(with event: WEvent, map: GMSMapView? = nil) {
        
        guard let zoom2 = event.zoomLocations[2] else { return nil }
        let coordinate = CLLocationCoordinate2D(latitude: zoom2.latitude, longitude: zoom2.longitude)
        self.init(position: coordinate)
        self.title = event.country
        self.snippet = event.country
        self.map = map
    }
    
    @discardableResult
    convenience init(with eventLocation: EventLocation, map: GMSMapView? = nil) {
        
        let location = CLLocationCoordinate2D(latitude: eventLocation.latitude,
                                              longitude: eventLocation.longitude)
        self.init(position: location)
        self.iconView = TestIconView()
        self.map = map
    }
    
}

