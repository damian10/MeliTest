//
//  ViewController.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/24/20.
//

import UIKit

class SearchViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    var results = [Product]()
    private lazy var searchController = UISearchController(searchResultsController: nil)
    var productManager:ProductManager? = nil
    private lazy var informationView = EmptyTableViewController(nibName: nil, bundle: nil)
    
    @IBOutlet weak var resulstTableView: UITableView!
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productManager?.delegate = self
        setupSearch()
        setupTableView()
        configureInformationView()
        title = "Productos"
    }
    
    func configureInformationView() {
        add(informationView)
        informationView.showStartSearching()
    }
    
    func setupTableView() {
        resulstTableView.registerNib(cellClass: ProductTableViewCell.self)
        resulstTableView.rowHeight = UITableView.automaticDimension
        resulstTableView.estimatedRowHeight = 80
    }
    
    func setupSearch() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar en MercadoLibre"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.delegate = self
    }
    
    func setProductManager(productManager:ProductManager) {
        self.productManager = productManager
    }
}

extension SearchViewController: ProductManagerDelegate {
    func productsLoaded(products:Products) {
        self.results = products.items!
        
        DispatchQueue.main.async { [weak self] in
            self?.resulstTableView.reloadData()
        }
    }
    
    func productsLoadFailed() {
        DispatchQueue.main.async { [weak self] in
            self?.informationView.showError()
            self?.informationView.view.isHidden = false
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        informationView.loading()
        productManager?.getProducts(name: searchBar.searchTextField.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        results = [Product]()
        DispatchQueue.main.async { [weak self] in
            self?.resulstTableView.reloadData()
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if results.count > 0 {
            informationView.view.isHidden = true
            return 1
        }
        
        if !isSearchBarEmpty {
            informationView.showEmptyResults()
        } else {
            informationView.showStartSearching()
        }
        informationView.view.isHidden = false
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withClass: ProductTableViewCell.self) else {
            assertionFailure("Failed to dequeue \(ProductTableViewCell.self)!")
            return UITableViewCell()
        }
        
        cell.setupCell(product: results[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.coordinator?.showProductDetail(product: results[indexPath.row])
    }
}



 

