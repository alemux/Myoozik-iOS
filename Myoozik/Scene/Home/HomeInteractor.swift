//
//  HomeInteractor.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 04/04/18.
//  Copyright (c) 2018 Mussini SAS. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeBusinessLogic
{
  func fetchData(request: Home.FetchHome.Request)
}

protocol HomeDataStore
{
  //var name: String { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore
{
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?


  //var name: String = ""
  
  // MARK: Do something
  
  func fetchData(request: Home.FetchHome.Request)
  {
    worker = HomeWorker()
    worker?.fetchHome(lat: request.lat, lon: request.lon) { (response) -> Void in
        
        if let response = response {
            self.presenter?.presentData(response: response)
        }
    }
    
    
  }
}