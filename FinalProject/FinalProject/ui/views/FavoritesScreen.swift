//
//  FavoritesScreen.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 22.05.2024.
//

import UIKit

class FavoritesScreen: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var listFoods = [Foods]()
    var viewModel = FavoritesScreenViewModel()
    var mainViewModel = MainScreenViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navAppearance = UINavigationBarAppearance()
        navAppearance.backgroundColor = UIColor(named: "navigationcolor")
        navAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "basecolor")!,.font: UIFont(name: "Oswald-ExtraLight", size: 22)!]
        
        navigationController?.navigationBar.standardAppearance = navAppearance
        navigationController?.navigationBar.compactAppearance = navAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navAppearance
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        _ = viewModel.listFoods.subscribe(onNext: { list in
            self.listFoods = list.filter({$0.favori == true})
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        let f1 = Foods(yemek_id: "1", yemek_adi: "Köfte", yemek_resim_adi: "kofte", yemek_fiyat: "23", favori: true)
        listFoods.append(f1)
    }
    override func viewWillAppear(_ animated: Bool) {
        //viewModel.frepo.updateFoods(listFoods)
    }
}
extension FavoritesScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell") as! FavoritesTableViewCell
        let foodFav = listFoods[indexPath.row]
        
        cell.imageViewFav.image = UIImage(named: String(foodFav.yemek_resim_adi!))
        cell.labelYemekAdi.text = foodFav.yemek_adi!
        cell.labelYemekFiyat.text = "Fiyat: ₺"+foodFav.yemek_fiyat!
        
        return cell
    }
    
    
}
