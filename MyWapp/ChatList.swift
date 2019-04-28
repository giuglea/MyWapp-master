//
//  ChatList.swift
//  MyWapp
//
//  Created by Andrei Giuglea on 21/03/2019.
//  Copyright © 2019 Andrei Giuglea. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ChatList: UIViewController,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate{
    
    var numberOfChats = [Int]()
    var chats = [String]()
    let context = (UIApplication.shared.delegate as! AppDelegate)
    
    @IBOutlet weak var chatTableList: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfChats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = chatTableList.dequeueReusableCell(withIdentifier: "ChatCellClass", for: indexPath) as! ChatCellClass
        return cell
    }
    
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        chatTableList.delegate = self
        chatTableList.dataSource = self
        chatTableList?.register(UINib(nibName : "CustomListCell" , bundle : nil), forCellReuseIdentifier : "ChatCellClass")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        chatTableList.addGestureRecognizer(tapGesture)
    }
    
    @objc func tableViewTapped(_ sender: Any){
        // use the tag of button as index
        
        performSegue(withIdentifier: "GoToTexting", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    @IBAction func newChat(_ sender: Any) {
      let alert =   UIAlertController.init(title: "New Chat with:", message: "", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Add New Chat", style: .default) { (action) in
            //let newChat = 
        }
    }
    
    
    
}
