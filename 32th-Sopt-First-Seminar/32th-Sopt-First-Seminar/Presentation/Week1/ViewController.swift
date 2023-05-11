//
//  ViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/04/01.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "솝트에 오신 여러분 환영합니다!"
            return label
        }()

        override func viewDidLoad() {
            super.viewDidLoad()

            setStyle()
            setLayout()
        }
    }

    private extension ViewController {
        
        func setStyle() {
            
            view.backgroundColor = .white
        }
        
        func setLayout() {
            
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(nameLabel)
            
            NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                         nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)])
        }
}

