//
//  FavoritesScreenViewModel.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 28.05.2024.
//

import Foundation
import RxSwift


class FavoritesScreenViewModel {
    var frepo = FoodRepository()
    var listFoods = BehaviorSubject<[Foods]>(value: [Foods]())
    
    init(){
        listFoods = frepo.listFoods
        
    }
    
    
}
