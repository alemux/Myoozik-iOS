//
//  HomeModels.swift
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

enum Home
{
  // MARK: Use cases
    
    struct evidenza: Codable
    {
        var nome: String
        var titolo: String
        var cover: String
        var token: String
        var date_label: String
        var date_bgcolor: String
    }
    struct vetrinaband: Codable
    {
        var nome: String
        var cover: String
        var token: String
    }
    struct evento: Codable
    {
        var nome: String
        var dove: String
        var quando: String
        var orario: String
        var cover: String
        var token: String
    }
  
  enum FetchHome
  {
    struct Request
    {
        var lat: Double
        var lon: Double
    }
    struct Response: Codable
    {
        var evidenza: [evidenza]
        var vetrinaband: [vetrinaband]
        var eventi: [evento]
    }
    struct ViewModel
    {
        var evidenza: [evidenza]
        var vetrinaband: [vetrinaband]
        var eventi: [evento]
    }
  }
}