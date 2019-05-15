//
//  GMSMarker+InitWithEvent.swift
//  Celebration
//
//  Created by Eugene on 05/05/2019.
//  Copyright © 2019 Gregory Oberemkov. All rights reserved.
//

import GoogleMaps

extension GMSMarker {
    
    convenience init(with event: Event, map: GMSMapView? = nil) {
        
        let coordinate = CLLocationCoordinate2D(latitude: event.latitude, longitude: event.longitude)
        self.init(position: coordinate)
//        self.title = event.title
//        self.snippet = event.description
//        self.icon = UIImage(named: event.icon ?? "pancacke")
        self.iconView = TestIconView()
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

