//
//  ViewController.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 22.05.2024.
//

import UIKit

class MainScreen: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    var listFoods = [Foods]()
    var viewModel = MainScreenViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        _ = viewModel.listFoods.subscribe(onNext: { list in
            self.listFoods = list
            DispatchQueue.main.async {
                self.mainCollectionView.reloadData()
            }
        })
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2
        
        design.itemSize = CGSize(width: itemWidth, height: itemWidth*1.65)
        
        mainCollectionView.collectionViewLayout = design
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.copyDatabase()
        //Bu sayfaya dönüldüğünde verileri yüklenmiş olacak.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let food = sender as? Foods {
                let vc = segue.destination as! DetailScreen
                vc.foods = food
            }
        }
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
        cell.labelFiyat.text = "\(food.yemek_fiyat!)"
        cell.labelUcretsizGonderim.text = "Ücretsiz Gönderim"
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    func clickedAdd(indexPath: IndexPath){
        let food = listFoods[indexPath.row]
        viewModel.add(yemek_adi: food.yemek_adi!, yemek_resim_adi: food.yemek_resim_adi!, yemek_fiyat: Int(food.yemek_fiyat!)!, yemek_siparis_adet: 1, kullanici_adi: "selcuk_arioz")
    }
    func clickedFav(indexPath: IndexPath){
        let food = listFoods[indexPath.row]
       // if food.favori == false {
            //food.favori = true
            //buttonfav.setImage(UIImage(named: "favoritefill"), for: .normal)
        //}else {
           // food.favori = false
            //buttonfav.setImage(UIImage(named: "favortiesoutlined"), for: .normal)
        //}
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
