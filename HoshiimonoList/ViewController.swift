//
//  ViewController.swift
//  HoshiimonoList
//
//  Created by 後藤和也 on 2020/08/19.
//  Copyright © 2020 gotokazuya. All rights reserved.
//

import UIKit
import RealmSwift
import NYXImagesKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
      var HoshiiItems: Results<Hoshiimono>!
       @IBOutlet weak var table: UITableView!

    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "DetailTableViewCell", bundle: Bundle.main)
                table.register(nib, forCellReuseIdentifier: "cell")
        table.rowHeight=500
        
        
        
        
    
        
        table.dataSource = self
        let realm = try! Realm()
               HoshiiItems = realm.objects(Hoshiimono.self)

               table.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           table.reloadData()
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       HoshiiItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DetailTableViewCell
                cell.titleLabel.text = HoshiiItems[indexPath.row].name
        cell.URLTextView.text = HoshiiItems[indexPath.row].title
                cell.Picture.image=HoshiiItems[indexPath.row].image
        
        //let object = HoshiiItems[indexPath.row]
        //cell.textLabel?.text = object.name
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteHoshiimono(at:indexPath.row)
            table.reloadData()
        }
    }

    func deleteHoshiimono(at index: Int) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(HoshiiItems[index])
        }
    
    }

}

