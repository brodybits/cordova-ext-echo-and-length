#import "Echo.h"
#import <Cordova/CDV.h>

@implementation Echo

- (void) echo:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;

    @try {
        NSString* echo = [command.arguments objectAtIndex:0];

        if (echo != nil && [echo length] > 0) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
            javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
            javaScript = [pluginResult toErrorCallbackString:command.callbackId];
        }
    } @catch (NSException* exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }

    [self writeJavascript:javaScript];
}

- (void) len:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;

    @try {
        NSString* echo = [command.arguments objectAtIndex:0];

        if (echo != nil) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];

            NSUInteger l = [echo length];
            NSMutableArray * r = [NSMutableArray arrayWithCapacity:0];
            NSMutableDictionary * d = [NSMutableDictionary dictionaryWithCapacity:0];
            [d setObject:[NSNumber numberWithInt:l] forKey: @"len"];
            [r addObject:d];

            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:r];
            javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
            javaScript = [pluginResult toErrorCallbackString:command.callbackId];
        }
    } @catch (NSException* exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }

    [self writeJavascript:javaScript];
}

@end
