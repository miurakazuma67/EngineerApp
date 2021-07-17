//
//  AddTaskViewController.swift
//  EngineerApp
//
//  Created by 三浦　一真 on 2021/07/13.
//

import UIKit

final class AddTaskViewController: UIViewController {
    
    private var addTaskView = AddTaskView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(addTaskView)
        addTaskView.addTaskDelegate = self
    }
    
}

extension AddTaskViewController: AddTaskDelegate {
    func plusTapped() {
//        let task = TaskViewController.instantiate(
//            didSelect: { [weak self]  task in
//                self?.dismiss(animated: true)
//            }
//        )
//
//        let nav = UINavigationController(rootViewController: task)
//        present(nav, animated: true)
        
        let task = self.storyboard?.instantiateViewController(withIdentifier: "Task") as! TaskViewController
        self.present(task, animated: true, completion: nil)
    }
    
}
