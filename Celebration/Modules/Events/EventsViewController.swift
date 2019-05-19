//
//  EventsViewController.swift
//  Celebration
//
//  Created by Gregory Oberemkov on 19/05/2019.
//  Copyright © 2019 Gregory Oberemkov. All rights reserved.
//

import UIKit

final class EventsViewController: UIViewController {
    
    private var collection: UICollectionView!
    var viewModel: EventsViewModel?
 
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumLineSpacing = 0
        collectionViewLayout.minimumInteritemSpacing = 0
        collection = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        
        collection.dataSource = self
        collection.delegate = self
        
        view.addSubview(collection)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collection.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collection.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collection.register(FourthEventsCollectionViewCell.self, forCellWithReuseIdentifier: "FourthEventsCollectionViewCell")
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension EventsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch viewModel!.collectionViewStyle {
        case .collection:
            let width = view.frame.width / 2
            let height = view.frame.height / 2
            let size = CGSize(width: width, height: height)
            return size
        case .table:
            let width = view.frame.width
            let height = view.frame.height / 3
            let size = CGSize(width: width, height: height)
            return size
        }
    }
}

// MARK: - UICollectionViewDelegate

extension EventsViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension EventsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FourthEventsCollectionViewCell", for: indexPath)
        return cell
    }
}
