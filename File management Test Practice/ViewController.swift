//
//  ViewController.swift
//  File management Test Practice
//
//  Created by Dhiraj on 6/5/23.
//

import UIKit

class ViewController: UIViewController {

    
    func  makeUrl() -> URL{
        
        let manager = FileManager.default
        // let url = URL(string: "/Users/dhiraj/Desktop")?.appendingPathComponent("NewFolder")
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        print(url)
        print(url?.path)
        return url!
    }
    
    func makeNewFolder(url: URL) -> URL{
        let newFolderName = "YogiNewFolder"
        let newFolderURL = url.appendingPathComponent(newFolderName)
        
        let manager = FileManager.default
        try? manager.createDirectory(at: newFolderURL,
                                     withIntermediateDirectories: true,
                                     attributes:  [:])
        print("New Folder Created !!!!")
        return newFolderURL
    }
    
    func makeNewFile(url:URL){
        
        let fileUrl = url.appendingPathComponent("NewFile.txt")
        
        let manager = FileManager.default
        let str = "Put Anything Here !!!!!!!"
        let data = str.data(using: .utf8)
        manager.createFile(atPath: fileUrl.path, contents: data, attributes: [FileAttributeKey.creationDate : Date()])
        print("New File Created !!!!")
    }
    
    func deleteFile(url: URL){
        let manager = FileManager.default
        if manager.fileExists(atPath: url.path){
            try? manager.removeItem(at:url)
            print("Folder Deleted Successfully !!!!!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = makeUrl()
        let filePath = makeNewFolder(url: url)
        makeNewFile(url: filePath)
        
        //deleteFile(url: filePath)
    }


}

