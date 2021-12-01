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
        db.collection(path)
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
    }
    
    
    func addTraining(_ mainModel: MainModel) {
        do {
            _ = try db.collection(path).document().setData(from: mainModel)
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
        do {
            try db.collection(path).document().setData(from: mainModel)
        } catch {
            fatalError("Document failed to update")
        }
    }

}

