//
//  ViewController.swift
//  uploadPhotos
//
//  Created by arbe on 2020/12/7.
//  Copyright © 2020 arbe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
    @IBOutlet weak var imageView: UIImageView!
    
    // show image when finish picking
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        imageView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func uploadButton(_ sender: Any) {
        // show Alert
        present(uploadFrom(), animated: true, completion: nil)
    }
    
    // SelectPhoto delegate -> UIImagePickerController
    func selectPhoto() {
        let controller = UIImagePickerController()
        
        controller.sourceType = .photoLibrary
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Alert
    func uploadFrom() -> UIAlertController {
        let controller = UIAlertController(
            title: "照片",
            message: "選擇照片來源",
            preferredStyle: .alert)
        
        let photoGallery = UIAlertAction(
        title: "照片圖庫", style: .default) { (_) in
            print("從照片圖庫選圖片")
            self.selectPhoto()
        }
        controller.addAction(photoGallery)
        
        let camera = UIAlertAction(
        title: "照相", style: .default) { (_) in
            print("拍攝照片")
            // 這要實機操作
        }
        controller.addAction(camera)
        
        return controller
    }
}

