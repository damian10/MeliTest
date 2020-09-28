//
//  Coordinator.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/27/20.
//
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}


class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window:UIWindow) {
        self.navigationController = navigationController
        self.window = window
        window.rootViewController = self.navigationController
    }

    func start() {
        let vc = SearchViewController.instantiate()
        vc.coordinator = self
        vc.setProductManager(productManager: ProductManager(delegate: vc, apiClient: APIClient(requestBuilder: RequestBuilder())))
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showProductDetail(product:Product) {
        let vc = DetailViewController.instantiate()
        vc.coordinator = self
        vc.product = product
        navigationController.pushViewController(vc, animated: true)
    }
}
