//
//  Hoshiimono.swift
//  HoshiimonoList
//
//  Created by 後藤和也 on 2020/08/21.
//  Copyright © 2020 gotokazuya. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
import NYXImagesKit

class Hoshiimono:Object {
    
    static let realm = try! Realm()
    @objc dynamic var title = ""
    @objc dynamic var name = ""
    @objc dynamic private var id = 0
    //コピペした物
    @objc dynamic private var _image: UIImage? = nil
    @objc dynamic var image: UIImage? {
      set{
        self._image = newValue
        if let value = newValue {
          self.imageData = value.pngData()! as NSData
        }
      }
      get{
        if let image = self._image {
          return image
        }
        if let data = self.imageData {
          self._image = UIImage(data: data as Data)
          return self._image
        }
        return nil
      }
    }
    @objc dynamic private var imageData: NSData? = nil
    override static func primaryKey() -> String? {
      return "id"
    }
    override static func ignoredProperties() -> [String] {
      return ["image", "_image"]
    }

    static func lastId() -> Int {
        if let object = realm.objects(Hoshiimono.self).last {
          return object.id + 1
        } else {
          return 1
        }
      }

    static func create() -> Hoshiimono {
        let diary = Hoshiimono()
        diary.id = lastId()
        return diary
      }
    
    func save(){
        try! Hoshiimono.realm.write{
            Hoshiimono.realm.add(self)
        }
    }
    
}
