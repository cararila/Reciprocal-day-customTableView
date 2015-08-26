

#import <UIKit/UIKit.h>

@interface DSDownMenu : UIView


+ (instancetype)showInView:(UIView *)view items:(NSArray *)items oriY:(CGFloat)oriY;

- (void)hide;

@end
