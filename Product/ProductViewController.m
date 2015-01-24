//
//  ProductViewController.m
//  JITShowHD
//
//  Created by Adam on 13-3-26.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductListCell.h"
#import "Product.h"
#import "DataHandel.h"

#define TAB_X                   391.f
#define TAB_W                   178.f
#define TAB_H                   47.f
#define SCROLL_W                708
#define SCROLL_H                258

@interface ProductViewController ()
@property (nonatomic, retain) IBOutlet UIImageView *closeView;

@property (nonatomic, retain) IBOutlet UILabel *productLabel;

@property (nonatomic, retain) IBOutlet UIScrollView *productScrollView;
@property (nonatomic, retain) IBOutlet UIView *productBGView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;

@property (nonatomic, retain) IBOutlet UIImageView *buttonView;

@property (nonatomic, retain) NSTimer *productShowControlTimer;

@property (nonatomic, retain) IBOutlet UITableView *productTableView;

@end

@implementation ProductViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{

    [super dealloc];
}

- (void)viewDidAppear:(BOOL)animated {
    [self startProductShowPlay];
    
    [self changeProductDesc];
    [self fetchItems];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self stopProductShowPlay];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addTapActionView:self.closeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - resource
- (void)changeProductDesc {
    
    switch ([AppManager instance].productDetailType) {
        case 11:
        {
            [self.productScrollView setContentSize:CGSizeMake(709, 2128)];
            
            UIImageView *productDescView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ProductDesc11.png"]] autorelease];
            productDescView.frame = CGRectMake(1, 313, 708, 1820);
            [self.productScrollView addSubview:productDescView];
        }
            break;
           
        case 12:
        {
            [self.productScrollView setContentSize:CGSizeMake(709, 2128)];
            
            UIImageView *productDescView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ProductDesc12.jpg"]] autorelease];
            productDescView.frame = CGRectMake(1, 313, 708, 1820);
            [self.productScrollView addSubview:productDescView];
        }
            break;
            
        default:
            break;
    }
    
    [self addProductScrollView];
}

#pragma mark - action
- (void)clickImgView:(id)sender
{
    UITapGestureRecognizer *singleTap = (UITapGestureRecognizer *)sender;
    int tag = [singleTap view].tag;

    if (tag == 0) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

#pragma mark - add Product ScrollView
- (void)addProductScrollView {
    
    NSArray *array = [[NSArray alloc]initWithObjects:
         @"http://img2.icson.com/details/21/136/21-136-11000-20121017-0.jpg",
         @"http://img2.icson.com/details/21/136/21-136-11000-20121017-7.jpg",
         @"http://img2.icson.com/details/21/136/21-136-11000-20121017-8.jpg",nil];
    
    [self addImg:array];
    [self setCurrentPage:self.pageControl.currentPage];
}

- (void)startProductShowPlay {
    
    self.productShowControlTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];
    
    [self.productShowControlTimer fire];
}

- (void)stopProductShowPlay {
    
    if (self.productShowControlTimer && [self.productShowControlTimer isValid]) {
        [self.productShowControlTimer invalidate];
    }
    self.productShowControlTimer = nil;
}

- (void)addImg:(NSArray*)array {
    
    [self.scrollView setContentSize:CGSizeMake(SCROLL_W*[array count], SCROLL_H)];
    self.pageControl.numberOfPages = [array count];
    
    for ( int i = 0; i < [array count]; i++) {
        
        UIButton *imgButton = [[UIButton alloc]initWithFrame:CGRectMake(SCROLL_W*i, 0, SCROLL_W, SCROLL_H)];
        [imgButton addTarget:self action:@selector(doSelect:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:imgButton];
        
        // From Local
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"ProductDetail%d%d.png", [AppManager instance].productDetailType, i]];
        [imgButton setImage:image forState:UIControlStateNormal];
        
        // From Web
        /*
        NSString *url=[array objectAtIndex:i];
        UIImageFromURL([NSURL URLWithString:url], ^( UIImage * image )
                       {
                           [img setImage:image forState:UIControlStateNormal];
                       }, ^(void){
                       });
         */
    }
    
}

-(void)doSelect:(id)sender{

}

#pragma mark - change png
- (void)handleTimer:(NSTimer *)timer
{
    if (scrollTimeNum % 5 == 0 ) {    
        if (!Tend) {
            self.pageControl.currentPage++;
            if (self.pageControl.currentPage == self.pageControl.numberOfPages-1) {
                Tend = YES;
            }
        }else{
            self.pageControl.currentPage--;
            if (self.pageControl.currentPage==0) {
                Tend = NO;
            }
        }
        
        [UIView animateWithDuration:0.7 //速度0.7秒
                         animations:^{//修改坐标
                             self.scrollView.contentOffset = CGPointMake(self.pageControl.currentPage*SCROLL_W,0);
                         }];
    }
    
    scrollTimeNum ++;
}

#pragma mark - down image
void UIImageFromURL(NSURL * URL, void (^imageBlock)(UIImage * image), void (^errorBlock)(void))
{
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                   {
                       NSData * data = [[NSData alloc] initWithContentsOfURL:URL] ;
                       UIImage * image = [[UIImage alloc] initWithData:data];
                       dispatch_async( dispatch_get_main_queue(), ^(void){
                           if( image != nil )
                           {
                               imageBlock( image );
                           } else {
                               errorBlock();
                           }
                       });
                   });
}

#pragma mark - UIScrollViewDelegate method
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int tag = scrollView.tag;
    
    switch (tag) {
            
        case 10:
        {
            int offsetY = scrollView.contentOffset.y;
            if(offsetY >= 260)
            {
                self.buttonView.frame = CGRectMake(310, 63, 684, 44);
            } else {
                self.buttonView.frame = CGRectMake(310, 327-offsetY, 684, 44);
            }
            break;
        }

        case 11:
        {
            scrollView.pagingEnabled = YES;
            self.pageControl.currentPage = scrollView.contentOffset.x/SCROLL_W;
            [self setCurrentPage:self.pageControl.currentPage];
        }
            break;

        default:
            break;
    }
    
}

- (void)setCurrentPage:(NSInteger)secondPage {
    
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.pageControl.subviews count]; subviewIndex++) {
        
        UIImageView *subview = [self.pageControl.subviews objectAtIndex:subviewIndex];
        
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
                                     13, 13)];
        if (subviewIndex == secondPage) {
            [subview setImage:[UIImage imageNamed:@"page1.png"]];
        } else {
            [subview setImage:[UIImage imageNamed:@"page0.png"]];
        }
    }
}

#pragma mark - UITableViewDelegate method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath = %@", indexPath);
//	[self.navigationController pushViewController:assetViewController animated:YES];
    
    Product *product = [self.fetchedRC objectAtIndexPath:indexPath];
    self.productLabel.text = product.name;
}

#pragma mark - UITableViewDataSource product list

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.fetchedRC.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
	static NSString *CellIdentifier = @"ProductListCell";
    
    ProductListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
//    if (cell == nil)
	{
        cell = [[[ProductListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
        Product *product = [self.fetchedRC objectAtIndexPath:indexPath];
        [cell drawProduct:product];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
	return cell;
}

#pragma mark - core data
- (void)setFetchCondition {
    
    self.predicate = [NSPredicate predicateWithFormat:@"(type == %d)", [AppManager instance].productDetailType];
    self.entityName = @"Product";
    
    self.descriptors = [NSMutableArray array];
    NSSortDescriptor *dataDesc = [[[NSSortDescriptor alloc] initWithKey:@"productId" ascending:YES] autorelease];
    [self.descriptors addObject:dataDesc];
}

- (void)fetchItems {
    
    [NSFetchedResultsController deleteCacheWithName:nil];
    
    NSError *error = nil;
    BOOL res = [[super prepareFetchRC] performFetch:&error];
    if (!res) {
		NSAssert1(0, @"Unhandled error performing fetch: %@", [error localizedDescription]);
	}
    
    [self.productTableView reloadData];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    Product *product = [self.fetchedRC objectAtIndexPath:indexPath];
    self.productLabel.text = product.name;
}

@end
