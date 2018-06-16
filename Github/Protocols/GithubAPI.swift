//
//  GithubAPI.swift
//  Github
//
//  Created by myMac on 16/06/18.
//  Copyright © 2018 Love. All rights reserved.
//

import RxSwift

let ClientId = "e407ec5fc69d4fde1521"
let ClientSecret = "3e4c658781c1af3bc33cdf9abb029acc8c55cc9a"

protocol GitHubAPI {
    
    func login(username: String, password: String) -> Bool
}
