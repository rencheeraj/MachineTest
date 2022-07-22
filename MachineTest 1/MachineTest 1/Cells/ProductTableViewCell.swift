//
//  ProductTableViewCell.swift
//  MachineTest 1
//
//  Created by Rencheeraj on 22/07/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var productsData: HomeData {
        didSet {
            //typeName.text = productsData.type
            collectionView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension ProductTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsData.type?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "",
            for: indexPath) as?
                ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.productName.text = productsData.type.n
        return cell
    }

}
