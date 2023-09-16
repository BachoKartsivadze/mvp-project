//
//  DisplayView.swift
//  mvp-project
//
//  Created by bacho kartsivadze on 15.09.23.
//

import UIKit

class DisplayView: UIView {
    
    let label = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "_"
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue.withAlphaComponent(0.25)
        addSubview(label)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with nameModel: NameModel) {
        label.text = nameModel.name
        if nameModel.liked {
            backgroundColor = .systemBlue
        } else {
            backgroundColor = .blue.withAlphaComponent(0.25)
        }
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
