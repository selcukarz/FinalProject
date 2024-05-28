//
//  MainViewCell.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 24.05.2024.
//

import UIKit

protocol CellProtocol{
    func clickedAdd(indexPath: IndexPath)
    func clickedFav(indexPath: IndexPath)
}

class MainViewCell: UICollectionViewCell {
    @IBOutlet weak var yemekImageView: UIImageView!
    @IBOutlet weak var labelAd: UILabel!
    @IBOutlet weak var labelUcretsizGonderim: UILabel!
    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var buttonFav: UIButton!
    
    var cellProtocol:CellProtocol?
    var indexPath:IndexPath?
    
    @IBAction func buttonCellAdd(_ sender: Any) {
        cellProtocol?.clickedAdd(indexPath: indexPath!)
    }
    
    @IBAction func buttonAddFav(_ sender: Any) {
        cellProtocol?.clickedFav(indexPath: indexPath!)
        
    }
}
