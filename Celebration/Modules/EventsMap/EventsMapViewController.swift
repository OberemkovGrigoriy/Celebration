//
//  EventsMapViewController.swift
//  Celebration
//
//  Created by Gregory Oberemkov on 05/05/2019.
//  Copyright © 2019 Gregory Oberemkov. All rights reserved.
//

import GoogleMaps
import UIKit

final class EventsMapViewController: UIViewController {
    
    // MARK: - Nested Types
    
    
    // MARK: - Properties
    
    private let eventsStorage = WEventsLocalJsonServiceImp.shared
    private var markers: [String: GMSMarker] = [:]
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureInterface()
        
    }
    
    // MARK: - Configure interface
    
    private func configureInterface() {
        
        configureMap()
    }
    
    
    private func configureMap() {
        
        let map = GMSMapView.initial(delegate: self)
        view = map
        
        if let styleURL = Bundle.main.url(forResource: "MapConfiguration", withExtension: "json") {
            map.mapStyle = try! GMSMapStyle(contentsOfFileURL: styleURL)
        }
        
//        eventsStorage.worldEvents.forEach { event in
//            
//            guard let initialLocation = event.zoomLocations[2] else { return }
//            let marker = GMSMarker(with: initialLocation, map: map)
//            markers[event.name] = marker
//        }
        
    }
    
}


// MARK: - GMSMapViewDelegate
extension EventsMapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        
        print("POSITION \(position.zoom)")
//        if position.zoom > 2.3 && position.zoom < 2.32 {
//
//            for key in CountryKey.allCases {
//                guard let event = eventsStorage.worldEvent(for: key) else { continue }
//                guard let marker = markers[event.name] else { continue }
//                guard let locationOnZoom5 = event.zoomLocations[5] else { return }
//                marker.position = CLLocationCoordinate2D(latitude: locationOnZoom5.latitude,
//                                                         longitude: locationOnZoom5.longitude)
//            }
//
//        }
        
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print(coordinate)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        return true
    }
    
}
