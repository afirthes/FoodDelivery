//
//  PizzaCategoryViewController.swift
//  FoodDelivery
//
//  Created by Afir Thes on 18.01.2023.
//

import UIKit

class PizzaCategoryViewController: UIViewController {

    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        self.title = "Pizza"
        view.addSubview(stackView)

        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])

        let margarita = GFFoodAddToCartButton(with: .margarita) {
            let vc = PizzaConfigurationViewController(with: .margarita)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let pepperoni = GFFoodAddToCartButton(with: .pepperoni) {
            let vc = PizzaConfigurationViewController(with: .pepperoni)
            self.navigationController?.pushViewController(vc, animated: true)
        }

        stackView.addArrangedSubview(margarita)
        stackView.addArrangedSubview(pepperoni)
    }

}
