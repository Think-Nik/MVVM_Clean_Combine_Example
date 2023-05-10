//
//  ProductsViewController.swift
//  MVVM_Clean_Combine_Example
//
//  Created by Macbook-pro on 04/04/23.
//

import UIKit
import Combine

class ProductsViewController: UIViewController {

    @IBOutlet weak var tblViewProducts: UITableView!
    
    private var viewModel: ProductsViewModelDelegate!
    private var cancellables: [AnyCancellable] = []
    private var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ProductsViewModel()
        viewModel.getProducts()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.tblViewProducts.reloadData()
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] products in
                print(products)
                self?.products = products
            }
            .store(in: &cancellables)
    }
}

extension ProductsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as? ProductsTableViewCell else {
            return UITableViewCell()
        }
        cell.commonInit(data: products[indexPath.row])
        return cell
    }
}
