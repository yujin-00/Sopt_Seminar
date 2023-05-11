//
//  WeatherTableViewCell.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/05/12.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

import SnapKit
import Then

class WeatherTableViewCell: UITableViewCell {

    var data: WeatherResponse? {
        didSet {
            guard let data = data else { return }
            weatherImageView.getImageFromURL(data.weather[0].icon)
            placeLabel.text = data.name
            temperatureLabel.text = "현재온도 : " + data.main.temp.description  + "℃"
            humidityLabel.text = "습도 : " + data.main.humidity.description + "%"
        }
    }
    
    let weatherImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    let placeLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 25)
    }
    
    let temperatureLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12)
    }
    
    let humidityLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .white
    }
    
    func setLayout() {
        [weatherImageView, placeLabel, temperatureLabel, humidityLabel].forEach { addSubview($0) }
        
        weatherImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(100)
        }
        
        placeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(placeLabel.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        humidityLabel.snp.makeConstraints {
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
}
