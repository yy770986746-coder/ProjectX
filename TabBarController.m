#import "TabBarController.h"
// Bypassed server auth version

@interface TabBarController ()
@property (nonatomic, strong) UINavigationController *accountNavController;
@property (nonatomic, strong) UILabel *networkStatusLabel;
@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ProjectXViewController *identityVC = [[ProjectXViewController alloc] init];
    MapTabViewController *mapVC = [[MapTabViewController alloc] init];
    SecurityTabViewController *securityVC = [[SecurityTabViewController alloc] init];
    SupportViewController *supportVC = [[SupportViewController alloc] init];
    
    UINavigationController *mapNav = [[UINavigationController alloc] initWithRootViewController:mapVC];
    UINavigationController *identityNav = [[UINavigationController alloc] initWithRootViewController:identityVC];
    UINavigationController *securityNav = [[UINavigationController alloc] initWithRootViewController:securityVC];
    UINavigationController *supportNav = [[UINavigationController alloc] initWithRootViewController:supportVC];
    
    mapNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"地图" image:[UIImage systemImageNamed:@"map.fill"] tag:0];
    identityNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage systemImageNamed:@"house.fill"] tag:1];
    securityNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"安全" image:[UIImage systemImageNamed:@"shield.checkerboard"] tag:2];
    supportNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"支持" image:[UIImage systemImageNamed:@"lifepreserver"] tag:3];
    
    self.viewControllers = @[mapNav, identityNav, securityNav, supportNav];
    self.selectedIndex = 1;
}

@end
