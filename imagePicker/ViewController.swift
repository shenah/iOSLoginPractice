//
//  ViewController.swift
//  imagePicker
//
//  Created by 503-03 on 21/11/2018.
//  Copyright © 2018 shenah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func pick(_ sender: Any) {
        let imagepicker = UIImagePickerController()
        imagepicker.allowsEditing = true
        //미리 촬영한 사진가져오기
        imagepicker.sourceType = .photoLibrary
        //화면에 출력
        self.present(imagepicker, animated: true)
        //delegate 위치 설정
        imagepicker.delegate = self
    }
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //취소를 눌렀을 때 호출되는 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        self.dismiss(animated: false){
            () in
            let alert = UIAlertController(title: "선택취소", message: "사진선택", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel){
                (alert) in
            })
            self.present(alert, animated: true)
        }
    }
    //사진을 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: false){
            let img = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
            self.image.image = img
            
        }
    }
}

