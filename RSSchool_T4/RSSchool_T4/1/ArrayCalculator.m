#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    
    NSMutableArray *digits = [array mutableCopy];
    NSInteger sum = 0;
    NSInteger result = 1;
    NSInteger flag = 0;
    
    NSArray *sorted = [digits sortedArrayUsingComparator:^(id a, id b) {
        if ([a intValue] < [b intValue]) {
            return NSOrderedDescending;
        } else if ([b intValue] < [a intValue]) {
            return NSOrderedAscending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    for (int i = 0; i < [sorted count]; i++) {
        if(flag < numberOfItems){
            if ([sorted[i] isKindOfClass:[NSString class]]) {
                continue;
            }
            result = result * [sorted[i] integerValue];
            sum = result;
            flag += 1;
        }
    }
    
    return sum;
}
@end
