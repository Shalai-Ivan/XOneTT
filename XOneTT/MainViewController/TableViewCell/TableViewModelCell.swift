//
//  TableViewModelCell.swift
//  XOneTT
//
//  Created by MacMini on 24.11.22.
//

import UIKit

class TableViewModelCell: TableViewCellViewModelType {
    
    var dayWeek: String
    var image: UIImage
    var maxTmpr: String
    var minTmpr: String
    
    init(forecast: Forecast) {
        self.dayWeek = String(TableViewModelCell.getWeekDay(dateString: forecast.date))
        self.image = APIManager.parseImage(code: forecast.weatherType)
        self.maxTmpr = "\(forecast.maxTmpr)°"
        self.minTmpr = "\(forecast.minTmpr)°"
    }
    
    static func getWeekDay(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.mm.yyyy"
        let date = dateFormatter.date(from: dateString)
        guard Calendar.current.component(.day, from: date!) != Calendar.current.component(.day, from: Date()) else { return "Сегодня" }
        let dayWeek = Calendar.current.component(.weekday, from: date!)
        switch dayWeek {
        case 1:
            return "Вс"
        case 2:
            return "Пн"
        case 3:
            return "Вт"
        case 4:
            return "Ср"
        case 5:
            return "Чт"
        case 6:
            return "Пт"
        default:
            return "Сб"
        }
    }
}
