//
//  MainViewModel.swift
//  XOneTT
//
//  Created by MacMini on 24.11.22.
//

import Foundation

class MainViewModel {
    
    let apiManager = APIManager()
    var weatherModel: WeatherModel?
    
    func fetchData(completion: @escaping (WeatherModel) -> Void) {
        apiManager.loadJson { [weak self] weatherModel in
            self?.weatherModel = weatherModel
            completion(weatherModel)
        }
    }
}

extension MainViewModel: CollectionViewViewModelType {
    func getCollectionCount() -> Int {
        return weatherModel?.weatherPerDay.count ?? 0
    }
    
    func getCollectionCellModel(forIndexPath indexPath: IndexPath) -> CollectionViewCellViewModelType? {
        guard let weatherModel = weatherModel else { return nil }
        let weatherPerDay = weatherModel.weatherPerDay[indexPath.row]
        return CollectionViewModelCell(weather: weatherPerDay)
    }
}

extension MainViewModel: TableViewViewModelType {
    
    func getTableCount() -> Int {
        return weatherModel?.forecast.count ?? 0
    }
    func getTableCellModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        guard let weatherModel = weatherModel else { return nil }
        let forecast = weatherModel.forecast[indexPath.row]
        return TableViewModelCell(forecast: forecast)
    }
}

