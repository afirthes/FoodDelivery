//
//  PizzaConfigurationViewController.swift
//  FoodDelivery
//
//  Created by Afir Thes on 18.01.2023.
//

import UIKit

class PizzaConfigurationViewController: UIViewController {

    private let pizzaType: PizzaType

    private var pizzaProperties: [GFBoolProperty] = []

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let pizzaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let proceedButton: UIButton = {
        let button = GFButton(title: "Выбрать")
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    init(with pizzaType: PizzaType) {
        self.pizzaType = pizzaType
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        self.title = "Pizza"
        view.backgroundColor = .systemBackground

        switch pizzaType {
        case .margarita:
            pizzaImageView.image = UIImage(named: "margarita")

        case .pepperoni:
            pizzaImageView.image = UIImage(named: "pepperoni")
        }

        [
            pizzaImageView,
            stackView,
            proceedButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }

        NSLayoutConstraint.activate([

            pizzaImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pizzaImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pizzaImageView.widthAnchor.constraint(equalToConstant: 200),
            pizzaImageView.heightAnchor.constraint(equalToConstant: 200),

            stackView.topAnchor.constraint(equalTo: pizzaImageView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            proceedButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            proceedButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            proceedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            proceedButton.heightAnchor.constraint(equalToConstant: 60)

        ])

        self.pizzaProperties.append(GFBoolProperty(with: "Сыр моцарелла"))
        self.pizzaProperties.append(GFBoolProperty(with: "Ветчина"))
        self.pizzaProperties.append(GFBoolProperty(with: "Грибы"))
        self.pizzaProperties.append(GFBoolProperty(with: "Маслины"))

        pizzaProperties.forEach {
            stackView.addArrangedSubview($0)
        }

        proceedButton.addTarget(self, action: #selector(proceedTapped), for: .touchUpInside)
    }

    @objc
    func proceedTapped() {

        let foodProps = pizzaProperties.compactMap { boolProperty in
            if boolProperty.getValue() {
                return boolProperty.title
            } else {
                return nil
            }
        }

        var paymentList: [String] = []

        switch pizzaType {
        case .margarita:
            paymentList.append("Маргарита пицца")

        case .pepperoni:
            paymentList.append("Пепперони пицца")
        }

        paymentList.append(contentsOf: foodProps)

        let vc = PaymentViewController(with: paymentList)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
