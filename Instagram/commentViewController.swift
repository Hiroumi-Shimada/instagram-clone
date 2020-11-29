//
//  commentViewController.swift
//  Instagram
//
//  Created by Hiroumi Shimada on 2020/10/07.
//  Copyright © 2020 Hiroumi Shimada. All rights reserved.
//

import UIKit
import Firebase

class commentViewController: UIViewController {
    var recievePostdata:PostData!
    
    
    @IBOutlet weak var commentField: UITextField!
    @IBAction func sendComment(_ sender: Any) {
        //        let homeViewController:HomeViewController = segue.destination as! HomeViewController
        
        let postRef = Firestore.firestore().collection(Const.PostPath).document(recievePostdata.id)
        var updateComment: FieldValue
        if let comment = recievePostdata.commentData{
            updateComment = FieldValue.arrayUnion(["\(recievePostdata.name!) : \(comment + commentField.text!)"])
        } else {
           updateComment = FieldValue.arrayUnion(["\(recievePostdata.name!) : \(commentField.text!)"])
        }
//        updateComment = FieldValue.arrayUnion(["\(recievePostdata.name!) : \(recievePostdata.commentData!)"])
//        let updateComment = commentField.text!
//        self.commentField.text = "\(recievePostdata.name!) : \(recievePostdata.commentData!)"
        postRef.updateData(["commentField": updateComment])
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
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
