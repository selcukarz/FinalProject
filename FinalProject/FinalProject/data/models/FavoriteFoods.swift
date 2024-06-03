//
//  FavoriFoods.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 28.05.2024.
//

import Foundation

class FavoriteFoods {
    var yemek_id:String?
    var yemek_adi:String?
    var yemek_resim_adi:String?
    var yemek_fiyat:String?
    var favori:Bool?
    
    init(yemek_id: String, yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, favori: Bool) {
        self.yemek_id = yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
        self.favori = favori
    }
}
