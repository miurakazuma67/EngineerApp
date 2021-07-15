//
//  AddTaskViewController.swift
//  EngineerApp
//
//  Created by 三浦　一真 on 2021/07/13.
//

import UIKit

final class AddTaskViewController: UIViewController {
    
    private var addTaskView: AddTaskView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(addTaskView)
    }
    
}

extension AddTaskViewController: AddTaskDelegate {
    func plusTapped() {
        let task = TaskViewController.instantiate(
            didSelect: { [weak self] in
                self?.dismiss(animated: true)
            }
        )
    }
    
}