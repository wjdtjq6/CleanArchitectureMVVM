////
////  AppDelegate.swift
////  CleanArchitectureMVVM
////
////  Created by 소정섭 on 3/14/25.
////
//
//import UIKit
//import CoreData
//
//@main
//class AppDelegate: UIResponder, UIApplicationDelegate {
//    var window: UIWindow?
//    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        
//        let rootViewController = ViewController()
//        window?.rootViewController = rootViewController
//        window?.makeKeyAndVisible()
//        
//        return true
//    }
//    
//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "CleanArchitectureMVVM")
//        container.loadPersistentStores{ storeDescription, error in
//            if let error = error as NSError? {
//                fatalError("Core Data 스토어 로드 실패: \(error), \(error.userInfo)")
//            }
//        }
//        return container
//    }()
//    
//    func saveContext() {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("컨텍스트 저장 실패: \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
//}
