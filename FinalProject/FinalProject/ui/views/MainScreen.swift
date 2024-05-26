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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let f1 = Foods(yemek_id: 1, yemek_adi: "Ayran", yemek_resim_adi: "ayran", yemek_fiyat: 40)
        let f2 = Foods(yemek_id: 2, yemek_adi: "Baklava", yemek_resim_adi: "baklava", yemek_fiyat: 10)
        listFoods.append(f1)
        listFoods.append(f2)
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        
        //10 X 10 X 10    = 30 birim mesafe  X --> Item symbol
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2
        
        design.itemSize = CGSize(width: itemWidth, height: itemWidth*1.65)
        
        mainCollectionView.collectionViewLayout = design
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
        print("anasayfa: \(food.yemek_adi!) ekle tiklandi")
    }
    func clickedFav(indexPath: IndexPath){
        let food = listFoods[indexPath.row]
        print("anasayfa \(food.yemek_adi!) favoriye eklendi.")
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = listFoods[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: food)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let food = sender as? Foods {
                let vc = segue.destination as! DetailScreen
                vc.food = food
            }
        }
    }
    
    
}
