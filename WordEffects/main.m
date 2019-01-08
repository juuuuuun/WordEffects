//
//  main.m
//  WordEffects
//
//  Created by Jun Oh on 2019-01-07.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* chooseOperation(NSString* inputString, NSString* inputOperation) {
    
    NSString* newString;
    NSString* numberString;
    switch([inputOperation integerValue]) {
        // 1. Uppercase
        case 1:
            newString = [inputString uppercaseString];
            break;
        // 2. Lowercase
        case 2:
            newString = [inputString lowercaseString];
            break;
        // 3. Numberize
        case 3:
            numberString = [inputString substringToIndex:([inputString length] - 1)];
            int number = [numberString intValue];
            if(number == 0) {
                if(![numberString isEqualToString:@"0"]) {
                    newString = @"Not a valid number";
                } else {
                    newString = numberString;
                }
            } else {
                newString = numberString;
            }
            break;
        // 4. Candianize
        case 4:
            newString = [inputString stringByReplacingCharactersInRange:NSMakeRange([inputString length] - 1, 1) withString:@", eh?"];
            break;
        // 5. Respond
        case 5:
            if([inputString characterAtIndex:([inputString length] - 2)] == '?') {
                newString = @"I don't know";
            } else if([inputString characterAtIndex:([inputString length] - 2)] == '!') {
                newString = @"Whoa, calm down!";
            } else {
                newString = @"Invalid string for respond operation";
            }
            break;
        // 6. De-Space-It
        case 6:
            newString = [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
            break;
        default:
            newString = @"Invalid operation";
            break;
    }
    NSLog(@"New string value is: %@", newString);
    NSLog(@"New string address is: %p", newString);
    
    return newString;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (YES) {
            char inputOperationChars[255];
            
            printf("Input an operation: ");
            fgets(inputOperationChars, 255, stdin);
            
            printf("Your opeartion is %s\n", inputOperationChars);
            
            NSString *inputOperation = [NSString stringWithUTF8String:inputOperationChars];
            NSLog(@"Input opeartion was: %@", inputOperation);
            
            NSLog(@"Input operation address is: %p", inputOperation);
            
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
            
            NSString* outputString = chooseOperation(inputString, inputOperation);
            
            NSLog(@"Output is: %@", outputString);
        }
    }
    return 0;
}
