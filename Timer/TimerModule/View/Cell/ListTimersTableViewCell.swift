//
//  TimerTableViewCell.swift
//  Timer
//
//  Created by mac on 16/09/2021.
//

import UIKit

class ListTimersTableViewCell: UITableViewCell {

    static let identifire = "TimerCell"
    lazy var nameLabel = createLabel()
    lazy var timerLabel = createLabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
         super.prepareForReuse()
     }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(timerLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCell()
    }
    
    fileprivate func configureCell(){
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(timerLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            timerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            timerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
  
        timerLabel.textAlignment = .right
    }
    
    var cellViewModel: CellViewModel? {
        didSet{
           // cellViewModel?.updateTimer()
            self.nameLabel.text = cellViewModel?.name
            self.timerLabel.text = cellViewModel?.timer
        }
    }
}

extension ListTimersTableViewCell {
    func makeLabel(size: CGFloat) -> UILabel {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .red
            label.font = UIFont.systemFont(ofSize: size)
            addSubview(label)
            return label
    }
    
    func createLabel() -> UILabel {
        let label = makeLabel(size: 20)
        label.numberOfLines = 0
        return label
    }
}
