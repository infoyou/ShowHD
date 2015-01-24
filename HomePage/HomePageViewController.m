//
//  HomePageViewController.m
//  JITShowHD
//
//  Created by Adam on 13-3-22.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import "HomePageViewController.h"
#import "ProductViewController.h"
#import "DataHandel.h"
static int stepIndex = 0;

#define TIME_INTERVAL           1.3f
#define TAB_WIDTH               SCREEN_WIDTH/4.f
#define TAB_Y                   623.f
#define TAB_ARROW_W             41.f
#define TAB_ARROW_H             31.f
#define TAB_ARROW_X             (TAB_WIDTH - TAB_ARROW_W)/2
#define TAB_BASE_TAG            100

@interface HomePageViewController ()

@property (nonatomic, retain) IBOutlet ProductViewController *productViewController;

@property (nonatomic, retain) IBOutlet UIView *selTab;

@property (nonatomic, retain) IBOutlet UIImageView *pop11View;
@property (nonatomic, retain) IBOutlet UIImageView *pop12View;
@property (nonatomic, retain) IBOutlet UIImageView *pop13View;
@property (nonatomic, retain) IBOutlet UIImageView *pop14View;
@property (nonatomic, retain) IBOutlet UIImageView *pop15View;
@property (nonatomic, retain) IBOutlet UIImageView *pop16View;
@property (nonatomic, retain) IBOutlet UIImageView *pop17View;

@property (nonatomic, retain) IBOutlet UIImageView *pop21View;
@property (nonatomic, retain) IBOutlet UIImageView *pop22View;
@property (nonatomic, retain) IBOutlet UIImageView *pop23View;

@property (nonatomic, retain) IBOutlet UIImageView *pop31View;
@property (nonatomic, retain) IBOutlet UIImageView *pop32View;
@property (nonatomic, retain) IBOutlet UIImageView *pop33View;
@property (nonatomic, retain) IBOutlet UIImageView *pop34View;
@property (nonatomic, retain) IBOutlet UIImageView *pop35View;
@property (nonatomic, retain) IBOutlet UIImageView *pop36View;
@property (nonatomic, retain) IBOutlet UIImageView *pop37View;

@property (nonatomic, retain) IBOutlet UIImageView *tab1View;
@property (nonatomic, retain) IBOutlet UIImageView *tab2View;
@property (nonatomic, retain) IBOutlet UIImageView *tab3View;
@property (nonatomic, retain) IBOutlet UIImageView *tab4View;

@property (nonatomic, retain) IBOutlet UIImageView *backView;

@property (nonatomic, retain) NSArray *location1XArray;
@property (nonatomic, retain) NSArray *location1YArray;
@property (nonatomic, retain) NSArray *location2XArray;
@property (nonatomic, retain) NSArray *location2YArray;
@property (nonatomic, retain) NSArray *location3XArray;
@property (nonatomic, retain) NSArray *location3YArray;
@property (nonatomic, retain) NSArray *location4XArray;
@property (nonatomic, retain) NSArray *location4YArray;
@property (nonatomic, retain) NSArray *location5XArray;
@property (nonatomic, retain) NSArray *location5YArray;
@property (nonatomic, retain) NSArray *location6XArray;
@property (nonatomic, retain) NSArray *location6YArray;
@property (nonatomic, retain) NSArray *location7XArray;
@property (nonatomic, retain) NSArray *location7YArray;
@property (nonatomic, retain) NSArray *location8XArray;
@property (nonatomic, retain) NSArray *location8YArray;
@property (nonatomic, retain) NSArray *location9XArray;
@property (nonatomic, retain) NSArray *location9YArray;
@property (nonatomic, retain) NSArray *location10XArray;
@property (nonatomic, retain) NSArray *location10YArray;

@end

@implementation HomePageViewController
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)dealloc {
    self.location1XArray = nil;
    self.location1YArray = nil;
    self.location2XArray = nil;
    self.location2YArray = nil;
    self.location3XArray = nil;
    self.location3YArray = nil;
    self.location4XArray = nil;
    self.location4YArray = nil;
    self.location5XArray = nil;
    self.location5YArray = nil;
    self.location6XArray = nil;
    self.location6YArray = nil;
    self.location7XArray = nil;
    self.location7YArray = nil;
    
    [super dealloc];
}
- (void)viewDidAppear:(BOOL)animated {
    canfloat = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    canfloat = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    selTabIndex = 1;
    [self initTab1FloatResources];
    
    [self addTabAction];
    
    [self.view addSubview:self.selTab];
    
    [self performSelector:@selector(autoRun)
               withObject:nil
               afterDelay:TIME_INTERVAL
     ];
    
    [CoreDataUtils deleteEntitiesFromMOC:[AppManager instance].MOC entityName:@"Product" predicate:nil];
    
    [DataHandel saveProduct];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - add pop action

- (void)addFloatAction {
    
    [self addTapActionView:self.backView];
    
    switch (selTabIndex) {
        case 1:
        {
            [self addTapActionView:self.pop11View];
            [self addTapActionView:self.pop12View];
            [self addTapActionView:self.pop13View];
            [self addTapActionView:self.pop14View];
            [self addTapActionView:self.pop15View];
            [self addTapActionView:self.pop16View];
            [self addTapActionView:self.pop17View];
        }
            break;
            
        case 2:
        {
            [self addTapActionView:self.pop21View];
            [self addTapActionView:self.pop22View];
            [self addTapActionView:self.pop23View];
        }
            break;
            
        case 3:
        {
            [self addTapActionView:self.pop31View];
            [self addTapActionView:self.pop32View];
            [self addTapActionView:self.pop33View];
            [self addTapActionView:self.pop34View];
            [self addTapActionView:self.pop35View];
            [self addTapActionView:self.pop36View];
            [self addTapActionView:self.pop37View];
        }
            break;
            
        default:
            break;
    }

}

#pragma mark - add tab action

- (void)addTabAction {
    
    [self addTapActionView:self.tab1View];
    [self addTapActionView:self.tab2View];
    [self addTapActionView:self.tab3View];
    [self addTapActionView:self.tab4View];
}

#pragma mark - hide all pop view
- (void)hiddenAllPopView {
    
    self.pop11View.hidden = YES;
    self.pop12View.hidden = YES;
    self.pop13View.hidden = YES;
    self.pop14View.hidden = YES;
    self.pop15View.hidden = YES;
    self.pop16View.hidden = YES;
    self.pop17View.hidden = YES;
    
    self.pop21View.hidden = YES;
    self.pop22View.hidden = YES;
    self.pop23View.hidden = YES;
    
    self.pop31View.hidden = YES;
    self.pop32View.hidden = YES;
    self.pop33View.hidden = YES;
    self.pop34View.hidden = YES;
    self.pop35View.hidden = YES;
    self.pop36View.hidden = YES;
    self.pop37View.hidden = YES;
}

#pragma mark - add resource
- (void)initTab1FloatResources {

    [self hiddenAllPopView];
    
    // show available pop view
    self.pop11View.hidden = NO;
    self.pop12View.hidden = NO;
    self.pop13View.hidden = NO;
    self.pop14View.hidden = NO;
    self.pop15View.hidden = NO;
    self.pop16View.hidden = NO;
    self.pop17View.hidden = NO;
    
    // pop offset
    self.location1XArray = [[NSArray alloc] initWithObjects:@"3", @"-3", nil];
    self.location1YArray = [[NSArray alloc] initWithObjects:@"1", @"-1", nil];
    
    self.location2XArray = [[NSArray alloc] initWithObjects:@"-1", @"1", nil];
    self.location2YArray = [[NSArray alloc] initWithObjects:@"2", @"-2", nil];
    
    self.location3XArray = [[NSArray alloc] initWithObjects:@"2", @"-2", nil];
    self.location3YArray = [[NSArray alloc] initWithObjects:@"-4", @"4", nil];
    
    self.location4XArray = [[NSArray alloc] initWithObjects:@"-3", @"3", nil];
    self.location4YArray = [[NSArray alloc] initWithObjects:@"-3", @"3", nil];
    
    self.location5XArray = [[NSArray alloc] initWithObjects:@"3", @"-3", nil];
    self.location5YArray = [[NSArray alloc] initWithObjects:@"1", @"-1", nil];
    
    self.location6XArray = [[NSArray alloc] initWithObjects:@"2", @"-2", nil];
    self.location6YArray = [[NSArray alloc] initWithObjects:@"1", @"-1", nil];
    
    self.location7XArray = [[NSArray alloc] initWithObjects:@"-3", @"3", nil];
    self.location7YArray = [[NSArray alloc] initWithObjects:@"2", @"-2", nil];
    
    [self addFloatAction];
}

- (void)initTab2FloatResources {
    
    [self hiddenAllPopView];
    
    self.pop21View.hidden = NO;
    self.pop22View.hidden = NO;
    self.pop23View.hidden = NO;
    
    self.pop21View.frame = CGRectMake(57, 112, 220, 220);
    self.pop22View.frame = CGRectMake(284, 291, 280, 280);
    self.pop23View.frame = CGRectMake(589, 107, 250, 250);
    
    self.location1XArray = [[NSArray alloc] initWithObjects:@"3", @"-3", nil];
    self.location1YArray = [[NSArray alloc] initWithObjects:@"1", @"-1", nil];
    
    self.location2XArray = [[NSArray alloc] initWithObjects:@"-1", @"1", nil];
    self.location2YArray = [[NSArray alloc] initWithObjects:@"2", @"-2", nil];
    
    self.location3XArray = [[NSArray alloc] initWithObjects:@"2", @"-2", nil];
    self.location3YArray = [[NSArray alloc] initWithObjects:@"-4", @"4", nil];

    [self addFloatAction];
}

- (void)initTab3FloatResources {
    [self hiddenAllPopView];
    
    // show available pop view
    self.pop31View.hidden = NO;
    self.pop32View.hidden = NO;
    self.pop33View.hidden = NO;
    self.pop34View.hidden = NO;
    self.pop35View.hidden = NO;
    self.pop36View.hidden = NO;
    self.pop37View.hidden = NO;
    
    self.pop31View.frame = CGRectMake(79, 145, 170, 170);
    self.pop32View.frame = CGRectMake(85, 385, 180, 180);
    self.pop33View.frame = CGRectMake(303, 329, 155, 155);
    self.pop34View.frame = CGRectMake(389, 107, 208, 208);
    self.pop35View.frame = CGRectMake(521, 390, 165, 165);
    self.pop36View.frame = CGRectMake(756, 116, 175, 175);
    self.pop37View.frame = CGRectMake(756, 390, 150, 150);
    
    // pop offset
    self.location1XArray = [[NSArray alloc] initWithObjects:@"3", @"-3", nil];
    self.location1YArray = [[NSArray alloc] initWithObjects:@"1", @"-1", nil];
    
    self.location2XArray = [[NSArray alloc] initWithObjects:@"-1", @"1", nil];
    self.location2YArray = [[NSArray alloc] initWithObjects:@"2", @"-2", nil];
    
    self.location3XArray = [[NSArray alloc] initWithObjects:@"2", @"-2", nil];
    self.location3YArray = [[NSArray alloc] initWithObjects:@"-4", @"4", nil];
    
    self.location4XArray = [[NSArray alloc] initWithObjects:@"-3", @"3", nil];
    self.location4YArray = [[NSArray alloc] initWithObjects:@"-3", @"3", nil];
    
    self.location5XArray = [[NSArray alloc] initWithObjects:@"3", @"-3", nil];
    self.location5YArray = [[NSArray alloc] initWithObjects:@"1", @"-1", nil];
    
    self.location6XArray = [[NSArray alloc] initWithObjects:@"2", @"-2", nil];
    self.location6YArray = [[NSArray alloc] initWithObjects:@"1", @"-1", nil];
    
    self.location7XArray = [[NSArray alloc] initWithObjects:@"-3", @"3", nil];
    self.location7YArray = [[NSArray alloc] initWithObjects:@"2", @"-2", nil];
    
    self.location8XArray = [[NSArray alloc] initWithObjects:@"-3", @"3", nil];
    self.location8YArray = [[NSArray alloc] initWithObjects:@"1", @"-1", nil];
    
    self.location9XArray = [[NSArray alloc] initWithObjects:@"-1", @"1", nil];
    self.location9YArray = [[NSArray alloc] initWithObjects:@"2", @"-2", nil];
    
    self.location10XArray = [[NSArray alloc] initWithObjects:@"-3", @"3", nil];
    self.location10YArray = [[NSArray alloc] initWithObjects:@"-3", @"3", nil];
    
    [self addFloatAction];
}

- (void)initTab4FloatResources {
    
}

- (void)preFloatView:(UIView*)view stepXArray:(NSArray*)stepXArray stepYArray:(NSArray*)stepYArray {
    
    int stepX = [[stepXArray objectAtIndex:stepIndex] integerValue];
    int stepY = [[stepYArray objectAtIndex:stepIndex] integerValue];
    
    CGRect frame = CGRectMake(view.frame.origin.x+stepX, view.frame.origin.y+stepY, view.frame.size.width, view.frame.size.height);
    
    // float View
    [self floatView:view rect:frame];
}

- (void)autoRun {
    if (!canfloat) {
        return;
    }
    
    if (stepIndex >= [self.location1XArray count]) {
        stepIndex = 0;
    }
    
    switch (selTabIndex) {
        case 1:
        case 4:
        {
            [self preFloatView:self.pop11View stepXArray:self.location1XArray stepYArray:self.location1YArray];
            [self preFloatView:self.pop12View stepXArray:self.location2XArray stepYArray:self.location2YArray];
            [self preFloatView:self.pop13View stepXArray:self.location3XArray stepYArray:self.location3YArray];
            [self preFloatView:self.pop14View stepXArray:self.location4XArray stepYArray:self.location4YArray];
            [self preFloatView:self.pop15View stepXArray:self.location5XArray stepYArray:self.location5YArray];
            [self preFloatView:self.pop16View stepXArray:self.location6XArray stepYArray:self.location6YArray];
            [self preFloatView:self.pop17View stepXArray:self.location7XArray stepYArray:self.location7YArray];
        }
            break;
            
        case 3:
        {
            [self preFloatView:self.pop31View stepXArray:self.location1XArray stepYArray:self.location1YArray];
            [self preFloatView:self.pop32View stepXArray:self.location2XArray stepYArray:self.location2YArray];
            [self preFloatView:self.pop33View stepXArray:self.location3XArray stepYArray:self.location3YArray];
            [self preFloatView:self.pop34View stepXArray:self.location4XArray stepYArray:self.location4YArray];
            [self preFloatView:self.pop35View stepXArray:self.location5XArray stepYArray:self.location5YArray];
            [self preFloatView:self.pop36View stepXArray:self.location6XArray stepYArray:self.location6YArray];
            [self preFloatView:self.pop37View stepXArray:self.location7XArray stepYArray:self.location7YArray];
        }
            break;
            
        case 2:
        {
            [self preFloatView:self.pop21View stepXArray:self.location1XArray stepYArray:self.location1YArray];
            [self preFloatView:self.pop22View stepXArray:self.location2XArray stepYArray:self.location2YArray];
            [self preFloatView:self.pop23View stepXArray:self.location3XArray stepYArray:self.location3YArray];
        }
            break;
            
        default:
            break;
    }

    
    [self performSelector:@selector(autoRun)
               withObject:nil
               afterDelay:TIME_INTERVAL
     ];
    
    stepIndex ++;
}

- (void)floatView:(UIView *)view rect:(CGRect)rect {
    
	[UIView beginAnimations:@"animationID" context:nil];
	[UIView setAnimationDuration:TIME_INTERVAL];
    [view setFrame:rect];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:view cache:YES];
	[UIView commitAnimations];
}

#pragma mark - action
- (void)clickImgView:(id)sender {
    
    UITapGestureRecognizer *singleTap = (UITapGestureRecognizer *)sender;
    int tag = [singleTap view].tag;
    
    if (tag == 1111) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"cpos://showHD"]];
        return;
    }
    
    if (tag > TAB_BASE_TAG) {
        // click Tab
        selTabIndex = tag % TAB_BASE_TAG;
        
        [self clearTabImage];
        
        UIImageView *tabView = (UIImageView *)[singleTap view];
        NSString *selTabImgName = [NSString stringWithFormat:@"tab1%d.png", selTabIndex];
        tabView.image = [UIImage imageNamed:selTabImgName];
        
        [self drawSelectArrow:selTabIndex];
        
        switch (selTabIndex) {
            case 2:
            {
                [self initTab2FloatResources];
                break;
            }
               
            case 3:
            {
                [self initTab3FloatResources];
                break;
            }
                
            default:
                [self initTab1FloatResources];
                break;
        }
    } else {
        
        // click Ball
        switch (tag) {
        // 药品
            case 11:
            case 12:
            {
                [AppManager instance].productDetailType = tag;
                [self.navigationController pushViewController:self.productViewController animated:YES];
            }
                break;
                
            case 13:
            {
                // 希罗达
                [self goApp:@"DemoXeloda://" plistUrl:@"http://weixun.co/app/weiyaodian/ios/Xeloda/Xeloda.plist"];
                break;
            }
                
            case 14:
            {
                // 史赛克
                [self goApp:@"DemoStryker://" plistUrl:@"http://weixun.co/app/weiyaodian/ios/Stryker/Stryker.plist"];
                break;
            }
                
            case 15:
            {
                // 自然美
                [self goApp:@"DemoNaturalBeauty://" plistUrl:@"http://weixun.co/app/weiyaodian/ios/NaturalBeauty/NaturalBeauty.plist"];
                break;
            }
                
            // 房产
            case 31:
            {
                // 宝华栎庭
                [self goApp:@"DemoBaoHua://" plistUrl:@"http://weixun.co/app/weiyaodian/ios/BaoHua/BaoHua.plist"];
                break;
            }
            case 32:
            {
                // 幸福里
                [self goApp:@"DemoInnerHappy://" plistUrl:@"http://weixun.co/app/weiyaodian/ios/XingFuLi/XingFuLi.plist"];
                break;
            }
            case 33:
            {
                // 嘉州长卷
                [self goApp:@"DemoJiaZhou://" plistUrl:@"http://weixun.co/app/weiyaodian/ios/JiaZhou/JiaZhou.plist"];
                break;
            }
            case 34:
            {
                // 昆明世博
                [self goApp:@"DemoKunMing://" plistUrl:@"http://weixun.co/app/weiyaodian/ios/KunMing/KunMing.plist"];
                break;
            }
            case 35:
            {
                // 中华城双龙
                [self goApp:@"DemoChinaCity://" plistUrl:@"http://weixun.co/app/weiyaodian/ios/ChinaCity/ChinaCity.plist"];
                break;
            }
            case 36:
            {
                // 室内全景
                [self goApp:@"DemoPanoramaInnerView://" plistUrl:@"http://weixun.co/app/weiyaodian/ios/Panorama/Panorama.plist"];
                break;
            }
            case 37:
            {
                // 万科苏州
                [self goApp:@"DemoVankeSuzhou://" plistUrl:@"http://weixun.co/app/weiyaodian/ios/Vanke/Vanke.plist"];
                break;
            }
                
            // 汽车
            case 21:
            {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"VKool://showHD"]];
                break;
            }
               
            case 23:
            {
                // GMC
                [self goApp:@"DemoGMC://" plistUrl:@"http://weixun.co/app/weiyaodian/ios/GMC/GMC.plist"];
                break;
            }
                
            default:
            {
                NSString *msg = [NSString stringWithFormat:@"Pop NO.%d", tag];
                ShowAlert(self, @"Note", msg, @"OK");
            }
                break;
        }

    }
}

- (void)clearTabImage {
    
    self.tab1View.image = [UIImage imageNamed:@"tab1.png"];
    self.tab2View.image = [UIImage imageNamed:@"tab2.png"];
    self.tab3View.image = [UIImage imageNamed:@"tab3.png"];
    self.tab4View.image = [UIImage imageNamed:@"tab4.png"];
}

- (void)drawSelectArrow:(int)tag {
    
    CGFloat x = TAB_ARROW_X + TAB_WIDTH * (tag-1);
    
    [UIView animateWithDuration:0.2f
                     animations:^{
                         self.selTab.frame = CGRectMake(x,
                                                        self.selTab.frame.origin.y,
                                                        TAB_ARROW_W,
                                                        TAB_ARROW_H);
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (void)goApp:(NSString *)transUrl plistUrl:(NSString *)plistUrl {
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:transUrl]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:transUrl]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-services://?action=download-manifest&url=%@",plistUrl]]];
    }
}

@end
