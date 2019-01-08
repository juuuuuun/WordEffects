//
//  main.m
//  WordEffects
//
//  Created by Jun Oh on 2019-01-07.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* uppercaseString(NSString* inputString) {
    return [inputString uppercaseString];
}

static NSString* lowercaseString(NSString* inputString) {
    return [inputString lowercaseString];
}

static NSString* numberizeString(NSString* inputString) {
    return [[NSString alloc] init];
}

static NSString* canadianizeString(NSString* inputString) {
    return [inputString stringByAppendingString:@", eh?"];
}

static NSString* respondString(NSString* inputString) {
    return [[NSString alloc] init];
}

static NSString* deSpaceItString(NSString* inputString) {
    return [[NSString alloc] init];
}

static NSString* chooseOperation(NSString* inputString) {
    return [[NSString alloc] init];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (YES) {
            // 255 unit long array of characters
            char inputChars[255];
            
            printf("Input a string: ");
            // limit input to max 255 characters
            fgets(inputChars, 255, stdin);
            
            // print as a c string
            printf("Your string is %s\n", inputChars);
            
            // convert char array to an NSString object
            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            
            // print NSString object
            NSLog(@"Input was: %@", inputString);
            
            NSLog(@"Input string address is: %p", inputString);
        }
    }
    return 0;
}
