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
        //let image = UIImage(named: "person")
       
        let smallConfig = UIImage.SymbolConfiguration(scale: .medium)
        let image = UIImage(systemName: "camera", withConfiguration: smallConfig)
        
        let imageView = UIImageView()
        //imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.frame.size.width = 50
       // imageView.frame.size.height = 50
       // imageView.center = self.view.center
        imageView.layer.cornerRadius = Metric.buttonHeight / 2
        imageView.layer.masksToBounds = true
        
        imageView.image = image
        return imageView
    }()
    
    // Header
    private lazy var headerStackView = createHorizontalStackView(Metric.stackSpacing)
    private lazy var imageStackView = createHorizontalStackView(Metric.stackSpacing)
    private lazy var emptyStackView = createHorizontalStackView(Metric.stackSpacing)
    private lazy var textStackView = createVerticalStackView()
    
    private lazy var nameLabel = createLabel(with: "Алексей Павлов", titleColor: .white, fontSize: 20)
    private lazy var mainStatusLabel = createLabel(with: "Установить статус", titleColor: .systemBlue, fontSize: 15)
    private lazy var networkStatusLabel = createLabelWithIcon(with: "online", titleColor: .systemGray, fontSize: 14, icon: "network", iconPosition: "right")
   // private lazy var emptyStatusLabel = createLabel(with: "3333333", titleColor: .systemGray, fontSize: 14)
    
    // Buttons
    private lazy var buttonsStackView = createHorizontalStackView(Metric.stackSpacing)
    private lazy var editButton = createButton(with: "Редактировать", titleColor: .white, backgroundColor: .darkGray)
    
    // Icons
    private lazy var iconsStackView = createHorizontalStackView(Metric.stackSpacing)
    private lazy var historyIcon = createIcon(with: "История", icon: "history")
    private lazy var recordIcon = createIcon(with: "Запись", icon: "record")
    private lazy var photoIcon = createIcon(with: "Фото", icon: "photo")
    private lazy var clipIcon = createIcon(with: "Клип", icon: "clip")
    
    //Info
    private lazy var infoStackView = createVerticalStackView()
    private lazy var cityText = createAdditionalInfo(with: "Город: Москва", textColor: .lightGray)
    private lazy var followersText = createAdditionalInfo(with: "35 подписчиков", textColor: .lightGray)
    private lazy var jobText = createAdditionalInfo(with: "Указать место работы", textColor: .lightGray)
    private lazy var presentText = createAdditionalInfo(with: "Получить подарок", textColor: .lightGray)
    private lazy var infoText = createAdditionalInfo(with: "Подробная информация", textColor: .lightGray)
    
    // MARK: - Main
    // MAIN
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
        infoStackView.addArrangedSubview(infoText)
    }
    
    private func setupLayout() {
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Metric.leftOffset).isActive = true
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Metric.rightOffset).isActive = true
        parentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Metric.buttomOffset).isActive = true
        headerStackView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight).isActive = true
        buttonsStackView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight).isActive = true
        iconsStackView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight).isActive = true
        infoStackView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight).isActive = true
    
       }
    
    // MARK: - Functions
    
    private func createHorizontalStackView(_ spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = spacing //.15
        return stackView
    }
    
    private func createVerticalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    
    private func createIcon(with title: String, icon: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: Metric.iconFontSize, weight: .light)
        label.textColor = Metric.iconFontColor
        label.textAlignment = .center
        return label
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
        stackView.axis = .vertical
        stackView.spacing = Metric.parentStackViewSpacing
        stackView.distribution = .fillEqually
            
    
        
        let smallConfig = UIImage.SymbolConfiguration(scale: .small)
        //let image = UIImage(systemName: icon, withConfiguration: smallConfig)
        let image = UIImage(systemName: "custom.wifi", withConfiguration: smallConfig)
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 1
        imageView.layer.masksToBounds = true
        imageView.image = image
        
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: fontSize, weight: .light)
        label.textColor = titleColor
        label.textAlignment = .left
        
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

    private func createAdditionalInfo(with title: String, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: Metric.iconFontSize, weight: .light)
        label.textColor = textColor
        label.textAlignment = .left
        return label
    }

}

// MARK: - Constants
extension ViewController {
    
    enum Metric {
        
        static let iconFontSize: CGFloat = 15
        static let iconFontColor: UIColor = .systemBlue
        static let infoFontSize: CGFloat = 20
        static let stackSpacing: CGFloat = 15
        
        
        
        
        static let buttonHeight: CGFloat = 75
        static let parentStackViewSpacing: CGFloat = 30
        static let buttonsStackViewSpacing: CGFloat = 15
        static let resultFontSize: CGFloat = 70
        static let buttonFontSize: CGFloat = 30
        
        static let leftOffset: CGFloat = 18
        static let rightOffset: CGFloat = -18
        static let buttomOffset: CGFloat = -350
        
    }
    
    enum Strings {
        
    }
}

