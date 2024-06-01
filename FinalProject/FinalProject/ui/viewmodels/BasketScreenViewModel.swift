//
//  BasketScreenViewModel.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 28.05.2024.
//

import Foundation
import RxSwift

class BasketScreenViewModel {
    var frepo = FoodRepository()
    var listBasketFoods = BehaviorSubject<[BasketFoods]>(value: [BasketFoods]())

    init(){
        listBasketFoods = frepo.listBasketFoods
    }
    func delete(sepet_yemek_id:Int,kullanici_adi:String){
        frepo.delete(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    func getAllFood(kullanici_adi:String){
        frepo.getAllFood(kullanici_adi: kullanici_adi)
    }
}
