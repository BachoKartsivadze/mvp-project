//
//  MainViewController.swift
//  mvp-project
//
//  Created by bacho kartsivadze on 10.09.23.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenter!
    
    let topView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let likeButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Like", for: .normal)
        return button
    }()
    
    init(with presenter: MainViewPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        addViews()
        addConstraints()
        addTargets()
    }


}


extension MainViewController {
    
    private func addTargets() {
        likeButton.addTarget(self, action: #selector(tapLike), for: .touchUpInside)
    }
    
    @objc private func tapLike() {
        presenter.updateLike()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.topView.backgroundColor = self.presenter.viewColor
            self.likeButton.setTitle(self.presenter.likeButtonTitle, for: .normal)
        })
    }
}

extension MainViewController {
    
    private func addViews() {
        view.addSubview(topView)
        view.addSubview(likeButton)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            topView.heightAnchor.constraint(equalToConstant: 200),
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            likeButton.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
            likeButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor)
        ])
    }
}
