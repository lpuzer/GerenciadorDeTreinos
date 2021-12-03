//
//  TrainingRepository.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 01/12/21.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class TrainingRepository: ObservableObject {
    
    private let path:String = "Training"
    private let db = Firestore.firestore()
    @Published var mainModel: [MainModel] = []
    
    init() {
        getTraining()
    }
    
    func getTraining() {
        if let userId = Auth.auth().currentUser?.uid {
            db.collection(path)
                .order(by: "createdTime")
                .whereField("userId", isEqualTo: userId)
                .addSnapshotListener{ (snapshot, error) in
                    if let snapshot = snapshot {
                        self.mainModel = snapshot.documents.compactMap { document in
                            do {
                                let x = try document.data(as: MainModel.self)
                                return x
                            }
                            catch {
                                print(error)
                            }
                            return nil
                        }
                    }
                }
        } else {
            print("There is no user")
        }
    }
    
    
    func addTraining(_ mainModel: MainModel) {
        do {
            var addedTraining = mainModel
            addedTraining.userId = Auth.auth().currentUser?.uid
            _ = try db.collection(path).addDocument(from: addedTraining)
        } catch {
            fatalError("Adding the training failed")
        }
    }
    
    
    func removeTraining(_ mainModel: MainModel) {
        if let mainModelID = mainModel.id {
            db.collection(path).document(mainModelID).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
        }
    }
    
    
    func updateTraining(_ mainModel: MainModel) {
        if let documentID = mainModel.id {
            do {
                try db.collection(path).document(documentID).setData(from: mainModel)
            } catch {
                fatalError("Document failed to update")
            }
        }
    }
    
}


