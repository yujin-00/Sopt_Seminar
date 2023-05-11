//
//  WeatherViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/05/11.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit


class WeatherViewController: UIViewController {
    
    var weatherList: [WeatherResponse] = []
    
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        openWeather()
    }
    
    private func openWeather() {
//        WeatherService.shared.Weather(place: "gongju") { response in
//        switch response {
//        case .success(let data):
//            guard let data = data as? WeatherResponse else { return }
//            dump(data)
//        default:
//            return
//        }
//        }
        let cityName = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]

        cityName.forEach {
            WeatherService.shared.Weather(place: $0) { response in
                switch response{
                case .success(let data) :
                    guard let data = data as? WeatherResponse else { return }
                    self.weatherList.append(data)
                    print(self.weatherList.count)
                    if self.weatherList.count == 20 {
                        print(self.weatherList)
                    }
                default:
                    return
                }
            }
        }
    }
}
