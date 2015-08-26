
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DSMenuItem : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) UIImage *image;

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;

@end
