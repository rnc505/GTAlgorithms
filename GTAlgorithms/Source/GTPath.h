//
//  GTPath.h
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/25/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

#import "GTGraph.h"
@class GTAStarNode;
@interface GTPath : GTGraph {
    GTDistance _mLength;
}

+(id)blankPath;
@property (nonatomic, assign) GTDistance length;
@property (nonatomic, retain) GTAStarNode* startNode;
@property (nonatomic, retain) GTAStarNode* endNode;
@property (nonatomic, retain) NSMutableArray *finalPath;

@end
