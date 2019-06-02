
import Foundation
import Firebase
import FirebaseAuth

class FireBaseManager {
    
    static let shares = FireBaseManager()
    let db = Firestore.firestore()
    
    var currentUid: String? {
        return Auth.auth().currentUser?.uid
    }
    
    let currentId = "currentUser"
    
    // 用这个存数据
    func saveGameTime(time: Int, tag: String, score: Int){
        let data = [Consts.time : time,
                    Consts.tag : tag,
                    Consts.score:score
            ] as [String : Any]
        
        db.collection("users").document(currentId).collection(Consts.gameTime).document().setData(data)
    }
    
    // 用这个取数据
    func getGameTime(completion:@escaping ([[String:Any]])->Void){
        
        var dict = [[String:Any]]()
        
        db.collection(Consts.users).document(currentId).collection(Consts.gameTime).getDocuments { (QuerySnapshot, err) in
            if let err = err{
                print("failed to get doc:\(err)")
            }
            else{
                for document in QuerySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let data = document.data()
                    let tag = data[Consts.tag]
                    let time = data[Consts.time]
                    let score = data[Consts.score]
                    let result = [Consts.tag:tag,
                                  Consts.time: time,
                                  Consts.score: score
                        ] as [String : Any]
                    dict.append(result)
                }
                
                completion(dict)
            }
        }
        
    }
    
    func saveAwards(_ award: Int){
        let data = [Consts.award : award
            ] as [String : Any]
        
        self.db.collection("users").document(self.currentId).collection(Consts.awards).document().setData(data)
        
        
    }
    
    func getAwards(completion:@escaping ([Int])->Void){
        
        var awards = [Int]()
        db.collection(Consts.users).document(currentId).collection(Consts.awards).getDocuments { (QuerySnapshot, err) in
            if let err = err{
                print("failed to get doc:\(err)")
            }
            else{
                for document in QuerySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let data = document.data()
                    let award = data[Consts.award]
                    if let award = award{
                        awards.append(award as! Int)
                    }
                    
                }
                
                completion(awards)
            }
        }
    }
    
    
    
    struct Consts {
        static let users = "users"
        static let gameTime = "gameTime"
        static let tag = "tag"
        static let time = "time"
        static let score = "score"
        static let awards = "awards"
        static let award = "award"
        
        
    }
    
    
    
    
    
    
}

