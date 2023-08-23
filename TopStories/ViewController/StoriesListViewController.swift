//
//  ViewController.swift
//  TopStories
//
//  Created by SowmiyaRagul on 22/08/23.
//

import UIKit

class StoriesListViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var storiesListTableView: UITableView?
    
    //MARK: Local Variable
    var storiesViewModel: StoriesViewModel?
    var stories: [Stories]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        storiesViewModel = StoriesViewModel(apiManager: APIManager())
        registerTableViewCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadStories()
    }
    
    //MARK: RegisterCell
    func registerTableViewCell() {
        let nib = UINib(nibName: Constants.storiesTableViewCell, bundle: nil)
        storiesListTableView?.register(nib, forCellReuseIdentifier: Constants.storiesTableViewCell)
        storiesListTableView?.estimatedRowHeight = UITableView.automaticDimension
        storiesListTableView?.delegate = self
        storiesListTableView?.dataSource = self
    }
}

//MARK: API Call
extension StoriesListViewController {
    func loadStories() {
            storiesViewModel?.loadStoriesList(completion: { [weak self] stories, error in
            guard error == nil else {
                return
            }
                self?.stories = stories?.results
            DispatchQueue.main.async {
                self?.storiesListTableView?.reloadData()
            }
        })
    }
}

//MARK: Navigation
extension StoriesListViewController {
    func navigateToStoryDetailPage(storyDetail: Stories?) {
        if let detail = storyDetail {
            let storyViewController = StoryDetailViewController.create(storyDetail: detail)
            self.navigationController?.pushViewController(storyViewController, animated: true)
        }
    }
}

//MARK: TableView Cell
extension StoriesListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.storiesTableViewCell, for: indexPath) as? StoriesTableViewCell {
            if let detail = self.stories?[indexPath.row] {
                cell.setStoriesDetail(storiesDetail: detail)
                cell.selectionStyle = .none
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let storyDetail = stories?[indexPath.row] {
            navigateToStoryDetailPage(storyDetail: storyDetail)
        }
    }
}
