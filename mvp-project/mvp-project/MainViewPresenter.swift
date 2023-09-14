//
//  MainViewPresenter.swift
//  mvp-project
//
//  Created by bacho kartsivadze on 13.09.23.
//

import UIKit

class MainViewPresenter {
    
    var model = MainModel(liked: false)
    
    var likeButtonTitle: String {
        return model.liked ? "Dislike" : "Like"
    }
    var viewColor: UIColor {
        return model.liked ? .blue : .clear
    }
    
    func updateLike() {
        model.liked.toggle()
    }
    
    init() {
        
    }
}
