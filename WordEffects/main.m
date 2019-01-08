//
//  main.m
//  WordEffects
//
//  Created by Jun Oh on 2019-01-07.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSMutableString* chooseOperation(NSMutableString* inputString, NSMutableString* inputOperation) {
    
    NSMutableString* newString;
    NSMutableString* numberString;
    int number;
    NSString* subString;
    switch([inputOperation integerValue]) {
        // 1. Uppercase
        case 1:
            newString = [[NSMutableString alloc] initWithString:[inputString uppercaseString]];
            break;
        // 2. Lowercase
        case 2:
            newString = [[NSMutableString alloc] initWithString:[inputString lowercaseString]];
            break;
        // 3. Numberize
        case 3:
            [inputString deleteCharactersInRange:NSMakeRange([inputString length] - 1, 1)];
            number = [inputString intValue];
            numberString = [[NSMutableString alloc] initWithString:@""];
            for(int i = 0; i < [inputString length]; i++) {
                [numberString appendString:@"0"];
            }
            if(number == 0) {
                if(![inputString isEqual:numberString]) {
                    newString = [[NSMutableString alloc] initWithString:@"Not a valid number"];
                } else {
                    newString = inputString;
                }
            } else {
                newString = inputString;
            }
            break;
        // 4. Candianize
        case 4:
            [inputString replaceCharactersInRange:NSMakeRange([inputString length] - 1, 1) withString:@", eh?"];
            newString = inputString;
            break;
        // 5. Respond
        case 5:
            if([inputString characterAtIndex:([inputString length] - 2)] == '?') {
                newString = [[NSMutableString alloc] initWithString:@"I don't know"];
            } else if([inputString characterAtIndex:([inputString length] - 2)] == '!') {
                newString = [[NSMutableString alloc] initWithString:@"Whoa, calm down!"];
            } else {
                newString = [[NSMutableString alloc] initWithString:@"Invalid string for respond operation"];
            }
            break;
        // 6. De-Space-It
        case 6:
            [inputString replaceOccurrencesOfString:@" " withString:@"-" options:NSLiteralSearch range:NSMakeRange(0, [inputString length])];
            newString = inputString;
            break;
        // 7. Letter count
        case 7:
            newString = [[NSMutableString alloc] initWithFormat:@"Letter count of input string is: %lu", ([inputString length] - 1)];
            break;
        // 8. Punctuation removal
        case 8:
            newString = [[NSMutableString alloc] initWithString:@""];
            for(int i = 0; i < [inputString length]; i++) {
                subString = [inputString substringWithRange:NSMakeRange(i, 1)];
                [newString appendString: [subString stringByTrimmingCharactersInSet:[NSCharacterSet punctuationCharacterSet]]];
            }
            break;
        // 9. Replace with emojis
        case 9:
            newString = [[NSMutableString alloc] initWithString:@""];
            for(int i = 0; i < [inputString length]; i++) {
                subString = [inputString substringWithRange:NSMakeRange(i, 1)];
                if([[subString stringByTrimmingCharactersInSet:[NSCharacterSet letterCharacterSet]] isEqual: @""]) {
                    [newString appendString:@"🧂"];
                } else {
                    [newString appendString:subString];
                }
            }
            break;
        default:
            newString = [[NSMutableString alloc] initWithString:@"Invalid operation"];
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
            
            NSMutableString *inputOperation = [NSMutableString stringWithUTF8String:inputOperationChars];
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
            NSMutableString *inputString = [NSMutableString stringWithUTF8String:inputChars];
            
            // print NSString object
            NSLog(@"Input was: %@", inputString);
            
            NSLog(@"Input string address is: %p", inputString);
            
            NSMutableString* outputString = chooseOperation(inputString, inputOperation);
            
            NSLog(@"Output is: %@", outputString);
        }
    }
    return 0;
}
