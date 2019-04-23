//
//  ProfileHeaderView.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class ProfileHeaderView: UIView {
  
  lazy var imageButton: UIButton = {
    let btn = UIButton()
    btn.imageView?.contentMode = .scaleAspectFit
    btn.layer.cornerRadius = 10
    btn.layer.masksToBounds = true
    return btn
  }()
  
  lazy var nameLabel: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont(name: Font.medium.rawValue, size: 24.widthProportion())
    lbl.numberOfLines = 0
    return lbl
  }()
  
  lazy var buttonsStack: ProfileHeaderButtonsStack = {
    let bs = ProfileHeaderButtonsStack()
    return bs
  }()
  

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    layer.cornerRadius = 10
    layer.shadowOffset = CGSize.zero
    layer.shadowOpacity = 0.1
    layer.shadowRadius = 4
    setupViews()
    setupConstraints()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setupViews(){
    [imageButton, nameLabel, buttonsStack].forEach {
      self.addSubview($0)
    }
  }
  
  fileprivate func setupConstraints() {
    imageButton.easy.layout(Top(20.heightProportion()),
                          Left(20.widthProportion()),
                          Size(130.widthProportion()))
    nameLabel.easy.layout(CenterY(0).to(imageButton),
                          Left(20.widthProportion()).to(imageButton),
                          Right(20.widthProportion()))
    buttonsStack.easy.layout(Bottom(10.heightProportion()),
                             CenterX(0),
                             Top(20.heightProportion()).to(imageButton))
  }

}
