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
            // Delete the newline character to convert into intValue properly
            numberString = [inputString substringToIndex:([inputString length] - 1)];
            number = [numberString intValue];
    
            // numberString is used to fill in 0's the same length as the input string in case the input string is numerically 0
            for(int i = 0; i < [numberString length]; i++) {
                newNumberString = [newNumberString stringByAppendingString:@"0"];
            }
            // If intValue of input string is 0, either input string is numerically 0,
            //  or it does not have numerical value.
            if(number == 0) {
                // This condition checks whether the number string is the same as the input string
                // If they are the same, the input string is numerically 0 (with zero or more leading 0's)
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
            newString = [[inputString componentsSeparatedByCharactersInSet:[NSCharacterSet punctuationCharacterSet]] componentsJoinedByString:@""];
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
            
            NSLog(@"Here are the list of operations you could use on the input string: ");
            NSLog(@"1. Turn all letters in the input string into their uppercase form");
            NSLog(@"2. Turn all letters in the input string into their lowercase form");
            NSLog(@"3. Return the string if the string is recognizable as an integer,");
            NSLog(@" otherwise, return 'Not a valid number' error message");
            NSLog(@"4. Canadianize the string by attaching ', eh?' at the end");
            NSLog(@"5. Respond to your input string by");
            NSLog(@" returning 'I don't know' message if the input string ends with '?' character,");
            NSLog(@" returning 'Whoa, calm down!' message if the input string ends with '!' character,");
            NSLog(@" or returning an error message otherwise");
            NSLog(@"6. De-Space by replacing all space characters with '-' character");
            NSLog(@"7. Return the number of characers in the input string");
            NSLog(@"8. Return the input string with all punctuation characters removed");
            NSLog(@"9. Return the input string with all letter characters replaced by 🧂 charater");
            
            NSLog(@"\nChoose your operation: ");
            
            char inputOperationChars[255];
            fgets(inputOperationChars, 255, stdin);
            
            printf("Your opeartion is %s\n", inputOperationChars);
            
            NSString *inputOperation = [NSString stringWithUTF8String:inputOperationChars];
            NSLog(@"Input opeartion was: %@", inputOperation);
            
            NSLog(@"Input operation address is: %p", inputOperation);
            
            NSString* outputString = chooseOperation(inputString, inputOperation);
            
            NSLog(@"Output is: %@", outputString);
        }
    }
    return 0;
}
