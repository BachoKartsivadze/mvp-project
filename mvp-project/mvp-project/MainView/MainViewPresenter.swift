//
//  MainViewPresenter.swift
//  mvp-project
//
//  Created by bacho kartsivadze on 13.09.23.
//

import UIKit

protocol MainViewPresenter: AnyObject {
    func updateLike()
    var likeButtonTitle: String { get }
    var viewColor: UIColor { get }
}

class MainViewPresenterImpl {
    
    private var model = MainModel(liked: false)
    
    init() {
        
    }
}


extension MainViewPresenterImpl: MainViewPresenter {
    
    var likeButtonTitle: String {
        return model.liked ? "Dislike" : "Like"
    }
    var viewColor: UIColor {
        return model.liked ? .systemBlue : .white
    }
    
    func updateLike() {
        model.liked.toggle()
    }
}
