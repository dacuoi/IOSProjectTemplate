//
//  LoginViewController.m
//  iosProjectTemplate
//
//  Created by tranquangson on 2/27/19.
//  Copyright © 2019 tranquangson. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initView];
}

- (void)initView{
    self.view.backgroundColor = WHITE_COLOR;
    self.navigationItem.title = @"Login";
    //
    float yFrame = 10;
    float xTextField = 10;
    float pTextField = 10;
    float wTextField = SCREEN_WIDTH-(xTextField*2);
    float hTextField = 44;
    
    tfUserame = [[UITextField alloc] initWithFrame:CGRectMake(xTextField, yFrame, wTextField, hTextField)];
    tfUserame.placeholder = NSLocalizedString(@"enter_your_username",nil);
    tfUserame.borderStyle = UITextBorderStyleNone;
    tfUserame.font = [UIFont fontWithName:HELVETICA_NEUE_BOLD size:20];
    tfUserame.delegate = self;
    [self.view addSubview:tfUserame];
    
    yFrame += tfUserame.frame.size.height;
    yFrame += pTextField;
    
    tfPassword = [[UITextField alloc] initWithFrame:CGRectMake(xTextField, yFrame, wTextField, hTextField)];
    tfPassword.placeholder = NSLocalizedString(@"enter_your_password",nil);
    tfPassword.borderStyle = UITextBorderStyleNone;
    tfPassword.secureTextEntry = YES;
    tfPassword.font = [UIFont fontWithName:HELVETICA_NEUE_BOLD size:20];
    tfPassword.delegate = self;
    [self.view addSubview:tfPassword];
    
    yFrame += tfUserame.frame.size.height;
    yFrame += pTextField;
    
    NSInteger hButton = 44;
    UIButton *btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLogin.frame = CGRectMake(0, yFrame, SCREEN_WIDTH, hButton);
    [btnLogin setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    btnLogin.backgroundColor = BLUE_COLOR;
    btnLogin.titleLabel.font = [UIFont fontWithName:HELVETICA_NEUE_BOLD size:14];
    [btnLogin setTitle:@"Login" forState:UIControlStateNormal];
    [btnLogin setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [btnLogin addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogin];
    
    
    //
    tfUserame.text = @"paintbsd@gmail.com";
    tfPassword.text = @"12345678";
}

- (void)loginAction:(id)sender{
    NSString *strUsername = [Utils trimText:tfUserame.text];
    NSString *strPass = tfPassword.text;
    //
    [self login:strUsername withPassword:strPass];
}

- (void)login:(NSString *)strEmail withPassword:(NSString *)strPassword
{
    //Data view
    NSMutableDictionary *dicData = [[NSMutableDictionary alloc] init];
    dicData[@"email"] = strEmail;
    dicData[@"password"] = strPassword;
    
    //Action
    BaseActionEvent *action = [[BaseActionEvent alloc] init];
    action.action = requestLogin;
    action.viewData = dicData;
    action.sender = self;
    [[AppController getController] handleViewEvent:action];
}

- (void)receiveDataFromModel: (BaseModelEvent*) modelEvent{
    //
    if([modelEvent.modelData isKindOfClass:[NSDictionary class]]){
        NSDictionary *dictUser = modelEvent.modelData;
        NSLog(@"%@",dictUser);
    }
    else{
        NSLog(@"error");
    }
}

- (void)receiveErrorFromModel: (BaseModelEvent*) modelEvent{
    NSString *strMessage = NSLocalizedString(@"can_not_connect_server", nil);
    //
    if([modelEvent.modelData isKindOfClass:[NSString class]]){
        strMessage = modelEvent.modelData;
    }
    NSLog(@"%@",strMessage);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
