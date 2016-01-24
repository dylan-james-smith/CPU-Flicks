//
//  DetailViewController.swift
//  MovieViewer
//
//  Created by Dylan Smith on 1/23/16.
//  Copyright © 2016 dylan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var overviewLable: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var detailsView: UIView!
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let title = movie["title"] as! String
        titleLable.text = title
        
        let overview = movie["overview"] as! String
        overviewLable.text = overview
        overviewLable.sizeToFit()
        
     //Set Detail View size to fit so scroll height shows all details
        detailsView.frame.size.height = overviewLable.frame.size.height + 75
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width , height: detailsView.frame.origin.y + detailsView.frame.size.height)
        
        let baseUrl = "https://image.tmdb.org/t/p/w342"
        if let posterPath = movie["poster_path"] as? String{
            let imageUrl = NSURL(string: baseUrl + posterPath)
            posterImageView.setImageWithURL(imageUrl!)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
