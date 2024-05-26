//
//  Foods.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 24.05.2024.
//

import Foundation


class Foods {
    var yemek_id:Int?
    var yemek_adi:String?
    var yemek_resim_adi:String?
    var yemek_fiyat:Int?
    var favori:Bool?
    
    init(yemek_id: Int, yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, favori: Bool? = nil) {
        self.yemek_id = yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
        self.favori = favori
    }
   
}
