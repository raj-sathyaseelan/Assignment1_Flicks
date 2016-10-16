//
//  NowPlayingDetailViewController.swift
//  Flicks
//
//  Created by Raj Sathyaseelan on 10/15/16.
//  Copyright © 2016 Token. All rights reserved.
//

import UIKit
import AFNetworking

class NowPlayingDetailViewController: UIViewController {
    
    @IBOutlet weak var flickDetailScrollView: UIScrollView!
    @IBOutlet weak var flickOverviewLabel: UILabel!
    @IBOutlet weak var flickImageView: UIImageView!
    @IBOutlet weak var flickTitleLabel: UILabel!
    var flick: Flick!

    @IBOutlet weak var infoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.flickOverviewLabel.text = flick.overview
        flickOverviewLabel.sizeToFit()
        self.flickTitleLabel.text = flick.title
        
        if let post = flick.posterPathHighRes {
            self.flickImageView.setImageWith(URL(string: post)!)
        }
        
        let contentWidth = flickDetailScrollView.frame.size.width
        let contentHeight = infoView.frame.origin.y + infoView.frame.height
        
        flickDetailScrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
