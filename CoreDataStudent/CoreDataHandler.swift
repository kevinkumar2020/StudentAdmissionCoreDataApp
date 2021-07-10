//
//  CoreDataHandler.swift
//  CoreDataStudent
//
//  Created by JinalGangani on 08/07/21.
//

import Foundation

import CoreData
import UIKit

class CoreDataHandler{
    static let shared = CoreDataHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var mangedObjectContext: NSManagedObjectContext?
    
    
    private init()
    {
        mangedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func saveContext()
    {
        appDelegate.saveContext()
    }
    
    func insert(name:String, age:Int, classes:String, completion: @escaping () -> Void)  {
        let stud = Student(context: mangedObjectContext!)
        stud.name = name
        stud.age  = Int32(age)
        stud.classes = classes
        
        saveContext()
        completion()
    }
    
    func update(stud:Student, name:String, age:Int, classes:String, completion: @escaping () -> Void)  {
       
        stud.name = name
        stud.age  = Int32(age)
        stud.classes = classes
        
        saveContext()
        completion()
    }
    
    func fetchData() -> Array<Student>
    {
        let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
        
        do{
            let stud = try mangedObjectContext?.fetch(fetchRequest)
            return stud!
        } catch {
            
            print(error.localizedDescription)
            
            let stud = Array<Student>()
            return stud
        }
    }
    
    func deleteData(for stud:Student, completion: @escaping() ->Void){
        mangedObjectContext!.delete(stud)
        saveContext()
        completion()
        
    }
}

