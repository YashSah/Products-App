//
//  ProductViewModel.swift
//  testAPI
//
//  Created by Admin on 26/09/24.
//

import Foundation

final class ProductViewModel {
    
    var products: [Product] = []
    var eventHandler: ((_ event: Event) -> Void)? //Data binding closure
    
    func fetchProducts() {
        APIManager.shared.request(
            modelType: [Product].self,
            type: EndPointItems.products) { response in
                switch response {
                case .success(let products):
                    self.products = products
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    print(error)
                    self.eventHandler?(.error(error))
                }
            }
    }
    
}


extension ProductViewModel {
    
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
    
}
