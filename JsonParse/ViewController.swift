//
//  ViewController.swift
//  JsonParse
//
//  Created by DuNT on 28/01/2022.
//

import UIKit
import Foundation

struct Category: Codable {
    let id: Int
    let title: String
    let subCategories: [SubCategory]
}

struct SubCategory: Codable {
    let id: Int
    let title: String
    let infomations: [Infomation]
}

struct Infomation: Codable {
    let id: Int
    let text: String
    let images: [String]
    let imageNames: [String]
}

class ViewController: UIViewController {
    
    @IBOutlet var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path = Bundle.main.path(forResource: "HC", ofType: "json") else { return }
        
        do {
            let jsonData = try String.init(contentsOfFile: path).data(using: .utf8)
            let decodedData = try JSONDecoder().decode(Category.self, from: jsonData!)
            decodedData.subCategories.forEach({ subCategory in
                myLabel.text = subCategory.infomations.last?.text
            })
        } catch let error {
            print("error: \(error)")
        }
        
    }
}
