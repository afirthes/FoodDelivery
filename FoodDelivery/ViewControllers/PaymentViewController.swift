//
//  PaymentViewController.swift
//  FoodDelivery
//
//  Created by Afir Thes on 18.01.2023.
//

import UIKit

class PaymentViewController: UIViewController {

    let yourOrderLabel: UILabel = {
        let label = GFTitleLabel(textAlignment: .center, fontSize: 22)
        label.text = "Ваш заказ:"
        return label
    }()

    let itemsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }()

    let paymentStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()

    let payButton: UIButton = {
        let button = GFButton(title: "Pay")
        return button
    }()

    private var items: [String] = []

    init(with items: [String]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        self.title = "Payment"
        view.backgroundColor = .systemBackground

        [
            yourOrderLabel,
            itemsStack,
            paymentStack,
            payButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }

        NSLayoutConstraint.activate([

            yourOrderLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            yourOrderLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            yourOrderLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            itemsStack.topAnchor.constraint(equalTo: yourOrderLabel.bottomAnchor, constant: 10),
            itemsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            payButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            payButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            payButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            payButton.heightAnchor.constraint(equalToConstant: 60),

            paymentStack.bottomAnchor.constraint(equalTo: payButton.topAnchor, constant: -12),
            paymentStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            paymentStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        items.forEach {
            let label = GFBodyLabel(textAlignment: .center)
            label.text = $0
            itemsStack.addArrangedSubview(label)
        }

        paymentStack.addArrangedSubview(GFBoolProperty(with: "Оплата картой"))
        paymentStack.addArrangedSubview(GFBoolProperty(with: "Оплата наличными"))

        payButton.addTarget(self, action: #selector(payTapped), for: .touchUpInside)
    }

    @objc
    func payTapped() {
        presentGFAlertOnMainThread(title: "Заказ оплачен", message: "Ваш заказ доставят в течении 15ти минут\nПриятного аппетита!", buttonTitle: "Ok")
    }

}
