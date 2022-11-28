//
//  TableViewCellViewModelType.swift
//  XOneTT
//
//  Created by MacMini on 24.11.22.
//

import UIKit

protocol TableViewCellViewModelType: AnyObject {
    var dayWeek: String { get }
    var image: UIImage { get }
    var maxTmpr: String { get }
    var minTmpr: String { get }
}
