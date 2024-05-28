//
//  MainScreenViewModel.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 28.05.2024.
//

import Foundation

class MainScreenViewModel{
    var frepo = FoodRepository()

    func add(){
        frepo.singleAdd()
    }
    func search(searchText: searchText){
        frepo.search(searchText: searchText)
    }
    
    
}
