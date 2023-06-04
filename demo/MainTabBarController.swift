//
//  ViewController.swift
//  demo
//
//  Created by hardip gajera on 03/06/23.
//

import UIKit

class MainTabBarController: UIViewController {
    
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var controllerView: UIView!

    var currentViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpComponents()
    }
    
    func setUpUI() {
        tabBarView.roundCorners([.topLeft, .topRight], radius: 12)
        self.view.bringSubviewToFront(tabBarView)
    }
    
    func setUpComponents() {
        DispatchQueue.main.async {
            self.tabBarButtonDidTapped(UIButton())
        }
    }
    
    @IBAction func tabBarButtonDidTapped(_ sender: UIButton) {
        currentViewController?.remove()
        switch sender.tag {
        case 0:
            let vc = HomeViewController()
            self.currentViewController = vc
            self.add(vc, frame: self.controllerView.frame)
        case 1:
            let vc = EmptyViewController()
            self.currentViewController = vc
            self.add(vc, frame: self.controllerView.frame)
        case 2:
            let vc = EmptyViewController()
            self.currentViewController = vc
            self.add(vc, frame: self.controllerView.frame)
        case 3:
            let vc = EmptyViewController()
            self.currentViewController = vc
            self.add(vc, frame: self.controllerView.frame)
        case 4:
            let vc = EmptyViewController()
            self.currentViewController = vc
            self.add(vc, frame: self.controllerView.frame)
        default:
            let vc = EmptyViewController()
            self.currentViewController = vc
            self.add(vc, frame: self.controllerView.frame)
        }
    }

}


@nonobjc extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)

        if let frame = frame {
            child.view.frame = frame
        }

        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
