//
//  ViewController.m
//  WeakAssociatedObject
//
//  Created by Jiang LinShan on 2023/6/14.
//

#import "ViewController.h"
#import "NSObject+Weak.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSObject* categaryObj = NSObject.new;
    {
        UILabel* label = UILabel.new;
        /// label超出作用域，会自动释放。
        [categaryObj setWeakAssObject:label];
    }
    NSLog(@"weakObj:%@",[categaryObj weakAssObject]);
}


@end
