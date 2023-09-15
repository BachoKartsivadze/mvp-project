//
//  MainViewTableViewHeaderFooterView.swift
//  mvp-project
//
//  Created by bacho kartsivadze on 14.09.23.
//

import UIKit

class MainViewTableViewHeaderFooterView: UITableViewHeaderFooterView {
    let identifier = "MainViewTableViewHeaderFooterView"

    let label = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Names"
        label.textColor = .white
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBlue
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        contentView.addSubview(label)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
}
