//
//  MainViewPresenter.swift
//  mvp-project
//
//  Created by bacho kartsivadze on 13.09.23.
//

import UIKit

protocol MainView: AnyObject {
    func reloadMainView()
}

protocol MainViewPresenter: AnyObject {
    func updateLike()
    func likeButtonTitle() -> String
    func rowIdentifier() -> String
    func headerIdentifier() -> String
    func numberOfRow() -> Int
    func headerHeight() -> CGFloat
    func cellHeight() -> CGFloat
    func nameForRow(in indexpath: IndexPath) -> NameModel
    func selectRow(at indexpath: IndexPath)
    var activeName: NameModel { get }
    
}

class MainViewPresenterImpl {
    
    private var names = [NameModel(name: "Alter Kacynzee"),
                         NameModel(name: "Alfred Stieglitz"),
                         NameModel(name: "Henry Cartier-Bresson"),
                         NameModel(name: "Annie Leibovitz"),
                         NameModel(name: "Anselm Adams"),
                         NameModel(name: "Dorothea Lange"),
                         NameModel(name: "Man Ray"),
                         NameModel(name: "Laura Makabresku"),
                         NameModel(name: "Bruno Barbey"),
                         NameModel(name: "August Sander"),
                         NameModel(name: "Bill Brandt"), NameModel(name: "-")]
    
    var activeNameLocation: Int
    var activeName: NameModel
    private weak var view: MainView?
    
    init() {
        activeNameLocation = names.count-1
        activeName = names[activeNameLocation]
    }
}


extension MainViewPresenterImpl: MainViewPresenter {
    
    func likeButtonTitle() -> String {
        return activeName.liked ? "Dislike" : "Like"
    }
    
    func updateLike() {
        activeName.liked.toggle()
        names[activeNameLocation].liked.toggle()
        view?.reloadMainView()
        
    }
    
    func nameForRow(in indexpath: IndexPath) -> NameModel {
        return names[indexpath.row]
    }
    
    func selectRow(at indexpath: IndexPath) {
        activeNameLocation = indexpath.row
        activeName = names[activeNameLocation]
        
    }
    
    func rowIdentifier() -> String {
        return "MainViewTableViewCell"
    }
    
    func headerIdentifier() -> String {
        return "MainViewTableViewHeaderFooterView"
    }
    
    func numberOfRow() -> Int {
        return names.count
    }
    
    func headerHeight() -> CGFloat {
        return 52
    }
    
    func cellHeight() -> CGFloat {
        return 44
    }
    
    
}
