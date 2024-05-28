//
//  Repository.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 26.05.2024.
//

import Foundation
import RxSwift
import Alamofire

class FoodRepository {
    
    func singleAdd(){
        print("tekli sepete eklendi")
    }
    func multiAdd(){
        print("çoklu sepete eklendi")
    }
    func favorite(){
        print("favoriye eklendi")
    }
    func search(searchText:String){
        print("arama yapildi")
    }
    func decrease(){
        print("sipariş adedi azaltıldı")
    }
    func increase(){
        print("sipariş adedi arttırıldı")
    }
    func delete(){
        print("silindi")
    }
    func confirm(){
        print("sepet onaylandı")
    }
    func uploadFoods(){
        print("yemekler getirildi.")
    }
}
