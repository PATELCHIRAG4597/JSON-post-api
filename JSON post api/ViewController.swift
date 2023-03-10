//
//  ViewController.swift
//  JSON post api
//
//  Created by CodeInfoWay CodeInfoWay on 3/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let objUser = User()
        objUser.registerUser()
    }
    struct Endpoint
    {
        static let registerUser  = "http://api-dev-scus-demo.azurewebsites.net/api/User/RegisterUser"
        static let getUser =
        "http://api-dev-scus-demo.azurewebsites.net/api/User/GetUser"
    }
    struct User
    {
        func registerUser()
        {
            var urlRequest = URLRequest(url:URL(string: Endpoint.registerUser)!)
            urlRequest.httpMethod = "post"
            let dataDictionary  = ["name":"chirag","email":"patelchitag4597@gmail.com","password":"1234"]
            do {
                let requestBody = try JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted)
                urlRequest.httpBody = requestBody
                urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
                
            } catch let error {
                debugPrint(error.localizedDescription)
            }
            URLSession.shared.dataTask(with: urlRequest){(data,HTTPURLResponse,error) in
                if (data != nil && data?.count != 0)
                {
                    let responce = String(data: data!, encoding: .utf8)
                    debugPrint(responce!)
                }
            }.resume()
        }
    }
}



























