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

class ChatList: UIViewController,UIGestureRecognizerDelegate{
    
    
    var chatArray = [ChatListData]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var chatTableList: UITableView!
    @IBOutlet weak var newChatCorner: UIButton!
    
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        chatTableList.delegate = self
        chatTableList.dataSource = self
        chatTableList?.register(UINib(nibName : "CustomListCell" , bundle : nil), forCellReuseIdentifier : "ChatCellClass")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        chatTableList.addGestureRecognizer(tapGesture)
        //loadChatList()
        
        newChatCorner.layer.cornerRadius = 20
        
    }
    
    
    func loadChatList(){
        
        let request : NSFetchRequest<ChatListData> = try ChatListData.fetchRequest()
        
        do{
            chatArray = try context.fetch(request)
        }catch{
            print("Fetch request error : \(error)")
        }
        
        chatTableList.reloadData()
        
    }
    
    
    
    @IBAction func newChat(_ sender: Any) {
        var textField = UITextField()
        let alert =   UIAlertController.init(title: "New Chat with:", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add New Chat", style: .default) { (action) in
            let newChat = ChatListData(context: self.context)
            newChat.chatName = textField.text!
            self.chatArray.append(newChat)
            self.saveChat()
            
        }
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Chat"
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveChat(){
        
        do{
            try context.save()
        }catch{
            print("Error saving context \(error)")
        }
        chatTableList.reloadData()
    }
    
    
}





extension ChatList : UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = chatTableList.dequeueReusableCell(withIdentifier: "ChatCellClass", for: indexPath) as! ChatCellClass
        cell.userName.text = chatArray[indexPath.row].chatName
        return cell
    }
    
    @objc func tableViewTapped(_ sender: Any){
        // use the tag of button as index
        
        performSegue(withIdentifier: "GoToTexting", sender: self)
    }
    
    
}
