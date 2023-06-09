//
//  Carrot.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/04/22.
//  Copyright © 2023 남유진. All rights reserved.
//

import Foundation
import UIKit

struct Carrot {
    let image: UIImage
    let product: String
    let place: String
    let time: String
    let tradeStatus: Trade
    let price: Int
}

extension Carrot {
    static func dummy() -> [Carrot] {
        return [Carrot(image: .hypeBoy,
                       product: "에어팟 프로 2",
                       place: "하계 2동",
                       time: "일주일 전",
                       tradeStatus: .completed,
                       price: 200000),
                Carrot(image: .hypeBoy,
                       product:
                        "아이폰 5",
                       place: "공릉 2동",
                       time: "4월 2일",
                       tradeStatus: .reservation,
                       price: 100000),
                Carrot(image: .hypeBoy,
                       product:
                        "아이폰 5",
                       place: "공릉 2동",
                       time: "1일 전",
                       tradeStatus: .shared,
                       price: 100000),
                Carrot(image: .hypeBoy,
                       product:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "6시간 전",
                       tradeStatus: .completed,
                       price: 100000),
                Carrot(image: .hypeBoy,
                       product:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "3시간 전",
                       tradeStatus: .clear,
                       price: 100000)
                ,
                Carrot(image: .hypeBoy,
                       product:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "4월 3일",
                       tradeStatus: .completed,
                       price: 100000)
                ,
                Carrot(image: .hypeBoy,
                       product:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "3월 31일",
                       tradeStatus: .reservation,
                       price: 1000)]
    }
}

@frozen
enum Trade {
    case reservation
    case completed
    case shared
    case clear
    
    var title: String {
        switch self {
        case .reservation:
            return "예약중"
        case .completed:
            return "거래완료"
        case .shared:
            return "나눔완료"
        case .clear:
            return ""
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .reservation:
            return .systemGreen
        case .completed:
            return .black
        case .shared:
            return .gray
        case .clear:
            return .white
        }
    }
}
