
#import "UIBarButtonItem+CCExtension.h"

@implementation UIBarButtonItem (CCExtension)
+ (instancetype)itemWithImage:(NSString *)image selImage:(NSString *)selImage target:(id)target action:(SEL)action{
    UIButton *tagButton =[[UIButton alloc] init];
    [tagButton setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [tagButton setBackgroundImage:[UIImage imageNamed:selImage] forState:UIControlStateSelected];
    tagButton.size =tagButton.currentBackgroundImage.size;
    [tagButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[self alloc] initWithCustomView:tagButton];
    
}
@end
