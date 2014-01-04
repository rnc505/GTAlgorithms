//
//  GTAStarSearch.m
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/24/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

#import "GTAStarSearch.h"
#import "GTAStarGraph.h"
#import "GTAStarNode.h"
#import "GTPath.h"
@interface GTAStarSearch () {
    GTAStarGraph* _graph;
}

+(void)helperPerformAStarSearchOnGraph:(GTAStarGraph*)graph completion:(void (^)(GTPath* retVal))completionBlock;
-(id)initWithNumberOfNodes:(NSUInteger)num graph:(GTAStarGraph*)graph;
-(void)update:(NSMutableArray*)openSet currentNode:(GTAStarNode*)current toTheEndingNode:(GTAStarNode*)final excludeClosedSet:(NSMutableSet*)closedSet;
-(GTAStarNode*)obtainLowestFScore:(NSMutableArray*)openSet;
- (GTDistance)calculateFScoreFromEndNode:(GTAStarNode *)endNode neighborNode:(GTAStarNode *)neighborNode;
-(GTPath*)generateSuccessfulPathOnGraph:(GTAStarGraph*)graph fromEndNode:(GTAStarNode*)endNode;
@property (nonatomic, retain) GTAStarGraph* graph;

@end

@implementation GTAStarSearch
@synthesize numberOfNodes = _numberOfNodes, graph = _graph;
-(id)initWithNumberOfNodes:(NSUInteger)num  graph:(GTAStarGraph *)graph{
    self = [super init];
    if(self) {
        _numberOfNodes = num;
        _graph = graph;
    }
    return self;
}

+(void)performAStarSearchOnGraph:(GTGraph*)graph withStartNode:(id<GTNode>)startNode withEndNode:(id<GTNode>)endNode completion:(void (^)(GTPath*))completionBlock {
    GTAStarGraph *upgradedGraph = [GTAStarGraph createAStarGraphWithBaseGraph:graph withStartNode:(id<GTNode>)startNode withEndNode:(id<GTNode>)endNode];
    
    // The Nodes also need to be upgraded, but how do we do that without changing the underlying graph?
    
    [GTAStarSearch helperPerformAStarSearchOnGraph:upgradedGraph completion:^(GTPath *retVal) {
        completionBlock(retVal);
    }];
}

+(void)helperPerformAStarSearchOnGraph:(GTAStarGraph*)graph completion:(void (^)(GTPath* retVal))completionBlock {
    if(![graph startNode]) {
        // TODO EXCEPTION
    }
    if(![graph endNode]) {
        // TODO EXCEPTION
    }
    GTAStarSearch* this = [[GTAStarSearch alloc] initWithNumberOfNodes:[[graph adjacencyList] count] graph:graph];
    NSMutableArray* openSet = [NSMutableArray new];
    NSMutableSet* closedSet = [NSMutableSet new];
    
    [openSet addObject:[graph startNode]];
    [[graph startNode] setFScore:[this calculateFScoreFromEndNode:[graph endNode] neighborNode:[graph startNode]]];
    
    while ([openSet count]) {
        GTAStarNode *currentNode = [this obtainLowestFScore:openSet];
        if([currentNode isEqual:[graph endNode]]) {
            completionBlock([this generateSuccessfulPathOnGraph:graph fromEndNode:[graph endNode]]);
            return;
        }
        [openSet removeObject:currentNode];
        [closedSet addObject:currentNode];
        [this update:openSet currentNode:currentNode toTheEndingNode:[graph endNode] excludeClosedSet:closedSet];
    }
    completionBlock([GTPath blankPath]);
}

-(void)update:(NSMutableArray *)openSet currentNode:(GTAStarNode *)current toTheEndingNode:(GTAStarNode *)final excludeClosedSet:(NSMutableSet *)closedSet {
    
    NSArray* neighbors = [[[_graph adjacencyList] objectForKey:[current getIdentifier]] allObjects];
    
    for(int i = 0; i < [neighbors count]; ++i) {
        if([closedSet containsObject:neighbors[i]]){
            continue;
        }
        
        GTAStarNode *neighborNode = [neighbors objectAtIndex:i];
        GTDistance tentativeGScore = [current gScore] + [[self graph] getEdgeLengthFromFirstNode:current toSecondNode:neighborNode];
        BOOL isInOpenSet = [openSet containsObject:neighborNode];
        if(!isInOpenSet || tentativeGScore <= [neighborNode gScore]) {
            [neighborNode setParent:current];
            [neighborNode setGScore:tentativeGScore];
            [neighborNode setFScore:[self calculateFScoreFromEndNode:final neighborNode:neighborNode]];
            if(!isInOpenSet) {
                [openSet addObject:neighborNode];
            }
        }
    }
}
-(GTAStarNode *)obtainLowestFScore:(NSMutableArray *)openSet {
    NSNumber *lowestFScore = [openSet valueForKeyPath:@"@min.fScore"];
    return [openSet objectAtIndex:[[openSet valueForKey:@"fScore"] indexOfObject:lowestFScore]];
}

- (GTDistance)calculateFScoreFromEndNode:(GTAStarNode *)endNode neighborNode:(GTAStarNode *)neighborNode {
    return [neighborNode gScore] + [neighborNode calculateDistanceFromNode:endNode];
}

-(GTPath*)generateSuccessfulPathOnGraph:(GTAStarGraph *)graph fromEndNode:(GTAStarNode *)endNode {
    id currentNode = endNode;
    GTPath* retVal = [GTPath blankPath];
    [retVal addNode:currentNode];
    while([currentNode parent]) {
        [retVal addNode:[currentNode parent]];
        [retVal addDirectedEdgeWithBeginningNode:[currentNode parent] endNode:currentNode length:[graph getEdgeLengthFromFirstNode:[currentNode parent] toSecondNode:currentNode]];
        currentNode = [currentNode parent];
    }
    [retVal setStartNode:currentNode];
    [retVal setEndNode:endNode];
    return retVal;
}

@end
