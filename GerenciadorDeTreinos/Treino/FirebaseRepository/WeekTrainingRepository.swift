//
//  WeekTrainingRepository.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 03/12/21.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class WeekTrainingRepository: ObservableObject {
    private let path:String = "WeekTraining"
    private let db = Firestore.firestore()
    @Published var weekTraining: [WeekTraining] = []
    
    init() {
        getWeekTraining()
    }
    
    func getWeekTraining() {
            db.collection(path)
                .addSnapshotListener{ (snapshot, error) in
                    if let snapshot = snapshot {
                        self.weekTraining = snapshot.documents.compactMap { document in
                            do {
                                let x = try document.data(as: WeekTraining.self)
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
    
    
    
    func addWeekTraining(_ weekTraining: WeekTraining) {
        do {
            var addedTraining = weekTraining
            addedTraining.userId = Auth.auth().currentUser?.uid
            _ = try db.collection(path).addDocument(from: addedTraining)
        } catch {
            fatalError("Adding the training failed")
        }
    }
    
    
    func removeTraining(_ weekTraining: WeekTraining) {
        if let mainModelID = weekTraining.id {
            db.collection(path).document(mainModelID).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
        }
    }
    
    
    func updateTraining(_ weekTraining: WeekTraining) {
        if let documentID = weekTraining.id {
            do {
                try db.collection(path).document(documentID).setData(from: weekTraining)
            } catch {
                fatalError("Document failed to update")
            }
        }
    }
    
}


