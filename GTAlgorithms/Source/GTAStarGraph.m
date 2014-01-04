//
//  GTAStarGraph.m
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/24/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

#import "GTAStarGraph.h"
#import "GTAStarNode.h"
@interface GTAStarGraph ()
-(NSMutableDictionary*)determineAStarAdjacencyList;
-(GTAStarNode*)getOrCreateAStarNode:(id<GTNode>)node;
@end

@implementation GTAStarGraph
@synthesize startNode = _startNode, endNode = _endNode, graph = _graph, upgradedNodes = _upgradedNodes;

+(GTAStarGraph*)createAStarGraphWithBaseGraph:(GTGraph *)graph withStartNode:(id<GTNode>)startNode withEndNode:(id<GTNode>)endNode{
    GTAStarGraph *newGraph = [GTAStarGraph new];
    [newGraph setGraph:graph];
    [newGraph setUpgradedNodes:[NSMutableSet new]];
    [newGraph setAdjacencyList:[newGraph determineAStarAdjacencyList]];
    [newGraph setEdgeWeights:[graph edgeWeights]];
    [newGraph setStartNode:[newGraph getOrCreateAStarNode:startNode]];
    [newGraph setEndNode:[newGraph getOrCreateAStarNode:endNode]];
    return newGraph;
}

-(NSMutableDictionary *)determineAStarAdjacencyList {
    NSMutableDictionary* newAdjacencyList = [NSMutableDictionary new];
    [[_graph adjacencyList] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSMutableSet* nodeNeighbors = [NSMutableSet new];
        [obj enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [nodeNeighbors addObject:[self getOrCreateAStarNode:obj]];
        }];
        [newAdjacencyList setObject:nodeNeighbors forKey:key];
    }];
    return newAdjacencyList;
}

-(GTAStarNode *)getOrCreateAStarNode:(id<GTNode>)node {
    NSSet* isAlreadyCreated = [_upgradedNodes objectsPassingTest:^BOOL(id obj, BOOL *stop) {
        BOOL alreadyCreated = [[obj getIdentifier] isEqualToString:[node getIdentifier]];
        if(alreadyCreated) {
            *stop = YES;
        }
        return alreadyCreated;
    }];
    GTAStarNode* retVal;
    if([isAlreadyCreated count] == 0) {
        retVal = [GTAStarNode createAStarNodeFromBaseNode:node];
        [_upgradedNodes addObject:retVal];
    } else {
        retVal = [isAlreadyCreated anyObject];
    }
    return retVal;
}

@end
