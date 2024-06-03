//
//  ViewController.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 22.05.2024.
//

import UIKit
import RxSwift

class MainScreen: UIViewController {
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    var listFoods = [Foods]()
    var viewModel = MainScreenViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        _ = viewModel.listFoods.subscribe(onNext: { list in
            self.listFoods = list
            self.mainCollectionView.reloadData()
            
        })
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        self.mainCollectionView.backgroundColor = UIColor(named: "viewbackground")
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2
        design.itemSize = CGSize(width: itemWidth, height: itemWidth*1.65)
        
        mainCollectionView.collectionViewLayout = design
        
        let navAppearance = UINavigationBarAppearance()
        navAppearance.backgroundColor = UIColor(named: "navigationcolor")
        navAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "basecolor")!,.font: UIFont(name: "Oswald-ExtraLight", size: 22)!]
        
        navigationController?.navigationBar.standardAppearance = navAppearance
        navigationController?.navigationBar.compactAppearance = navAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navAppearance
        
        let tabBarAppearence = UITabBarAppearance()
        tabBarAppearence.backgroundColor = UIColor.tabbarbackground
        
        tabbarColorChange(itemAppearence: tabBarAppearence.stackedLayoutAppearance)
        tabbarColorChange(itemAppearence: tabBarAppearence.inlineLayoutAppearance)
        tabbarColorChange(itemAppearence: tabBarAppearence.compactInlineLayoutAppearance)

        tabBarController?.tabBar.standardAppearance = tabBarAppearence
        tabBarController?.tabBar.scrollEdgeAppearance = tabBarAppearence
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.copyDatabase()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let food = sender as? Foods {
                let vc = segue.destination as! DetailScreen
                vc.foods = food
            }
        }
    }
    func tabbarColorChange(itemAppearence:UITabBarItemAppearance){
        itemAppearence.selected.iconColor = UIColor.tabbaricon
        itemAppearence.normal.iconColor = UIColor.tabbaricon1
    }
}
extension MainScreen: UICollectionViewDelegate,UICollectionViewDataSource,CellProtocol {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listFoods.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! MainViewCell
        let food = listFoods[indexPath.row]
        
        cell.yemekImageView.image = UIImage(named: food.yemek_resim_adi!)
        cell.labelAd.text = food.yemek_adi!
        cell.labelFiyat.text = "₺"+"\(food.yemek_fiyat!)"
        cell.labelUcretsizGonderim.text = "Ücretsiz Gönderim"
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        cell.backgroundColor = UIColor.white
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    func clickedAdd(indexPath: IndexPath){
        let food = listFoods[indexPath.row]
        viewModel.add(yemek_adi: food.yemek_adi!, yemek_resim_adi: food.yemek_resim_adi!, yemek_fiyat: Int(food.yemek_fiyat!)!, yemek_siparis_adet: 1, kullanici_adi: "selcuk_arioz")
    }
    func clickedFav(indexPath: IndexPath){
        var food = listFoods[indexPath.row]
        food.favori = true
        if food.favori == false {
            food.favori = true
        }else{
            food.favori = false
        }
        listFoods[indexPath.row] = food
        //viewModel.updateFood()
        print("anasayfa \(food.yemek_adi!) favoriye eklendi.")
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = listFoods[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: food)
    }
}
extension MainScreen : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText: searchText)
    }
}
