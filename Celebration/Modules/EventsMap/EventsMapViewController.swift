//
//  EventsMapViewController.swift
//  Celebration
//
//  Created by Gregory Oberemkov on 05/05/2019.
//  Copyright © 2019 Gregory Oberemkov. All rights reserved.
//

import FloatingPanel
import GoogleMaps
import UIKit

final class EventsMapViewController: UIViewController {
    
    // MARK: - Properties
    
    var fpc: FloatingPanelController!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fpc = FloatingPanelController()
        fpc.set(contentViewController: UIViewController())
        
        fpc.view.frame = view.frame
        fpc.addPanel(toParent: self)
        
//        view.addSubview(fpc.view)
        
        configureInterface()
    }
    
    // MARK: - Configure interface
    
    private func configureInterface() {
        
        let map = GMSMapView.initial(delegate: self)
        view = map
        
        let mark1 = GMSMarker(with: MockConstants.events[0], map: map)
        let mark2 = GMSMarker(with: MockConstants.events[1], map: map)
    }
    
}


// MARK: - GMSMapViewDelegate
extension EventsMapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        print(position)
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print(coordinate)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print(marker.snippet)
        return true
    }
    
}
