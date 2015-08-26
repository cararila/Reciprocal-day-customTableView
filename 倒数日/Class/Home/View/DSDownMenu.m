
#import "DSDownMenu.h"

#import "DSMenuItem.h"

#define DCCols 3

#define DCItemWH DSScreenW / DCCols

@interface DSDownMenu ()

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) NSMutableArray *btns;

@end

@implementation DSDownMenu

- (NSMutableArray *)btns
{
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (void)hide
{
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -self.height);
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
    
}

+ (instancetype)showInView:(UIView *)superView items:(NSArray *)items oriY:(CGFloat)oriY
{
    NSUInteger count = items.count;
    // 1 2
    if (count % 3) { // 不是3的倍数
        // 抛出异常
        NSException *excp = [NSException exceptionWithName:@"items的总数不符合" reason:@"传入的数组总数必须是3的倍数" userInfo:nil];
        [excp raise];
    }
    
    
    NSUInteger rows = (count - 1) / DCCols + 1;
    CGFloat menuH = rows * DCItemWH;

    
    // 高度 =》 当前总行数 =》 当前有多少个按钮 =》 rows = (count - 1) / cols + 1
    DSDownMenu *menu = [[DSDownMenu alloc] initWithFrame:CGRectMake(0, oriY, DSScreenW, menuH)];
    
    menu.items = items;
    
    // 添加按钮
    [menu setUpAllBtns];
    
    // 添加分割线
    [menu setUpAllDivideView];
    
    // 添加黑色的view
    UIView *blackView = [[UIView alloc] initWithFrame:menu.frame];
    
    blackView.backgroundColor = [UIColor blackColor];
    
    [superView addSubview:blackView];
    
#warning 动画
    // 往下移动的动画
    menu.transform = CGAffineTransformMakeTranslation(0, -menu.height);
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{

        menu.transform = CGAffineTransformIdentity;

    } completion:^(BOOL finished) {

        [blackView removeFromSuperview];
    }];

    
    menu.backgroundColor = [UIColor blackColor];

    [superView addSubview:menu];
    
    return menu;
}
#pragma mark - 添加分割线
- (void)setUpAllDivideView
{
    // x = (i + 1) * itemWH
    // Y = 0
    // w = 1
    // h = menu.h
    // 竖:总列数 - 1
    for (int i = 0; i < DCCols - 1; i++) {
        UIView *divideV = [[UIView alloc] init];
        
        divideV.backgroundColor = [UIColor whiteColor];
        
        divideV.frame = CGRectMake((i + 1) * DCItemWH, 0, 1, self.height);
        
        [self addSubview:divideV];
    }
     NSUInteger rows = (self.items.count - 1) / DCCols + 1;
    
    // 横:总行数-1
    // x = 0 y = （i + 1） * itemWh w:menu.w h 1
    for (int i = 0; i < rows - 1; i++) {
        UIView *divideV = [[UIView alloc] init];
        
        divideV.backgroundColor = [UIColor whiteColor];
        
        divideV.frame = CGRectMake(0, (i + 1) * DCItemWH, self.width, 1);
        
        [self addSubview:divideV];
    }
    
}

#pragma mark - 添加所有按钮
- (void)setUpAllBtns
{
    for (DSMenuItem *item in self.items) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:item.title forState:UIControlStateNormal];
        
        [btn setImage:item.image forState:UIControlStateNormal];
        
        [self addSubview:btn];
        
        [self.btns addObject:btn];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 布局所有的按钮
    NSUInteger count = self.items.count;
    
    
    int col = 0;
    NSUInteger row = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    
    for (NSUInteger i = 0; i < count; i++) {
        col = i % DCCols;
        row = i / DCCols;
        
        UIButton *btn = self.btns[i];
        x = col * DCItemWH;
        y = row * DCItemWH;
        
        btn.frame = CGRectMake(x, y, DCItemWH, DCItemWH);
        
    }
}

@end
