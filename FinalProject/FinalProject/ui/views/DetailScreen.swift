//
//  DetailScreen.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 22.05.2024.
//

import UIKit

class DetailScreen: UIViewController {
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var labelFoodPrice: UILabel!
    @IBOutlet weak var labelFoodName: UILabel!
    @IBOutlet weak var labelNumberOfItem: UILabel!
    @IBOutlet weak var labelTotalPrice: UILabel!
    
    var foods:Foods!
    var yemek_siparis_adet = 0
    var viewModel = DetailScreenViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navAppearance = UINavigationBarAppearance()
        navAppearance.backgroundColor = UIColor(named: "navigationcolor")
        navAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "basecolor")!,.font: UIFont(name: "Oswald-ExtraLight", size: 22)!]
        
        if let f = foods {
            foodImageView.image = UIImage(named: "\(f.yemek_resim_adi!)")
            labelFoodName.text = f.yemek_adi!
            labelFoodPrice.text = "₺"+String(f.yemek_fiyat!)
            labelTotalPrice.text = "₺0"
            labelNumberOfItem.text = String(yemek_siparis_adet)
        }
    }
    @IBAction func buttonDecrease(_ sender: Any) {
        if let f = foods {
            if yemek_siparis_adet == 0{
            }else {
                yemek_siparis_adet -= 1
            }
            labelNumberOfItem.text = String(yemek_siparis_adet)
            labelTotalPrice.text = "₺"+String(Int(f.yemek_fiyat!)! * yemek_siparis_adet)
        }
    }
    @IBAction func buttonIncrease(_ sender: Any) {
        if let f = foods {
            yemek_siparis_adet += 1
            labelNumberOfItem.text = String(yemek_siparis_adet)
            labelTotalPrice.text = "₺"+String(Int(f.yemek_fiyat!)! * yemek_siparis_adet)
        }
    }
    @IBAction func buttonAddButton(_ sender: Any) {
        viewModel.add(sepet_yemek_id: Int(foods.yemek_id!)!, yemek_adi: foods.yemek_adi!, yemek_resim_adi: foods.yemek_resim_adi!, yemek_fiyat: Int(foods.yemek_fiyat!)!, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: "selcuk_arioz")
    }
}
