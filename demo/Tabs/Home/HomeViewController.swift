//
//  HomeViewController.swift
//  demo
//
//  Created by hardip gajera on 04/06/23.
//

import UIKit

struct VideoData {
    let url: String
    let urlExtension: String
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [VideoData] = [
        VideoData(url: "https://assets.mixkit.co/videos/preview/mixkit-dog-catches-a-ball-in-a-river-1494-large.mp4", urlExtension: "mp4"),
        VideoData(url: "https://assets.mixkit.co/videos/preview/mixkit-music-and-coffee-in-the-morning-43372-large.mp4", urlExtension: "mp4"),
        VideoData(url: "https://assets.mixkit.co/videos/preview/mixkit-woman-cleaning-her-house-dancing-happy-43379-large.mp4", urlExtension: "mp4")
    ]
    
    let cellId = "HomeCell"
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if let cell = self.tableView.visibleCells.first as? HomeTableViewCell {
                cell.play()
            }
        }
    }
    
    func setUpUI() {
        tableView.translatesAutoresizingMaskIntoConstraints = false  // Enable Auto Layout
        tableView.isPagingEnabled = true
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomeTableViewCell
        let item = self.data[indexPath.row]
        cell.configure(
            url: URL(string: item.url)!,
            fileExtension: item.urlExtension,
            width: Int(tableView.frame.width),
            height: Int(tableView.frame.height)
        )
        cell.play()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? HomeTableViewCell{
            currentIndex = indexPath.row
            cell.pause()
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? HomeTableViewCell {
            cell.pause()
        }
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let cell = self.tableView.cellForRow(at: IndexPath(row: self.currentIndex, section: 0)) as? HomeTableViewCell
        cell?.replay()
    }
    
}
