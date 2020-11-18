//
//  ViewController.swift
//  PhotoSelect
//
//  Created by anny on 2020/11/18.
//  Copyright © 2020 anny. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // 按下 Select 按鈕後需要執行選取圖片
    @IBAction func selectPhoto(_ sender: UIButton) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        
        let alertController = UIAlertController(title: "選擇開啟圖片方式", message: "", preferredStyle: .actionSheet)
        
        let photoAlert = UIAlertAction(title: "從相簿開啟", style: .default) { (_) in
            pickerController.sourceType = .savedPhotosAlbum
            self.present(pickerController, animated: true, completion: nil)
        }
        
        let cameraAlert = UIAlertAction(title: "從相機拍攝", style: .default) { (_) in
            pickerController.sourceType = .camera
            self.present(pickerController, animated: true, completion: nil)
        }
            
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        alertController.addAction(photoAlert)
        alertController.addAction(cameraAlert)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        if let image = image{
            imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
}

