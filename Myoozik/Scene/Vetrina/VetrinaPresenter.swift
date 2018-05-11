//
//  VetrinaPresenter.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 26/04/18.
//  Copyright (c) 2018 Mussini SAS. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol VetrinaPresentationLogic
{
  func presentSomething(response: Vetrina.Something.Response)
}

class VetrinaPresenter: VetrinaPresentationLogic
{
  weak var viewController: VetrinaDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Vetrina.Something.Response)
  {
    let viewModel = Vetrina.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}