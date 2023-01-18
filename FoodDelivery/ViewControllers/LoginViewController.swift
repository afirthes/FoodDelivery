//
//  ViewController.swift
//  FoodDelivery
//
//  Created by Afir Thes on 18.01.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")

        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true

        return imageView
    }()

    let loginTextField: UITextField = {
        let textField = GFTextField()
        return textField
    }()

    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login:"
        return label
    }()

    let passwordTextField: UITextField = {
        let textField = GFTextField()
        return textField
    }()

    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password:"
        return label
    }()

    let loginButton: UIButton = {
        let button = GFButton(title: "Login")
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func setupUI() {
        view.backgroundColor = .systemBackground

        [
            logoImageView,
            loginLabel,
            loginTextField,
            passwordLabel,
            passwordTextField,
            loginButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }

        NSLayoutConstraint.activate([

            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),

            loginLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 100),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),

            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 8),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginTextField.heightAnchor.constraint(equalToConstant: 40),

            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 12),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),

            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),

            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 120),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120)

        ])

        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
    }

    @objc
    func loginAction() {
        let vc = CategoriesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
