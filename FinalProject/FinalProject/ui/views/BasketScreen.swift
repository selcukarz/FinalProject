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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    @IBAction func buttonBucketConfirm(_ sender: Any) {
        print("Sepeti alım onaylandı.")
    }
}
