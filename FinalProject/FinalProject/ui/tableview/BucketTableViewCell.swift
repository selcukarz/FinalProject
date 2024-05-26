//
//  BucketTableViewCell.swift
//  FinalProject
//
//  Created by Selçuk Arıöz on 27.05.2024.
//

import UIKit

class BucketTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewYemek: UIImageView!
    @IBOutlet weak var labelYemekAdi: UILabel!
    @IBOutlet weak var labelTekliFiyat: UILabel!
    @IBOutlet weak var labelTotalPrice: UILabel!
    @IBOutlet weak var labelNumberOfItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func buttonBucketConfirm(_ sender: Any) {
    }
}
