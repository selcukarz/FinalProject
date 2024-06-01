//
//  DetailScreenViewModel.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 28.05.2024.
//

import Foundation

class DetailScreenViewModel {
    var frepo = FoodRepository()
    
    func add(sepet_yemek_id:Int, yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String){
        frepo.addBasket(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
    func decrease(yemek_siparis_adet:Int){
        
    }
}
