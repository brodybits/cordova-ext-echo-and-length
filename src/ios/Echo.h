#import <Cordova/CDV.h>

@interface Echo : CDVPlugin

- (void) echo:(CDVInvokedUrlCommand*)command;
- (void) len:(CDVInvokedUrlCommand*)command;

@end
