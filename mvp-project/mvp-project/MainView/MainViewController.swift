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
        let view = DisplayView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let likeButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Like", for: .normal)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(MainViewTableViewCell.self, forCellReuseIdentifier: "MainViewTableViewCell")
        table.register(MainViewTableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "MainViewTableViewHeaderFooterView")
        table.backgroundColor = .white
        return table
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
        view.backgroundColor = .systemBlue.withAlphaComponent(0.5)
        addViews()
        addConstraints()
        addTargets()
//        topView.configure(with: NameModel(name: "bacho kartsivadze"))
    }


}


extension MainViewController {
    
    private func addTargets() {
        likeButton.addTarget(self, action: #selector(tapLike), for: .touchUpInside)
    }
    
    @objc private func tapLike() {
        presenter.updateLike()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.topView.configure(with: self.presenter.activeName)
            self.likeButton.setTitle(self.presenter.likeButtonTitle(), for: .normal)
        })
        
        tableView.reloadData()
    }
}



extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: presenter.headerIdentifier()) as? MainViewTableViewHeaderFooterView else {
            return UIView()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: presenter.rowIdentifier(), for: indexPath) as? MainViewTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: presenter.nameForRow(in: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.cellHeight()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return presenter.headerHeight()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectRow(at: indexPath)
        likeButton.setTitle(presenter.likeButtonTitle(), for: .normal)
        topView.configure(with: presenter.activeName)
    }
    
}

extension MainViewController {
    
    private func addViews() {
        view.addSubview(topView)
        view.addSubview(likeButton)
        view.addSubview(tableView)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            topView.heightAnchor.constraint(equalToConstant: 200),
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            likeButton.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
            likeButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            
            tableView.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
}



extension MainViewController: MainView {
    func reloadMainView() {
        viewDidLoad()
    }
}
