//
//  ImagePickerViewController.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class ImagePickerViewController: UIViewController {
  
  let conn = Connection()
    
  lazy var imageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    return iv
  }()
  
  var imagePicker: ImagePicker!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    view.addSubview(imageView)
    imageView.easy.layout(Center(0),
                          Size(Screen.width))
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeVC))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editPhoto))
    navigationItem.title = "Profile Image"
    self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    imageView.image = conn.getProfileImage()
  }
  
  @objc func closeVC() {
    self.dismiss(animated: true, completion: nil)
  }
  
  @objc func editPhoto() {
    self.imagePicker.present()
  }
  
}

extension ImagePickerViewController: ImagePickerDelegate {
  
  func didSelect(image: UIImage?) {
    self.imageView.image = image
    conn.addProfileImage(image: image!)
  }
  

}
