//
//  ViewController.swift
//  MachineTest 1
//
//  Created by Rencheeraj on 22/07/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var productData: ProductModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        downLoadJSON {
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productData?.homeData?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ProductTableViewCell") as?
                ProductTableViewCell else {
            return UITableViewCell()
        }
            return cell
        }
    


    func downLoadJSON(completed: @escaping () -> ()){
        
        let url = URL(string: "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if error == nil {
                do {
                    self.productData = try JSONDecoder().decode(ProductModel.self, from: data!)
                    //print(self.productData)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                    
                }catch {
                    print("JSON Error")
                }
            }
        }.resume()
    }
}

    




