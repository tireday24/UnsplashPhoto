//
//  SearchPhotoCollectionViewCell.swift
//  UnsplashPhoto
//
//  Created by 권민서 on 2022/10/27.
//

import UIKit

import SnapKit
import Then

final class SearchPhotoCollectionViewCell: UICollectionViewCell {
    
    
    private var imageView = UIImageView().then {
        $0.backgroundColor = .systemGray6
        $0.contentMode = .scaleAspectFit
    }
    
    private var likesLabel = UILabel().then {
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 13, weight: .medium)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureHierachy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureHierachy() {
        contentView.addSubview(imageView)
        contentView.addSubview(likesLabel)
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        likesLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(20)
            make.leading.equalTo(imageView.snp.trailing).offset(8)
        }
    }
    
    
    func setData(_ data: Results) {
        likesLabel.text = "Likes : \(data.likes)"
        
        DispatchQueue.global().async {
            guard let url = URL(string: data.urls.thumb) else { return }
            let data = try? Data(contentsOf: url)
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data!)
            }
        }
    }
}

