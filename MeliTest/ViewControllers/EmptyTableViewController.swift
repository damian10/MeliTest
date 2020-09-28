//
//  EmptyTableView.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/26/20.
//

import UIKit

class EmptyTableViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var infoView: UIStackView!
    let child = SpinnerViewController()
    
    func showEmptyResults() {
        self.messageLabel.text = "No se han encontrado resultados"
        self.infoView.isHidden = false
        remove(child)
    }
    
    func showStartSearching() {
        self.messageLabel.text = "Tenemos cientos de productos esperandote, ¿Todavía no empezaste a buscar?"
        self.infoView.isHidden = false
        remove(child)
    }
    
    func showError() {
        self.messageLabel.text = "Ha ocurrido un error"
        self.infoView.isHidden = false
        remove(child)
    }
    
    func loading() {
        add(child)
        self.infoView.isHidden = true
    }
}
