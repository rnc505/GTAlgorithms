//
//  GTNode.h
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/24/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GTNode <NSObject>
@required
-(NSString*)getIdentifier;
-(GTCoordinate2D)getLocation;
-(GTDistance)calculateDistanceFromNode:(id<GTNode>)node;
@optional
-(NSString*)getName;

@end

@interface GTBasicNode : NSObject <GTNode> 

-(NSString*)getIdentifier;
-(GTCoordinate2D)getLocation;
-(GTDistance)calculateDistanceFromNode:(id<GTNode>)node;

+(GTBasicNode*)createBasicNodeWithLocation:(GTCoordinate2D)location;
+(GTBasicNode*)createBasicNodeWithXCoordinate:(GTDistance)x withYCoordinate:(GTDistance)y;

@end
