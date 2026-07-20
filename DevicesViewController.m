#import "DevicesViewController.h"
#import "APIManager.h"

@interface DevicesViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *devices;
@end

@implementation DevicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设备管理";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    
    [self loadDevices];
}

- (void)loadDevices {
    [[APIManager sharedManager] getUserDevices:^(NSArray *devices, NSInteger deviceLimit, NSError *error) {
        if (!error) {
            self.devices = devices;
            [self.tableView reloadData];
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.devices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeviceCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"DeviceCell"];
    }
    
    NSDictionary *device = self.devices[indexPath.row];
    cell.textLabel.text = device[@"name"] ?: @"未知设备";
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", device[@"model"] ?: @"", device[@"ios_version"] ?: @""];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSDictionary *device = self.devices[indexPath.row];
        [[APIManager sharedManager] removeUserDevice:device[@"uuid"] completion:^(BOOL success, NSError *error) {
            if (success) {
                NSMutableArray *mutableDevices = [self.devices mutableCopy];
                [mutableDevices removeObjectAtIndex:indexPath.row];
                self.devices = mutableDevices;
                [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
        }];
    }
}

@end
