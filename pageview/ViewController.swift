//
//  ViewController.swift
//  pageview
//
//  Created by hiraoka on 2020/03/03.
//  Copyright © 2020 hiraoka. All rights reserved.
//

import UIKit
import Instantiate
import InstantiateStandard
extension ViewController: StoryboardInstantiatable {
    public struct Dependency {
        var title: String
        var body: String
    }
    
    public func inject(_ dependency: Dependency) {
        self.titleText = dependency.title
        self.bodyText = dependency.body
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    private var titleText: String!
    private var bodyText: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.text = titleText
        bodyLabel.text = bodyText
    }


}

class PageViewController: UIPageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers([ViewController(with: .init(title: "first", body: "first"))],
                           direction: .forward,
                           animated: true)
        self.dataSource = self
    }
}

extension PageViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        ViewController(with: .init(title: "before", body: "before"))
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        ViewController(with: .init(title: "after", body: "after"))
    }
    
    
}
