//
//  TopRatedTableViewController.swift
//  Flicks
//
//  Created by Raj Sathyaseelan on 10/16/16.
//  Copyright © 2016 Token. All rights reserved.
//

import UIKit
import AFNetworking
import VHUD

class TopRatedTableViewController: UITableViewController {
    
    
    var Flicks = [Flick]()
    
    @IBOutlet weak var errorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(refreshControlAction(refreshControl:)), for: UIControlEvents.valueChanged)
        
        // add refresh control to table view
        self.tableView.insertSubview(refreshControl, at: 0)
        
        refreshControlAction(refreshControl: refreshControl)
        
        //self.tableView.rowHeight = 300
        self.tableView.delegate = self
        self.errorView.isHidden = true
    }
    
    func refreshControlAction(refreshControl: UIRefreshControl) {
        
        var content = VHUDContent(.loop(3.0))
        content.loadingText = "Loading.."
        content.completionText = "Finish!"
        
        VHUD.show(content)
        
        let clientId = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let baseURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(clientId)"
        
        
        print(baseURL)
        let url = URL(string: baseURL)!
        
        let request = URLRequest(url: url)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate: nil,
            delegateQueue: OperationQueue.main
        )
        
        let task : URLSessionDataTask = session.dataTask(with: request, completionHandler: { (dataOrNil, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
                
                print("error")
                
                
                for case let label as UILabel in self.errorView.subviews {
                    label.text = "Network Error"
                    self.errorView.isHidden = false
                }
                
            }
            
            if let data = dataOrNil {
                if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options:[]) as? NSDictionary {
                    NSLog("response: \(responseDictionary)")
                    
                    self.errorView.isHidden = true
                    
                    
                    if let flicksDict = responseDictionary.value(forKey: "results") as? [NSDictionary] {
                        
                        for flick in flicksDict {
                            
                            let flickModel = Flick()
                            
                            if let title = flick.value(forKey: "title") as? String {
                                flickModel.title = title
                            }
                            
                            if let originalTitle = flick.value(forKey: "original_title") as? String {
                                flickModel.originalTitle = originalTitle
                            }
                            
                            if let overview = flick.value(forKey: "overview") as? String {
                                flickModel.overview = overview
                            }
                            
                            if let posterPath = flick.value(forKey: "poster_path") as? String {
                                flickModel.posterPath = posterPath
                            }
                            
                            if let backdropPath = flick.value(forKey: "backdrop_path") as? String {
                                flickModel.backDropPath = backdropPath
                            }
                            
                            if let popularity = flick.value(forKey: "popularity") as? Double {
                                flickModel.popularity = popularity
                            }
                            
                            if let releaseDate = flick.value(forKey: "release_date") as? Date {
                                flickModel.releaseDate = releaseDate
                            }
                            
                            if let voteCount = flick.value(forKey: "vote_count") as? Int {
                                flickModel.voteCount = voteCount
                            }
                            
                            if let voteAverage = flick.value(forKey: "vote_average") as? Double {
                                flickModel.voteAverage = voteAverage
                            }
                            
                            self.Flicks.append(flickModel)
                            
                        }
                        
                        
                    }
                    
                    
                    
                }
                
            }
            
            self.tableView.reloadData()
            refreshControl.endRefreshing()
            VHUD.dismiss(1.0, 1.0)
            
        });
        
        
        task.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Flicks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NowPlayingTableViewCell", for: indexPath) as! NowPlayingTableViewCell
        
        // Configure the cell...
        let flickModel = Flicks[indexPath.row]
        let post = flickModel.posterPathHighRes
        
        if  post!.isEmpty {
            cell.flickImageView.image = nil
        }
        else {
            cell.flickImageView.setImageWith(URL(string: post!)!)
        }
        
        cell.flickTitleLabel.text = flickModel.originalTitle
        cell.flickDescTextView.text = flickModel.overview
        cell.flickTitleLabel.sizeToFit()
        cell.flickDescTextView.sizeToFit()
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let np = segue.destination as! NowPlayingDetailViewController
        let index = self.tableView.indexPath(for: sender as! UITableViewCell)
        
        if let row = index?.row {
            
            //to fix the row path
            np.flick = Flicks[(row)]
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
