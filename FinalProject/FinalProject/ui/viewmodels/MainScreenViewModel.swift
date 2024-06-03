//
//  MainScreenViewModel.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 28.05.2024.
//

import Foundation
import RxSwift
import UIKit

class MainScreenViewModel{
    var frepo = FoodRepository()
    var listFoods = BehaviorSubject<[Foods]>(value: [Foods]())
    
    init(){
        listFoods = frepo.listFoods
        
    }
    func add(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String){
        frepo.addBasket(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
    func search(searchText: String){
        frepo.search(searchText: searchText)
    }
    func copyDatabase(){
        frepo.uploadFoods()
    }
    func updateFood(){
        _ = self.listFoods.subscribe(onNext: { list in
            self.frepo.updateFoods(list)
        })
    }
}
