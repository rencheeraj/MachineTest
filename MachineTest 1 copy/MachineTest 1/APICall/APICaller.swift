//
//  APICaller.swift
//  MachineTest 1
//
//  Created by Rencheeraj on 23/07/22.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    struct Constants {
        static let productURL = URL(string: "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0")
    }
    
    private init() {}
    
    public func getJsonResult(completion: @escaping (Result<[HomeData], Error>) -> Void) {
        guard let url = Constants.productURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(ProductModel.self, from: data)
                    print("Homedata: \(result.homeData)")
                    completion(.success(result.homeData!))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
        
    }
    
}


//func downLoadJSON(completed: @escaping () -> ()){
//
//    let url = URL(string: "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0")
//
//    URLSession.shared.dataTask(with: url!) { data, response, error in
//
//        if error == nil {
//            do {
//                self.productData = try JSONDecoder().decode(ProductModel.self, from: data!)
//                print(self.productData?.homeData?.count)
//
//                DispatchQueue.main.async {
//                    completed()
//                }
//
//            }catch {
//                print("JSON Error")
//            }
//        }
//    }.resume()
//}
