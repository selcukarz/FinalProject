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
    var listFoods = BehaviorSubject<[Foods]>(value: [Foods]())
    var listBasketFoods = BehaviorSubject<[BasketFoods]>(value: [BasketFoods]())
    
    func favorite(){
        print("favoriye eklendi")
    }
    func calculateTotalPrice(){
        
    }
    func search(searchText:String){
        print("arama yapildi")
    }
    func delete(){
        print("silindi")
    }
    func addBasket(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:Int,yemek_siparis_adet:Int,kullanici_adi:String){
        print("\(yemek_adi) \(yemek_resim_adi) \(yemek_siparis_adet) \(kullanici_adi)")
        
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php")!
        let params:Parameters = ["yemek_adi":yemek_adi,"yemek_resim_adi":yemek_resim_adi,"yemek_fiyat":yemek_fiyat,"yemek_siparis_adet":yemek_siparis_adet,"kullanici_adi":kullanici_adi]
        
        AF.request(url, method: .post,parameters: params).response { response in
            if let data = response.data {
                do{
                    let response = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("Başarı : \(response.success!)")
                    print("Mesaj : \(response.message!)")
                }catch{
                    print(error.localizedDescription)
                    print("asdasd")
                }
            }
        }
    }
    func getAllFood(kullanici_adi:String){
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php")!
        let params:Parameters = ["kullanici_adi":kullanici_adi]
        
        AF.request(url, method: .post,parameters: params).response { response in
            if let data = response.data {
                do{
                    let response = try JSONDecoder().decode(BasketFoodsResponse.self, from: data)
                    if let liste = response.sepetYemekler {
                        self.listBasketFoods.onNext(liste)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func uploadFoods(){
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")!
        
        AF.request(url, method: .get).response { response in
            if let data = response.data {
                do{
                    let response = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    if let list = response.yemekler {
                        self.listFoods.onNext(list)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
