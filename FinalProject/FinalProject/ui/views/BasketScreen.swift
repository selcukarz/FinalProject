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
    
    var viewModel = BasketScreenViewModel()
    var basketFoods = [BasketFoods](){
        didSet{
            var totalPrice = 0
            for food in self.basketFoods {
                totalPrice += Int(food.yemek_fiyat!)! * Int(food.yemek_siparis_adet!)!
                
            }
            self.labelTotalPrice.text = "₺"+String(totalPrice)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navAppearance = UINavigationBarAppearance()
        navAppearance.backgroundColor = UIColor(named: "navigationcolor")
        navAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "basecolor")!,.font: UIFont(name: "Oswald-ExtraLight", size: 22)!]
        
        navigationController?.navigationBar.standardAppearance = navAppearance
        navigationController?.navigationBar.compactAppearance = navAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navAppearance
        
        basketTableView.delegate = self
        basketTableView.dataSource = self
        
        
        _ = viewModel.listBasketFoods.subscribe(onNext: { liste in
            self.basketFoods = liste
            DispatchQueue.main.async {
                self.basketTableView.reloadData()
            }
        })
        
    }
    @IBAction func buttonBasketConfirm(_ sender: Any) {
        let alert = UIAlertController(title: "Afiyet Olsun!", message: "Siparişiniz onaylandı.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getAllFood(kullanici_adi:"selcuk_arioz")
        //viewModel.calculateTotalPrice()
    }
    
}
extension BasketScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketFoods.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketDetail") as! BasketTableViewCell
        let basketFood = basketFoods[indexPath.row]
        
        
        let yemekFiyatInt = Int(basketFood.yemek_fiyat!)!
        let yemekAdetInt = Int(basketFood.yemek_siparis_adet!)!
        let totalPrice = yemekAdetInt * yemekFiyatInt
        
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
            let basketFood = self.basketFoods[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(basketFood.yemek_adi!) sepetten silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ _ in
                self.viewModel.delete(sepet_yemek_id: Int(basketFood.sepet_yemek_id!)!, kullanici_adi: basketFood.kullanici_adi!)
                self.viewModel.getAllFood(kullanici_adi:"selcuk_arioz")
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAciton])
    }
}
