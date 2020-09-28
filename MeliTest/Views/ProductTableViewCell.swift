//
//  ProductTableViewCell.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/26/20.
//

import UIKit
import SDWebImage

class ProductTableViewCell: UITableViewCell, ReusableView, NibProtocol {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!

    func setupCell(product:Product) {
        self.nameLabel.text = product.title
        self.priceLabel.text = "$\(String(describing: product.price?.formattedAmount() ?? "" ))"
        self.conditionLabel.text = product.condition?.capitalized == "New" ? "Nuevo" : "Usado"
        self.shippingLabel.isHidden = product.shipping.freeShipping ?? false
        self.selectionStyle = .none
        self.productImage.sd_setImage(with: URL(string: product.thumbnail ?? ""), placeholderImage: UIImage(named: "placeholder"))
    }
    
}
