#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    
    NSNumber *squared = [NSNumber numberWithInt:([number intValue] * [number intValue])];
    
    NSMutableArray *decomposeArray = [self decomposer:number squared:squared];
    
    if(decomposeArray == nil){
        return nil;
    }else{
        [decomposeArray removeLastObject];
        return decomposeArray;
    }
}

-(NSMutableArray *)decomposer:(NSNumber *) num squared:(NSNumber *) squared {
    if ([squared longLongValue] == 0) {
        return [NSMutableArray arrayWithObject:num];
    }
    
    for(long long i = [num longLongValue] - 1; i > 0; i--) {
        long long iSquare = i * i;
        
        if(([squared longLongValue] - iSquare) >= 0){
            NSNumber *nextNum = [NSNumber numberWithLongLong:i];
            NSNumber *nextSquared = [NSNumber numberWithLongLong:([squared longLongValue] - iSquare)];
            NSMutableArray *arr = [self decomposer:nextNum squared:nextSquared];
            if (arr != nil){
                [arr addObject:num];
                return arr;
            }
        }
    }
    
    return nil;
}
@end
