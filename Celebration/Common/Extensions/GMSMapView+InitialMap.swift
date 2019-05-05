//
//  GMSMapView+InitialMap.swift
//  Celebration
//
//  Created by Eugene on 05/05/2019.
//  Copyright © 2019 Gregory Oberemkov. All rights reserved.
//

import GoogleMaps

extension GMSMapView {
    
    static func initial(delegate: GMSMapViewDelegate? = nil) -> GMSMapView {
        
        let camera = GMSCameraPosition.camera(withLatitude: 33.0, longitude: -79.0, zoom: 2)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.delegate = delegate
        
        return mapView
    }
    
}
