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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = viewModel.listFoods.subscribe(onNext: { list in
            self.listFoods = list.filter({$0.favori == true})
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    
}

//extension FavoritesScreen: UITableViewDelegate, UITableViewDataSource {
    //func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    //}
    
    //func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    //}
    
    
//}
