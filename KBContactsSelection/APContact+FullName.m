//
//  APContact+FullName.m
//  KBContactsSelectionExample
//
//  Created by Kamil Burczyk on 13.12.2014.
//  Copyright (c) 2014 Sigmapoint. All rights reserved.
//

#import "APContact+FullName.h"

@implementation APContact (FullName)

- (NSString*)fullName
{
    NSString *result = @"";
    
    if (self.name.firstName) {
        result = self.name.firstName;
    }
    
    if (self.name.lastName) {
        result = [NSString stringWithFormat:@"%@ %@", result, self.name.lastName];
    }
    
    return result;
}

- (NSString*)firstLetterOfFullName
{
    NSString *fullName = [[self fullName] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
    if (fullName.length > 0) {
		NSString * letter = [fullName substringToIndex:1];
		letter = [letter stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
		if( letter.length > 0) {
			return [letter uppercaseString];
		}

    }
    
	return @"#";
}

@end
