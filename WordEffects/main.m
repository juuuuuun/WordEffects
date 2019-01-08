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
    int number;
    NSString* newNumberString = @"";
    NSString* subString;
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
            number = [numberString intValue];
            for(int i = 0; i < [numberString length]; i++) {
                newNumberString = [newNumberString stringByAppendingString:@"0"];
            }
            if(number == 0) {
                if(![numberString isEqual:newNumberString]) {
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
        // 7. Letter count
        case 7:
            newString = [[NSString alloc] initWithFormat:@"Letter count of input string is: %lu", ([inputString length] - 1)];
            break;
        // 8. Punctuation removal
        case 8:
            newString = @"";
            for(int i = 0; i < [inputString length]; i++) {
                subString = [inputString substringWithRange:NSMakeRange(i, 1)];
                newString = [newString stringByAppendingString: [subString stringByTrimmingCharactersInSet:[NSCharacterSet punctuationCharacterSet]]];
            }
            break;
        // 9. Replace with emojis
        case 9:
            newString = @"";
            for(int i = 0; i < [inputString length]; i++) {
                subString = [inputString substringWithRange:NSMakeRange(i, 1)];
                if([[subString stringByTrimmingCharactersInSet:[NSCharacterSet letterCharacterSet]] isEqual: @""]) {
                    newString = [newString stringByAppendingString:@"🧂"];
                } else {
                    newString = [newString stringByAppendingString:subString];
                }
            }
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
