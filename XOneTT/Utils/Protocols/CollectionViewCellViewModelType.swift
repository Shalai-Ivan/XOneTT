//
//  CollectionViewCellViewModelType.swift
//  XOneTT
//
//  Created by MacMini on 24.11.22.
//

import UIKit

protocol CollectionViewCellViewModelType: AnyObject {
    var tmpr: String { get }
    var image: UIImage { get }
    var time: String { get }
}
