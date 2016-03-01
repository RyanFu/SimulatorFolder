//
//  SimFSimulatorFolder.m
//  Pods
//
//  Created by Carmelo Sui on 3/1/16.
//
//

#if TARGET_IPHONE_SIMULATOR

#import "SimFSimulatorFolder.h"

@implementation SimFSimulatorFolder

+ (void)load
{
    @try {
        NSString *documentDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSArray *pathComponents = [documentDir componentsSeparatedByString:@"/"];
        //  /Users/xxx/Desktops
        NSString *desktopDir = [NSString stringWithFormat:@"/%@/%@/Desktop", pathComponents[1], pathComponents[2]];  //there is a @"" before @"Users"
        NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
        
        NSString *symbolicLinkPath = [desktopDir stringByAppendingPathComponent:bundleIdentifier];
        
        //if not symbolic link, do not delete in case it is useful file
        NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:symbolicLinkPath error:nil];
        if ([[attributes fileType] isEqualToString:NSFileTypeSymbolicLink]) {
            [[NSFileManager defaultManager] removeItemAtPath:symbolicLinkPath error:nil];
        }
        
        NSString *appFolder = [documentDir stringByDeletingLastPathComponent];
        NSURL *symbolicURL = [NSURL fileURLWithPath:symbolicLinkPath];
        NSURL *fileURL = [NSURL fileURLWithPath:appFolder];
        
        NSError *error = nil;
        [[NSFileManager defaultManager] createSymbolicLinkAtURL:symbolicURL withDestinationURL:fileURL error:&error];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }

}

@end

#endif
