//
//  BasketScreen.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 22.05.2024.
//

import UIKit

class BasketScreen: UIViewController {
    @IBOutlet weak var basketTableView: UITableView!
    @IBOutlet weak var labelToplam: UILabel!
    @IBOutlet weak var labelGonderim: UILabel!
    @IBOutlet weak var labelUcretsiz: UILabel!
    @IBOutlet weak var labelTotalPrice: UILabel!
    
    var basketFoods = [BasketFoods]()
    var viewModel = BasketScreenViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var f1 = BasketFoods(sepet_yemek_id: "1", yemek_adi:"Köfte" , yemek_resim_adi: "kofte", yemek_fiyat: "25", yemek_siparis_adet: "2", kullanici_adi: "selcuk_arioz")
        basketFoods.append(f1)
        var f2 = BasketFoods(sepet_yemek_id: "2", yemek_adi:"Kahve" , yemek_resim_adi: "kahve", yemek_fiyat: "16", yemek_siparis_adet: "5", kullanici_adi: "selcuk_arioz")
        basketFoods.append(f2)
        var f3 = BasketFoods(sepet_yemek_id: "3", yemek_adi:"Lazanya" , yemek_resim_adi: "lazanya", yemek_fiyat: "32", yemek_siparis_adet: "1", kullanici_adi: "selcuk_arioz")
        basketFoods.append(f3)
        
        basketTableView.delegate = self
        basketTableView.dataSource = self
        
        self.basketTableView.reloadData()
        
        _ = viewModel.listBasketFoods.subscribe(onNext: { liste in
            self.basketFoods = liste
            
        })
    }
    @IBAction func buttonBucketConfirm(_ sender: Any) {
        print("Sepeti alım onaylandı.")
        viewModel.getAllFood(kullanici_adi:"selcuk_arioz")
    }
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBasketDetail" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi
            }
        }
    }*/
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getAllFood(kullanici_adi:"selcuk_arioz")
    }
}
extension BasketScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(basketFoods.count)
        return basketFoods.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketDetail") as! BasketTableViewCell
        let basketFood = basketFoods[indexPath.row]
        
        var yemekFiyatInt = Int(basketFood.yemek_fiyat!)!
        var yemekAdetInt = Int(basketFood.yemek_siparis_adet!)!
        var totalPrice = yemekAdetInt * yemekFiyatInt
        
        cell.imageViewYemek.image = UIImage(named: basketFood.yemek_resim_adi!)
        cell.labelYemekAdi.text = basketFood.yemek_adi!
        cell.labelTekliFiyat.text = "Fiyat: ₺"+basketFood.yemek_fiyat!
        cell.labelNumberOfItem.text = "Adet: "+basketFood.yemek_siparis_adet!
        cell.labelTotalPrice.text = "₺"+String(totalPrice)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAciton = UIContextualAction(style: .destructive, title: "Sil"){
            centexualAciton,view,bool in
            let food = self.basketFoods[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(food.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ _ in
                self.viewModel.delete(yemek_id: food.sepet_yemek_id!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAciton])
    }
    
}
