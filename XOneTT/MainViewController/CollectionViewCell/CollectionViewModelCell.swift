//
//  CollectionViewModelCell.swift
//  XOneTT
//
//  Created by MacMini on 24.11.22.
//

import UIKit

class CollectionViewModelCell: CollectionViewCellViewModelType {
    
    var tmpr: String
    var image: UIImage
    var time: String
    
    init(weather: WeatherPerDay) {
        if weather.timestamp == "16" {
            self.time = "Сейчас"
        } else {
            self.time = weather.timestamp
        }
        if weather.sunset ?? false {
            self.tmpr = "Заход солнца"
            self.image = UIImage(systemName: "sunset.fill")!.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        } else {
            self.image = APIManager.parseImage(code: weather.weatherType)
            self.tmpr = "\(weather.tmpr)°"
        }
    }
}
