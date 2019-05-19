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
        
        eventsStorage.worldEvents.forEach { event in
            guard let marker = GMSMarker(with: event, map: map) else { return }
            markers[event.country] = marker
        }
        
    }
    
}


// MARK: - GMSMapViewDelegate
extension EventsMapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        
        
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print(coordinate)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let controller = EventsViewController()
        let eventsViewModel = EventsViewModel(elements: ["wef", "wef", "wfe", "wfe"])
        controller.viewModel = eventsViewModel
        present(controller, animated: true)
        return true
    }
    
}
