//
//  SidebBarViewController.h
//  eMagidOgram
//
//  Created by KEEVIN MITCHELL on 4/7/15.
//
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
@interface SidebBarViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;

@end
