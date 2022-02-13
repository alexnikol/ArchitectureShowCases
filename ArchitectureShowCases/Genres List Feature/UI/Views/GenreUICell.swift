//
//  GenreUICell.swift
//  ArchitectureShowCases
//
//  Created by Alexander Nikolaychuk on 13.02.2022.
//

import UIKit

class GenreUICell: UITableViewCell {

    var didTap: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapAction))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {}
    
    @objc
    private func didTapAction() {
        didTap?()
    }
}
