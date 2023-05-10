//
//  ProductsTableViewCell.swift
//  MVVM_Clean_Combine_Example
//
//  Created by Macbook-pro on 10/05/23.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak private var imgProduct: UIImageView!
    @IBOutlet weak private var lblName: UILabel!
    @IBOutlet weak private var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(data: Product) {
        lblName.text = data.title
        lblDescription.text = data.description
        guard let image = data.images?.first, let url = URL(string: image) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.imgProduct.image = UIImage(data: data)
            }
        }.resume()
    }
    
    override func prepareForReuse() {
        imgProduct.image = nil
    }

}
