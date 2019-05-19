//
//  EventsViewModel.swift
//  Celebration
//
//  Created by Gregory Oberemkov on 19/05/2019.
//  Copyright © 2019 Gregory Oberemkov. All rights reserved.
//

import Foundation

final class EventsViewModel {
    
    // MARK: - Model
    
    enum EventsCollectionViewStyle {
        case table(elements: Int)
        case collection(elements: Int)
    }
    
    // MARK: - Private properties
    
    let collectionViewStyle: EventsCollectionViewStyle
    
    // MARK: - Initilize 
    
    init(elements: [String]) {
        collectionViewStyle = elements.count >= 4 ? .collection(elements: elements.count) : .table(elements: elements.count)
    }
}
