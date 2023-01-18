//
//  GFFoodProperty.swift
//  FoodDelivery
//
//  Created by Afir Thes on 18.01.2023.
//

import UIKit

class GFBoolProperty: UIView {

    var title: String!

    let propertyTitle: UILabel = {
        let label = GFTitleLabel(textAlignment: .center, fontSize: 18)
        return label
    }()

    let propertySwitch: UISwitch = {
        let switcher = UISwitch(frame: .zero)
        return switcher
    }()

    override private init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(with title: String) {
        self.init(frame: .zero)
        propertyTitle.text = title
        self.title = title
    }

    private func configure() {

        [
            propertyTitle,
            propertySwitch
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }

        NSLayoutConstraint.activate([
            propertySwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            propertySwitch.topAnchor.constraint(equalTo: self.topAnchor),
            propertySwitch.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            propertySwitch.widthAnchor.constraint(equalToConstant: 40),

            propertyTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            propertyTitle.trailingAnchor.constraint(equalTo: propertySwitch.leadingAnchor),
            propertyTitle.heightAnchor.constraint(equalToConstant: 50),
            propertyTitle.centerYAnchor.constraint(equalTo: propertySwitch.centerYAnchor)
        ])

    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: super.intrinsicContentSize.width, height: 50)
    }

    func getValue() -> Bool {
        propertySwitch.isOn
    }

}
