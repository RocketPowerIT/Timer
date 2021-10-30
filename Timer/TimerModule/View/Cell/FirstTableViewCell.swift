//
//  FirstSectionTableViewCell.swift
//  Timer
//
//  Created by mac on 18/09/2021.
//

import UIKit

//protocol FirstSectionTableViewCellDelegate {
//    func didFinishTapButton(name: String, duration: String)
//}

class FirstTableViewCell: UITableViewCell {
    static let identifire = "FirstSectionCell"
    
    var didFinishTapButton:((String,Int)->Void)?
    
    lazy var firstTF:UITextField = {
        let textField = createTextField()
        textField.placeholder = "Name ..."
        return textField
    }()
    
    lazy var secondTF:UITextField = {
        let textField = createTextField()
        textField.placeholder = "Duration in sec ..."
        textField.keyboardType = .decimalPad
        return textField
    }()
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        configureContents()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
       // contentView.heightAnchor.constraint(equalToConstant: contentView.bounds.height*1.2).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapButton() {
        didFinishTapButton!(firstTF.text!,(secondTF.text! as NSString).integerValue)
    }
    
    func configureContents() {
        contentView.addSubview(myStackView)
   
        myStackView.addArrangedSubview(firstTF)
        myStackView.addArrangedSubview(secondTF)
        myStackView.addArrangedSubview(button)

        NSLayoutConstraint.activate([
            myStackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: contentView.bounds.height),
            myStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            myStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -contentView.bounds.width/3),
            myStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    lazy var button:UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.backgroundColor = .systemGray
        return button
    }()
    
    lazy var myStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
       // stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        return stackView
    }()
  
    
    func createTextField()->UITextField{
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Title *"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }
}
