//
//  CollectionViewCell.swift
//  XOneTT
//
//  Created by MacMini on 24.11.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var weatherImage: UIImageView!
    @IBOutlet private weak var tmprLabel: UILabel!
    weak var viewModel: CollectionViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            timeLabel.text = viewModel.time
            weatherImage.image = viewModel.image
            tmprLabel.text = viewModel.tmpr
        }
    }
    
}
