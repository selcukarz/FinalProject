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
    var basketFoods = [BasketFoods]()


    init(){
        listBasketFoods = frepo.listBasketFoods
    }
    func delete(sepet_yemek_id:Int,kullanici_adi:String){
        frepo.delete(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    func getAllFood(kullanici_adi:String){
        frepo.getAllFood(kullanici_adi: kullanici_adi)
    }
    func calculateTotalPrice() -> Int{
        var totalPrice = 0
        print("\([BasketFoods]())")
        for i in basketFoods {
            //let price = Int(basketFood.yemek_fiyat!)!
            //let numberOfItem = Int(basketFood.yemek_siparis_adet!)!
            //let price1 = price*numberOfItem
            //totalPrice = totalPrice + price1
            print("\(i)")
        }
        //print("\(totalPrice)")
        return 1
    }
}
