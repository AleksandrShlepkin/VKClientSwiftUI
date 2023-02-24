//
//  AppCoordinator.swift
//  VKClientSwiftUI
//
//  Created by Alex on 23.12.2021.
//

import SwiftUI
import Combine

class AppCoordinator:NSObject {
    var navigaionController: UINavigationController
    let loginViewModel: LoginViewModel = LoginViewModel()
    let webViewModel: WebViewModel = WebViewModel()
    
    private var disboseBag : Set<AnyCancellable> = []
    
    
    override init() {
        let loginView = LoginView(viewModel: loginViewModel)
        let loginViewController = UIHostingController(rootView: loginView)
        navigaionController = UINavigationController(rootViewController: loginViewController)
    }
    
    func goToMainTab() {
        self.loginViewModel.$userIsLogged
            .sink { [unowned self ] isLogged in
                if isLogged == false {
                    self.navigaionController.popToRootViewController(animated: true)
                } else {
                    let vc = UIHostingController(rootView: VKWebView())
                    self.navigaionController.pushViewController(vc, animated: true)
                }
                
            }
            .store(in: &disboseBag)
            
    }
    
}
