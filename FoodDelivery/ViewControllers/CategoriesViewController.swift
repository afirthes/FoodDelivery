//
//  CategoriesViewController.swift
//  FoodDelivery
//
//  Created by Afir Thes on 18.01.2023.
//

import UIKit

class CategoriesViewController: UIViewController {

    let pizzaCategoryButton: UIButton = {
        let button = GFButton(title: "Pizza")
        return button
    }()

    let sushiCategoryButton: UIButton = {
        let button = GFButton(title: "Sushi")
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .systemBackground

        [
            pizzaCategoryButton,
            sushiCategoryButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }

        NSLayoutConstraint.activate([

            pizzaCategoryButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pizzaCategoryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pizzaCategoryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pizzaCategoryButton.heightAnchor.constraint(equalToConstant: 200),

            sushiCategoryButton.topAnchor.constraint(equalTo: pizzaCategoryButton.bottomAnchor, constant: 20),
            sushiCategoryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sushiCategoryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sushiCategoryButton.heightAnchor.constraint(equalToConstant: 200)

        ])

        pizzaCategoryButton.addTarget(self, action: #selector(pizzaAction), for: .touchUpInside)
    }

    @objc
    func pizzaAction() {
        let vc = PizzaCategoryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
