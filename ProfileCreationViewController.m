#import "ProfileCreationViewController.h"
#import "ProfileManager.h"
#import "DeviceModelManager.h"

@interface ProfileCreationViewController ()
@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UITextField *deviceModelField;
@property (nonatomic, strong) UIButton *createButton;
@end

@implementation ProfileCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"创建配置";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    self.nameField = [[UITextField alloc] init];
    self.nameField.placeholder = @"配置名称";
    self.nameField.borderStyle = UITextBorderStyleRoundedRect;
    self.nameField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.nameField];
    
    self.deviceModelField = [[UITextField alloc] init];
    self.deviceModelField.placeholder = @"设备型号";
    self.deviceModelField.borderStyle = UITextBorderStyleRoundedRect;
    self.deviceModelField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.deviceModelField];
    
    self.createButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.createButton setTitle:@"创建" forState:UIControlStateNormal];
    self.createButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.createButton];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.nameField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20],
        [self.nameField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.nameField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        [self.nameField.heightAnchor constraintEqualToConstant:44],
        [self.deviceModelField.topAnchor constraintEqualToAnchor:self.nameField.bottomAnchor constant:20],
        [self.deviceModelField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.deviceModelField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        [self.deviceModelField.heightAnchor constraintEqualToConstant:44],
        [self.createButton.topAnchor constraintEqualToAnchor:self.deviceModelField.bottomAnchor constant:30],
        [self.createButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.createButton.widthAnchor constraintEqualToConstant:200],
        [self.createButton.heightAnchor constraintEqualToConstant:44],
    ]];
}

@end