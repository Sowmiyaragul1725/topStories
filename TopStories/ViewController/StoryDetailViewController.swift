//
//  StoryDetailViewController.swift
//  TopStories
//
//  Created by SowmiyaRagul on 22/08/23.
//

import UIKit
import Foundation

class StoryDetailViewController : UIViewController {
    //MARK: Outlets
    @IBOutlet weak var storiesImageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var captionLabel: UILabel?
    
    //MARK: Local Variable
    var storyDetail: Stories?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius()
        navigationItem.title = Title.storyDetailTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setStoryDetail()
    }
    
    //MARK: Injection
    static func create(storyDetail: Stories) -> StoryDetailViewController {
        let viewController: StoryDetailViewController = StoryDetailViewController.init(nibName: "\(StoryDetailViewController.self)", bundle: nil)
        viewController.storyDetail = storyDetail
        return viewController
    }
    
    //MARK: UISetUp
    func setCornerRadius() {
        storiesImageView?.layer.cornerRadius = 10.0
    }
}

//MARK: SetStoryDetails
extension StoryDetailViewController {
    func setStoryDetail() {
        titleLabel?.text = storyDetail?.title ?? ""
        captionLabel?.text = storyDetail?.multimedia?.first?.caption ?? ""
        if let multiMediaFirstImage = storyDetail?.multimedia?.first?.url {
            storiesImageView?.load(urlString: multiMediaFirstImage)
        }
    }
}
