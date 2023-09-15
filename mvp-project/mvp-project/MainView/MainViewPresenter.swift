//
//  MainViewPresenter.swift
//  mvp-project
//
//  Created by bacho kartsivadze on 13.09.23.
//

import UIKit

protocol MainViewPresenter: AnyObject {
    func updateLike()
    func likeButtonTitle() -> String
    func viewColor() -> UIColor
    func rowIdentifier() -> String
    func headerIdentifier() -> String
    func numberOfRow() -> Int
    func headerHeight() -> CGFloat
    func cellHeight() -> CGFloat
    
}

class MainViewPresenterImpl {
    
    private var model = MainModel(liked: false)
    
    init() {
        
    }
}


extension MainViewPresenterImpl: MainViewPresenter {
    
    func likeButtonTitle() -> String {
        return model.liked ? "Dislike" : "Like"
    }
    func viewColor() -> UIColor {
        return model.liked ? .systemBlue : .white
    }
    
    func updateLike() {
        model.liked.toggle()
    }
    
    func rowIdentifier() -> String {
        return "MainViewTableViewCell"
    }
    
    func headerIdentifier() -> String {
        return "MainViewTableViewHeaderFooterView"
    }
    
    func numberOfRow() -> Int {
        return 10
    }
    
    func headerHeight() -> CGFloat {
        return 52
    }
    
    func cellHeight() -> CGFloat {
        return 44
    }
}
