//
//  FirestoreManager.swift
//  Buman
//
//  Created by Sergey Volkov on 21.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct FirestoreManager {
    enum FirestoreFolder: String {
        case tasks
        case users
    }
    enum TaskField : String{
        case id
        case createdTime
        case title
        case text
        case creatorID
    }
    
    static private let db = Firestore.firestore()
    
    static func addTaskListener(completion: @escaping([TaskModel])->Void) {
        db.collection(FirestoreManager.FirestoreFolder.tasks.rawValue)
            .order(by: FirestoreManager.TaskField.createdTime.rawValue)
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    completion(querySnapshot.documents.compactMap { document -> TaskModel? in
                        return try? document.data(as: TaskModel.self)
                    })
                }
        }
    }
    static func addTask(task: TaskModel) {
        do {
            try db.collection(FirestoreManager.FirestoreFolder.tasks.rawValue).document(task.id).setData(from: task)
        }
        catch {
            print("There was an error while trying to save a task \(error.localizedDescription).")
        }
    }
    static func removeTask(task: TaskModel) {
        db.collection(FirestoreManager.FirestoreFolder.tasks.rawValue).document(task.id).delete { (error) in // (1)
            if let error = error {
                print("Error removing document: \(error.localizedDescription)")
            }
        }
    }
    
}


