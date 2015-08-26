

#import "DSMenuItem.h"

@implementation DSMenuItem
+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title
{
    DSMenuItem *item = [[self alloc] init];
    
    item.image = image;
    item.title = title;
    
    return item;
}
@end
