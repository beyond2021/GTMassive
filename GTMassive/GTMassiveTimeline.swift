//
//  GTMassiveTimeline.swift
//  GTMassive
//
//  Created by KEEVIN MITCHELL on 4/21/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit

class GTMassiveTimeline: PFQueryTableViewController {
    
    let cellIdentifier:String = "GTCell"
    var postShown = [Bool](count: 25, repeatedValue: false)
    
    override init(style: UITableViewStyle, className: String!)
    {
        super.init(style: style, className: className)
        
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        self.objectsPerPage = 25
        
        self.parseClassName = className
        
        self.tableView.rowHeight = 350
        self.tableView.allowsSelection = false
    }
    
    required init(coder aDecoder:NSCoder)
    {
        fatalError("NSCoding not supported")  
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.registerNib(UINib(nibName: "GTTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func queryForTable() -> PFQuery {
        var query:PFQuery = PFQuery(className:self.parseClassName!)
        
        if(objects?.count == 0)
        {
            query.cachePolicy = PFCachePolicy.CacheThenNetwork
        }
        
        query.orderByAscending("name")
        
        return query
    }
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
       // let cellIdentifier:String = "Cell"
        
//        var cell:PFTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PFTableViewCell
//        
//        if(cell == nil) {
//            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
//        }
//        
//        if let pfObject = object {
//            cell?.textLabel?.text = pfObject["name"] as? String
//        }
//        
//        return cell;
//    }
        
        var cell:GTTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? GTTableViewCell
        
        if(cell == nil) {
            cell = NSBundle.mainBundle().loadNibNamed("GTTableViewCell", owner: self, options: nil)[0] as? GTTableViewCell
        }
        
        if let pfObject = object {
            cell?.gtNameLabel?.text = pfObject["name"] as? String
            
            var votes:Int? = pfObject["votes"] as? Int
            if votes == nil {
                votes = 0
            }
            cell?.gtVotesLabel?.text = "\(votes!) votes"
            
            var credit:String? = pfObject["cc_by"] as? String
            if credit != nil {
                cell?.gtCreditLabel?.text = "\(credit!) / CC 2.0"
            }
            //Loading the image
            cell?.gtImageView?.image = nil
            if var urlString:String? = pfObject["url"] as? String {
                var url:NSURL? = NSURL(string: urlString!)
                
                if var url:NSURL? = NSURL(string: urlString!) {
                    var error:NSError?
                    var request:NSURLRequest = NSURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReturnCacheDataElseLoad, timeoutInterval: 5.0)
                    
                    NSOperationQueue.mainQueue().cancelAllOperations()
                    
                    
//                    var imgURL: NSURL = NSURL(string: url!)!
//                    var request: NSURLRequest = NSURLRequest(URL: imgURL)
                    
                    NSURLConnection.sendAsynchronousRequest (request,
                        queue:NSOperationQueue.mainQueue(),
                        completionHandler: {
                            (response: NSURLResponse!, data: NSData!,error: NSError!) -> Void in
                            if error == nil {
                                dispatch_async(dispatch_get_main_queue(), {
                                    // No point making an image unless the 'cont' exists
                                //    cont?(UIImage(data: data))
                                    cell?.gtImageView?.image = UIImage(data: data)
                                    return
                                })
                            }
                            else { println ("Error") }
                    })
//                    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
//                        (response:NSURLResponse!, imageData:NSData!, error:NSError!) -> Void in
//                        
//                        cell?.gtImageView?.image = UIImage(data: imageData)
//                        
//                    })
                }
            }
            
            
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
       
        if postShown[indexPath.row] {
            return;
        }
       
        postShown[indexPath.row] = true
        
        
        // Define the initial state (Before the animation)
        let rotationAngleInRadians = 90.0 * CGFloat(M_PI/180.0);
               let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
       // cell.layer.transform = rotationTransform;
                cell.layer.transform = rotationTransform;
        // Define the final state (After the animation)
        UIView.animateWithDuration(1.0, animations: { cell.layer.transform = CATransform3DIdentity })
        
        
    }

    
    
    
}
