//
//  RegisterViewController.swift
//  HoshiimonoList
//
//  Created by 後藤和也 on 2020/08/19.
//  Copyright © 2020 gotokazuya. All rights reserved.
//

import UIKit
import RealmSwift
import Realm
import NYXImagesKit

class RegisterViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //変数の設置
    var HoshiimonoList = [String]()
    
    
    
    @IBOutlet weak var URLTextField: UITextField!
    @IBOutlet weak var pictureLabel: UILabel!
    @IBOutlet weak var URLLabel: UILabel!
    @IBOutlet weak var pictureButton: UIButton!
    @IBOutlet weak var HoshiimonoLabel: UILabel!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var HoshiimonoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        URLTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.originalImage] as! UIImage
        picture.image = selectedImage
        
        picker.dismiss(animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func selectImage(){
        let actionController = UIAlertController(title: "画像の選択", message: "選択して下さい", preferredStyle:.actionSheet)
        let cameraAction = UIAlertAction(title: "カメラ", style: .default) { (action) in
            //カメラの起動
            if UIImagePickerController.isSourceTypeAvailable(.camera)==true{
                
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
            }else{
                print("この機種ではカメラを使用することができません")
            }
        }
        
            let albumAction = UIAlertAction(title: "フォトライブラリ", style: .default) { (action) in
            //アルバムの起動
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
        
        
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { (cancel) in
            //キャンセルのコード
            actionController.dismiss(animated: true, completion: nil)
        }
        actionController.addAction(cameraAction)
        actionController.addAction(albumAction)
        actionController.addAction(cancelAction)
        self.present(actionController, animated: true, completion: nil)
        
        
    }
    
    @IBAction func AddButten(_ sender: Any) {
        
        let todo = Hoshiimono.create()
        todo.title = URLTextField.text!
        todo.name = HoshiimonoTextField.text!
        let image = picture.image
        let resizeImage = image?.scale(byFactor: 0.1)
        todo.image = resizeImage
        todo.save()
        
        
        //let realm = try! Realm()
//        let todo = Hoshiimono()
//
//            todo.title = URLTextField.text!
//            todo.name = HoshiimonoTextField.text!
//        let image = picture.image
//        let resizeImage = image?.scale(byFactor: 0.1)
//        todo.image = resizeImage
//        do{
//            let realm = try Realm()
//            try realm.write({ () -> Void in
//                realm.add(todo)
//            })
//        } catch {
//
//        }
//            try! realm.write {
//            realm.add(todo)
//
//            }
            self.navigationController?.popViewController(animated: true)
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.HoshiimonoTextField.resignFirstResponder()
             self.URLTextField.resignFirstResponder()
             return true
         }
       
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
