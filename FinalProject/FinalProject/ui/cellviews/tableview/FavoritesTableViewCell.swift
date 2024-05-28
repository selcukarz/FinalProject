//
//  FavoritesTableViewCell.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 28.05.2024.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewFav: UIImageView!
    @IBOutlet weak var labelYemekAdi: UILabel!
    @IBOutlet weak var labelYemekFiyat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
