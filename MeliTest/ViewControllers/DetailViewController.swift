//
//  DetailViewController.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/26/20.
//

import UIKit

class DetailViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    var product:Product?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productImage.sd_setImage(with: URL(string: product?.thumbnail ?? ""), placeholderImage: UIImage(named: "placeholder"))
        self.nameLabel.text = product?.title
        self.conditionLabel.text = product?.condition?.capitalized == "New" ? "Nuevo" : "Usado"
    }
}
