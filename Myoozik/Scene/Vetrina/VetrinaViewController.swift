//
//  VetrinaViewController.swift
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
import Hero

protocol VetrinaDisplayLogic: class
{
  func displaySomething(viewModel: Vetrina.Something.ViewModel)
}

class VetrinaViewController: UIViewController, VetrinaDisplayLogic
{
  var interactor: VetrinaBusinessLogic?
  var router: (NSObjectProtocol & VetrinaRoutingLogic & VetrinaDataPassing)?
    var panGR = UIPanGestureRecognizer()

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = VetrinaInteractor()
    let presenter = VetrinaPresenter()
    let router = VetrinaRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    self.view.setBackground(color: defaultDarkGray)
    let cover = VetrinaCircularView()
    cover.addTo(view: self.view).setSize(width: 40, height: 40).setPosition(top: 0, left: 0)
    self.hero.isEnabled = true
    cover.hero.id = "vetrina"
    self.panGR = UIPanGestureRecognizer(target: self, action: #selector(leftSwipeDismiss(gestureRecognizer:)))
    self.view.addGestureRecognizer(panGR)
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Vetrina.Something.Request()
    interactor?.doSomething(request: request)
    
    
  }
  
  func displaySomething(viewModel: Vetrina.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
    
    @objc func leftSwipeDismiss(gestureRecognizer:UIPanGestureRecognizer) {
        
        let translation = panGR.translation(in: nil)
        let progress = translation.x / 2 / view.bounds.width
        let gestureView = gestureRecognizer.location(in: self.view)
        
        switch panGR.state {
        case .began:
            
            if gestureView.x <= 30 {
                hero_dismissViewController()
            }
            
        case .changed:
            
            let translation = panGR.translation(in: nil)
            let progress = translation.x / 2 / view.bounds.width
            Hero.shared.update(progress)
            
        default:
            if progress + panGR.velocity(in: nil).x / view.bounds.width > 0.3 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
        
    }
}
