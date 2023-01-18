//
//  GFFoodAddToCartButton.swift
//  FoodDelivery
//
//  Created by Afir Thes on 18.01.2023.
//

import UIKit

enum PizzaType {
    case margarita
    case pepperoni
}

class GFFoodAddToCartButton: UIView {

    private var pizzaType: PizzaType?
    private var tapClosure: (() -> Void)?

    let pizzaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "margarita")
        return imageView
    }()

    let pizzaNameLabel: UILabel = {
        let label  = GFTitleLabel(textAlignment: .left, fontSize: 28)
        label.text = "Маргарита"
        return label
    }()

    let pizzaPlusButton: UIButton = {
       let button = UIButton()
        let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
        let boldSearch = UIImage(systemName: "plus", withConfiguration: boldConfig)

        button.setImage(boldSearch, for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 10
        return button
    }()

    override private init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    convenience init(with pizzaType: PizzaType, on tap: @escaping () -> Void ) {
        self.init(frame: .zero)
        self.pizzaType = pizzaType
        self.tapClosure = tap

        switch pizzaType {
        case .margarita:
            pizzaImageView.image = UIImage(named: "margarita")
            pizzaNameLabel.text = "Маргарита"
        case .pepperoni:
            pizzaImageView.image = UIImage(named: "pepperoni")
            pizzaNameLabel.text = "Пепперони"
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {

        [
            pizzaImageView,
            pizzaNameLabel,
            pizzaPlusButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }

        NSLayoutConstraint.activate([
            pizzaImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pizzaImageView.topAnchor.constraint(equalTo: self.topAnchor),
            pizzaImageView.widthAnchor.constraint(equalToConstant: 100),
            pizzaImageView.heightAnchor.constraint(equalToConstant: 100),

            pizzaPlusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pizzaPlusButton.centerYAnchor.constraint(equalTo: pizzaImageView.centerYAnchor),
            pizzaPlusButton.heightAnchor.constraint(equalToConstant: 40),
            pizzaPlusButton.widthAnchor.constraint(equalToConstant: 40),

            pizzaNameLabel.leadingAnchor.constraint(equalTo: pizzaImageView.trailingAnchor, constant: 10),
            pizzaNameLabel.trailingAnchor.constraint(equalTo: pizzaPlusButton.leadingAnchor),
            pizzaNameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            pizzaNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        pizzaPlusButton.addTarget(self, action: #selector(onPlusTap), for: .touchUpInside)
    }

    @objc
    private func onPlusTap() {
        guard let tapClosure = tapClosure else { return }
        tapClosure()
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: super.intrinsicContentSize.width, height: 100)
    }

}
