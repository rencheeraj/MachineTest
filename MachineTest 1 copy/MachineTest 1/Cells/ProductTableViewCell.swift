//
//  ProductTableViewCell.swift
//  MachineTest 1
//
//  Created by Rencheeraj on 22/07/22.
//

import UIKit
import Kingfisher

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var products: HomeData? {
        didSet {
            //typeName.text = productsData.type
            collectionView.reloadData()
        }
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

extension ProductTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.values?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch products?.type {
        case .category:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "ProductCollectionViewCell",
                for: indexPath) as?
                    ProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.productName.text = products?.values?[indexPath.row].name ?? ""
            let url = URL(string: products?.values?[indexPath.row].image_url ?? "")
            cell.productImage.kf.setImage(with: url)
            return cell
            
        case .banner:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "BannerCollectionViewCell",
                for: indexPath) as?
                    BannerCollectionViewCell else {
                return UICollectionViewCell()
            }
            let url = URL(string: products?.values?[indexPath.row].banner_url ?? "")
            cell.bannerImage.kf.setImage(with: url)
            return cell
            
        case .product:
            // return product cell
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "ProductDetailsCollectionViewCell",
                for: indexPath) as?
                    ProductDetailsCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.productDet.text = products?.values?[indexPath.row].name ?? ""
            let url = URL(string: products?.values?[indexPath.row].image ?? "")
            cell.imagePro.kf.setImage(with: url)
            if (products?.values?[indexPath.row].is_express == true)
            {
                cell.expressImage.isHidden = false
            }
            if (products?.values?[indexPath.row].offer != 0)
            {
                let int1: Int
                int1 = products?.values?[indexPath.row].offer ?? 0
                cell.offerLabel.text = "\(int1)% OFF"
            }
            cell.actualPrice.text = products?.values?[indexPath.row].actual_price ?? ""
            cell.offerPrice.text = products?.values?[indexPath.row].offer_price
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 175, height: 175)
    }

}
