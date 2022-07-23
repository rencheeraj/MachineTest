//
//  ViewController.swift
//  MachineTest 1
//
//  Created by Rencheeraj on 22/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var productData: [HomeData]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        downLoadJSON {
//            self.tableView.reloadData()
//        }
        
        APICaller.shared.getJsonResult() { result in
            switch result{
            case .success(let homeData):
                self.productData = homeData
                print("########### \(self.productData)")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        print(productData)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(productData?.count)
        return productData?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ProductTableViewCell", for: indexPath) as?
                ProductTableViewCell else {
            fatalError("Unable to downcast the cell in cellForRowAt to ItemTableViewCell")
        }
        cell.products = productData?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}






