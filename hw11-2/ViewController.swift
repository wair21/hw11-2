//
//  ViewController.swift
//  ios-HW11
//
//  Created by Ayrat on 08.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    // Main stackView
    private lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Metric.parentStackViewSpacing
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    
    private lazy var image: UIImageView = {
        let image = UIImage(named: "person")
        let imageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.layer.cornerRadius = Metric.buttonHeight / 2
        imageView.layer.masksToBounds = true
        
        imageView.image = image
        return imageView
    }()
    
    // Header
    private lazy var headerStackView = createStackView(Strings.stackViewModeHorizontal)
    private lazy var imageStackView = createStackView(Strings.stackViewModeHorizontal)
    private lazy var emptyStackView = createStackView(Strings.stackViewModeHorizontal)
    private lazy var textStackView = createStackView(Strings.stackViewModeVertical)
    
    private lazy var nameLabel = createLabel(with: "Алексей Павлов", titleColor: .white, fontSize: 20)
    private lazy var mainStatusLabel = createLabel(with: "Установить статус", titleColor: .systemBlue, fontSize: 15)
    private lazy var networkStatusLabel = createLabelWithIcon(with: "online", titleColor: .systemGray, fontSize: 14, icon: "network", iconPosition: "right")

    
    // Buttons
    private lazy var buttonsStackView = createStackView(Strings.stackViewModeHorizontal)
    private lazy var editButton = createButton(with: "Редактировать", titleColor: .white, backgroundColor: .darkGray)
    
    // Icons
    private lazy var iconsStackView = createStackView(Strings.stackViewModeHorizontal)
    private lazy var historyIcon = createIconWithText(with: "История", icon: "camera")
    private lazy var recordIcon = createIconWithText(with: "Запись", icon: "note")
    private lazy var photoIcon = createIconWithText(with: "Фото", icon: "photo")
    private lazy var clipIcon = createIconWithText(with: "Клип", icon: "play.rectangle")
    
    //Info
    private lazy var infoStackView = createStackView(Strings.stackViewModeVertical)
    private lazy var cityText = createLabelWithIcon(with: "Город: Москва", titleColor: Metric.infoTextColor, fontSize: 13, icon: "house.fill", iconPosition: "left")
    private lazy var followersText = createLabelWithIcon(with: "35 подписчиков", titleColor: Metric.infoTextColor, fontSize: 13, icon: "custom.wifi", iconPosition: "left")
    private lazy var jobText = createLabelWithIcon(with: "Указать место работы", titleColor: Metric.infoTextColor, fontSize: 13, icon: "bag", iconPosition: "left")
    private lazy var presentText = createLabelWithIcon(with: "Получить подарок", titleColor: Metric.infoTextColor, fontSize: 13, icon: "snowflake", iconPosition: "left")
    //private lazy var infoText = createLabelWithIcon(with: "Подробная информация", titleColor: Metric.infoTextColor, fontSize: 13, icon: "info.circle.fill", iconPosition: "left")
    
    // MARK: - Main
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupView() {
        
    }
    
    private func setupHierarchy() {
        view.addSubview(parentStackView)
        parentStackView.addArrangedSubview(headerStackView)
        parentStackView.addArrangedSubview(buttonsStackView)
        parentStackView.addArrangedSubview(iconsStackView)
        parentStackView.addArrangedSubview(infoStackView)
        

        // Header
        headerStackView.addArrangedSubview(imageStackView)
        headerStackView.addArrangedSubview(textStackView)
        headerStackView.addArrangedSubview(emptyStackView)
        imageStackView.addArrangedSubview(image)
        textStackView.addArrangedSubview(nameLabel)
        textStackView.addArrangedSubview(mainStatusLabel)
        textStackView.addArrangedSubview(networkStatusLabel)
        //emptyStackView.addArrangedSubview(emptyStatusLabel)
        
        // Button
        buttonsStackView.addArrangedSubview(editButton)
        
        // Icons
        iconsStackView.addArrangedSubview(historyIcon)
        iconsStackView.addArrangedSubview(recordIcon)
        iconsStackView.addArrangedSubview(photoIcon)
        iconsStackView.addArrangedSubview(clipIcon)
        
        // Info
        infoStackView.addArrangedSubview(cityText)
        infoStackView.addArrangedSubview(followersText)
        infoStackView.addArrangedSubview(jobText)
        infoStackView.addArrangedSubview(presentText)
        //infoStackView.addArrangedSubview(infoText)
    }
    
    private func setupLayout() {
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Metric.leftOffset).isActive = true
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Metric.rightOffset).isActive = true
        parentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Metric.buttomOffset).isActive = true
        headerStackView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight).isActive = true
        buttonsStackView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight).isActive = true
        iconsStackView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight).isActive = true
        infoStackView.heightAnchor.constraint(equalToConstant: Metric.infoHeight).isActive = true
    
       }
    
    // MARK: - Functions
    
    private func createStackView(_ mode: String) -> UIStackView {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        
        if mode == Strings.stackViewModeHorizontal {
            stackView.axis = .horizontal
            stackView.spacing = Metric.stackSpacing
        } else {
            stackView.axis = .vertical
        }
        
        return stackView
    }
    
    
    private func createIconWithText(with title: String, icon: String) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
       
        let smallConfig = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: icon, withConfiguration: smallConfig)
        
        // icon image
        let imageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.image = image
        stackView.addArrangedSubview(imageView)
        
        // icpn text
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: Metric.iconFontSize, weight: .light)
        label.textColor = Metric.iconFontColor
        label.textAlignment = .center
        stackView.addArrangedSubview(label)

        return stackView
        
    }
    
    private func createLabel(with title: String, titleColor: UIColor, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: fontSize, weight: .light)
        label.textColor = titleColor
        label.textAlignment = .left
        return label
    }
    
    private func createLabelWithIcon(with title: String, titleColor: UIColor, fontSize: CGFloat, icon: String, iconPosition: String) -> UIStackView {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
       
        let smallConfig = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: icon, withConfiguration: smallConfig)
        
        // icon image
        let imageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit

        imageView.layer.masksToBounds = true
        imageView.image = image
        stackView.addArrangedSubview(imageView)
        
        // icon text
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: Metric.iconFontSize, weight: .light)
        label.textColor = Metric.iconFontColor
        label.textAlignment = .left
        stackView.addArrangedSubview(label)
        
        if iconPosition == "right" {
            stackView.addArrangedSubview(label)
            stackView.addArrangedSubview(imageView)
        } else {
            stackView.addArrangedSubview(imageView)
            stackView.addArrangedSubview(label)
        }
        
        return stackView
    }
    
    private func createButton(with title: String, titleColor: UIColor, backgroundColor: UIColor) -> UIButton {
    
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Metric.buttonFontSize, weight: .medium)
        button.backgroundColor = backgroundColor
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Metric.buttonHeight / 2
        button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1).isActive = true
        return button
    }

}

// MARK: - Constants
extension ViewController {
    
    enum Metric {
        
        static let iconFontSize: CGFloat = 15
        static let iconFontColor: UIColor = .systemBlue
        static let infoTextColor: UIColor = .lightGray
        static let infoFontSize: CGFloat = 20
        static let stackSpacing: CGFloat = 15
        
        static let buttonHeight: CGFloat = 75
        static let infoHeight: CGFloat = 100
        
        static let parentStackViewSpacing: CGFloat = 20
        static let buttonsStackViewSpacing: CGFloat = 15
    
        static let buttonFontSize: CGFloat = 30
        
        static let leftOffset: CGFloat = 18
        static let rightOffset: CGFloat = -18
        static let buttomOffset: CGFloat = -300
        
    }
    
    enum Strings {
        static let stackViewModeHorizontal: String = "horizontal"
        static let stackViewModeVertical: String = "vertical"
    }
}

