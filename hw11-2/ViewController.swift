//
//  ViewController.swift
//  ios-HW11
//
//  Created by Ayrat on 08.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    private lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Metric.parentStackViewSpacing
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    
    private lazy var photoImageView: UIImageView = {
        let image = UIImage(named: "person")
       
        let imageView = createImageView()
        imageView.layer.cornerRadius = Metric.buttonHeight / 2
        imageView.image = image

        return imageView
    }()
    
    private lazy var headerStackView = createStackViewHorizontal()
    private lazy var imageStackView = createStackViewHorizontal()
    private lazy var emptyStackView = createStackViewHorizontal()
    private lazy var textStackView = createStackViewVertical()
    
    private lazy var nameLabel = createLabelView(with: "Алексей Павлов", titleColor: .white, fontSize: 20)
    private lazy var mainStatusLabel = createLabelView(with: "Установить статус", titleColor: .systemBlue, fontSize: 15)
    private lazy var networkStatusLabel = createLabelWithIconView(with: "online", titleColor: .systemGray, fontSize: 14, icon: "network", iconPosition: "right")

    private lazy var buttonsStackView = createStackViewHorizontal()
    private lazy var editButton = createButton(with: "Редактировать", titleColor: .white, backgroundColor: .darkGray)
    
    // MARK: - icons
    private lazy var iconsStackView = createStackViewHorizontal()
    private lazy var historyIcon = createIconWithTextView(with: "История", icon: "camera")
    private lazy var recordIcon = createIconWithTextView(with: "Запись", icon: "note")
    private lazy var photoIcon = createIconWithTextView(with: "Фото", icon: "photo")
    private lazy var clipIcon = createIconWithTextView(with: "Клип", icon: "play.rectangle")
    
    // MARK: - Info
    private lazy var infoStackView = createStackViewVertical()
    private lazy var cityText = createLabelWithIconView(with: "Город: Москва", titleColor: Metric.infoTextColor, fontSize: 13, icon: "house.fill", iconPosition: "left")
    private lazy var followersText = createLabelWithIconView(with: "35 подписчиков", titleColor: Metric.infoTextColor, fontSize: 13, icon: "network", iconPosition: "left")
    private lazy var jobText = createLabelWithIconView(with: "Указать место работы", titleColor: Metric.infoTextColor, fontSize: 13, icon: "bag", iconPosition: "left")
    private lazy var presentText = createLabelWithIconView(with: "Получить подарок", titleColor: Metric.infoTextColor, fontSize: 13, icon: "snowflake", iconPosition: "left")
    
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
        addSubViews(with: parentStackView, sub: [headerStackView, buttonsStackView, iconsStackView, infoStackView])
        addSubViews(with: headerStackView, sub: [imageStackView, textStackView, emptyStackView])
        imageStackView.addArrangedSubview(photoImageView)
        addSubViews(with: textStackView, sub: [nameLabel, mainStatusLabel, networkStatusLabel])
        addSubViews(with: buttonsStackView, sub: [editButton])
        addSubViews(with: iconsStackView, sub: [historyIcon, recordIcon, photoIcon, clipIcon])
        addSubViews(with: infoStackView, sub: [cityText, followersText, jobText, presentText])
    }
    
    
    private func setupLayout() {
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Metric.leftOffset),
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Metric.rightOffset),
        parentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Metric.buttomOffset),
        
        headerStackView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight),
        headerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Metric.leftOffset),
        headerStackView.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Metric.rightOffset),
        
        buttonsStackView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight),
        
        iconsStackView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight),
        
        infoStackView.heightAnchor.constraint(equalToConstant: Metric.infoHeight),
        
        infoStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Metric.leftOffset),
        infoStackView.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Metric.rightOffset),
        ])

       }
    
    // MARK: - Functions
    
    /**
     * Add subview into main view
     */
    private func addSubViews(with main: UIStackView, sub: [UIStackView]) {
        for subView in sub {
            main.addArrangedSubview(subView)
        }
    }
    
    private func createStackViewVertical() -> UIStackView {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.alignment = .leading
        
        return stackView
    }
    
    private func createStackViewHorizontal() -> UIStackView {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = Metric.stackSpacing
        return stackView
    }
    
    
    private func createIconWithTextView(with title: String, icon: String) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
       
        let smallConfig = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: icon, withConfiguration: smallConfig)
        
        let imageView = createImageView()
        imageView.image = image
        stackView.addArrangedSubview(imageView)
        
        let label = createLabel(with: title, titleColor: Metric.iconFontColor, fontSize: Metric.iconFontSize, position: Position.center)
        stackView.addArrangedSubview(label)

        return stackView
    }
    
    private func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }
    
    private func createLabelView(with title: String, titleColor: UIColor, fontSize: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        let label =  createLabel(with: title, titleColor: titleColor, fontSize: fontSize, position: Position.left)
        stackView.addArrangedSubview(label)

        return stackView
    }
    
    private func createLabel(with title: String, titleColor: UIColor, fontSize: CGFloat, position: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: fontSize, weight: .light)
        label.textColor = titleColor
        label.textAlignment = position

        return label
    }
    
    /**
     * Create icons with text
     */
    private func createLabelWithIconView(with title: String, titleColor: UIColor, fontSize: CGFloat, icon: String, iconPosition: String) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
       
        let smallConfig = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: icon, withConfiguration: smallConfig)
        
        let imageView = createImageView()
        
        imageView.image = image
        stackView.addArrangedSubview(imageView)
    
        let label = createLabel(with: title, titleColor: Metric.iconFontColor, fontSize: Metric.iconFontSize, position: Position.left)
        stackView.addArrangedSubview(label)
        
        // оставить так для наглядности
        if iconPosition == "right" {
            stackView.addArrangedSubview(label)
            stackView.addArrangedSubview(imageView)
        } else {
            stackView.addArrangedSubview(imageView)
            stackView.addArrangedSubview(label)
        }
        
        return stackView
    }
    
    private func createButton(with title: String, titleColor: UIColor, backgroundColor: UIColor) -> UIStackView {
        let stackView = UIStackView()
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Metric.buttonFontSize, weight: .medium)
        button.backgroundColor = backgroundColor
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Metric.buttonHeight / 2
        button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1).isActive = true
        stackView.addArrangedSubview(button)
        return stackView
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
    
    enum Position {
        static let center: NSTextAlignment = .center
        static let left: NSTextAlignment = .left
    }
}

