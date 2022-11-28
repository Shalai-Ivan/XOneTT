//
//  CollectionViewViewModelType.swift
//  XOneTT
//
//  Created by MacMini on 24.11.22.
//

import Foundation

protocol CollectionViewViewModelType {
    func getCollectionCount() -> Int
    func getCollectionCellModel(forIndexPath indexPath: IndexPath) -> CollectionViewCellViewModelType?
}
