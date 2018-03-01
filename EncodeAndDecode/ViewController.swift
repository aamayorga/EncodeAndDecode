//
//  ViewController.swift
//  EncodeAndDecode
//
//  Created by Ansuke on 3/1/18.
//  Copyright © 2018 AM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onSendPostTapped(_ sender: UIButton) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let newPost = Post(body: "This is encoding", id: 127, title: "Encoding stuff", userId: 55)
        
        do {
            let jsonBody = try JSONEncoder().encode(newPost)
            request.httpBody = jsonBody
        } catch {}
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let sentPost = try JSONDecoder().decode(Post.self, from: data)
                print(sentPost)
            } catch {}
        }
        task.resume()
    }
    
    
    @IBAction func onGetPostTapped(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, res, err) in
            guard let data = data else { return }
            guard let statusCode = res as? HTTPURLResponse else { return }
            print(statusCode.statusCode)
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                for user in users {
                    print(user.address.geo.lat)
                }
            } catch {}
        }
        task.resume()
    }
}

