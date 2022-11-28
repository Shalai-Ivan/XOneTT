//
//  TableViewViewModelType.swift
//  XOneTT
//
//  Created by MacMini on 24.11.22.
//

import Foundation

protocol TableViewViewModelType {
    func getTableCount() -> Int
    func getTableCellModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
}
