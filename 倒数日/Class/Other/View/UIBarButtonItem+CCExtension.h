
#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CCExtension)
+ (instancetype)itemWithImage:(NSString *)image selImage:(NSString *)selImage target:(id)target action:(SEL)action;
@end
