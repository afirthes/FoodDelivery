//
//  SceneDelegate.swift
//  FoodDelivery
//
//  Created by Afir Thes on 18.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let navigationController = UINavigationController()
        navigationController.pushViewController(LoginViewController(), animated: false)

        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window?.windowScene = windowScene
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()

        self.configureNavigationBar()
    }

    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }

}
