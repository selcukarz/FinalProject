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
    
    var food:Foods?
    var numberOfItem = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = food {
            foodImageView.image = UIImage(named: "\(f.yemek_resim_adi!)")
            labelFoodName.text = f.yemek_adi!
            labelFoodPrice.text = "₺"+String(f.yemek_fiyat!)
            labelTotalPrice.text = "₺0"
            labelNumberOfItem.text = String(numberOfItem)
        }

    }
    @IBAction func buttonDecrease(_ sender: Any) {
        if let f = food{
            if numberOfItem == 0{
            }else {
                numberOfItem -= 1
            }
            labelNumberOfItem.text = String(numberOfItem)
            labelTotalPrice.text = "₺"+String(f.yemek_fiyat!*numberOfItem)
        }
    }
    @IBAction func buttonIncrease(_ sender: Any) {
        if let f = food {
            numberOfItem += 1
            labelNumberOfItem.text = String(numberOfItem)
            labelTotalPrice.text = "₺"+String(f.yemek_fiyat!*numberOfItem)
        }
    }
    @IBAction func buttonAddButton(_ sender: Any) {
        print("Ürün sepete eklendi.")
    }
}
