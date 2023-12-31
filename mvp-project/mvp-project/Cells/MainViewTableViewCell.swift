//
//  MainViewTableViewCell.swift
//  mvp-project
//
//  Created by bacho kartsivadze on 14.09.23.
//

import UIKit

class MainViewTableViewCell: UITableViewCell {
    
    let identifier = "MainViewTableViewCell"
    
    let label = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "_"
        label.textColor = .white
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBlue.withAlphaComponent(0.7)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with nameModel: NameModel) {
        label.text = nameModel.name
        if nameModel.liked {
            contentView.backgroundColor = .systemBlue
        } else {
            contentView.backgroundColor = .blue.withAlphaComponent(0.4)
        }
    }
    
    
    
    
    private func addViews() {
        contentView.addSubview(label)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
