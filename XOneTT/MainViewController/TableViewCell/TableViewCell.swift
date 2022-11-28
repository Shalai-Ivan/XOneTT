//
//  TableViewCell.swift
//  XOneTT
//
//  Created by MacMini on 23.11.22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet private weak var dayWeekLabel: UILabel!
    @IBOutlet private weak var weatherImage: UIImageView!
    @IBOutlet private weak var maxTmpr: UILabel!
    @IBOutlet private weak var minTmpr: UILabel!
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            dayWeekLabel.text = viewModel.dayWeek
            weatherImage.image = viewModel.image
            maxTmpr.text = viewModel.maxTmpr
            minTmpr.text = viewModel.minTmpr
        }
    }
}
