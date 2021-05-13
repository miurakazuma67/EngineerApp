//
//  PostTableViewCell.swift
//  EngineerApp
//
//  Created by 三浦　一真 on 2020/12/09.
//

import UIKit
import RealmSwift
import SVProgressHUD

protocol PostTableViewCellDelegate: class {
    func deleteButtonTapped(index: IndexPath)
}

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }
    
    var index: IndexPath!
    weak var deletedelegate: PostTableViewCellDelegate?
    
    var count = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        dateLabel.textColor = UIColor.gray
    }
    
    // ReportDataの内容をセルに表示
    func setReportData(_ reportData: ReportData) {
        self.captionLabel.text = reportData.caption
        self.languageLabel.text = reportData.language
        self.hourLabel.text = reportData.hour
        self.minuteLabel.text = reportData.minute
        // 日時の表示
        self.dateLabel.text = ""
        if let date = reportData.date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateString = formatter.string(from: date)
            self.dateLabel.text = dateString
        }
    }
    
    @IBAction func handle(_ sender: Any) {
        deletedelegate?.deleteButtonTapped(index: index)
    }
}
