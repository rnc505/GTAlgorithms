//
//  GTViewController.m
//  GTAlgorithmsDemo
//
//  Created by Robby Cohen on 12/25/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

// TODO
// - FIX/DEBUG WHY IT FINDS LONGEST PATH
// - IMPLEMENT WITH PRIORITY QUEUE
// - Simplify interface so client doesn't need to know what type of node is neceesary; i.e. clinet only knows GTNodes/GTEdges/GTGraph interface
// - use a call back for a the AStar heuristic
// - use that they both implement from GTPoint protocol for a unified addition to graph


#import "GTViewController.h"

@interface GTViewController ()

@end

@implementation GTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GTBasicNode* start = [GTBasicNode createBasicNodeWithLocation:GTCoordinate2DMake(0, 0)];
    GTBasicNode* a = [GTBasicNode createBasicNodeWithLocation:GTCoordinate2DMake(0, -1.5)];
    GTBasicNode* b = [GTBasicNode createBasicNodeWithLocation:GTCoordinate2DMake(sqrt(2), -1.5-sqrt(2))];
    GTBasicNode* c = [GTBasicNode createBasicNodeWithLocation:GTCoordinate2DMake(0, -1.5-sqrt(2)-sqrt(3))];
    GTBasicNode* d = [GTBasicNode createBasicNodeWithLocation:GTCoordinate2DMake(2, 0)];
    GTBasicNode* e = [GTBasicNode createBasicNodeWithLocation:GTCoordinate2DMake(3, -2)];
    GTBasicNode* end = [GTBasicNode createBasicNodeWithLocation:GTCoordinate2DMake(3.3, -1.5-sqrt(2)-sqrt(3))];
    
    GTBasicEdge *starta = [GTBasicEdge createEdgeWithLength:1.5f firstVertice:start secondVertice:a];
    GTBasicEdge *startd = [GTBasicEdge createEdgeWithLength:2.f firstVertice:start secondVertice:d];
    GTBasicEdge *ab = [GTBasicEdge createEdgeWithLength:2.f firstVertice:a secondVertice:b];
    GTBasicEdge *bc = [GTBasicEdge createEdgeWithLength:3.f firstVertice:b secondVertice:c];
    GTBasicEdge *cend = [GTBasicEdge createEdgeWithLength:4.f firstVertice:c secondVertice:end];
    GTBasicEdge *de = [GTBasicEdge createEdgeWithLength:3.f firstVertice:d secondVertice:e];
    GTBasicEdge *eend = [GTBasicEdge createEdgeWithLength:2.f firstVertice:e secondVertice:end];
    
    
    GTGraph *graph = [GTGraph createEmptyGraph];
    [graph addNodes:[NSSet setWithArray:@[start,a,b,c,d,e,end]]];
    [graph addUndirectedEdges:[NSSet setWithArray:@[starta,startd,ab,bc,cend,de,eend]]];
    [GTAStarSearch performAStarSearchOnGraph:graph withStartNode:start withEndNode:end completion:^(GTPath *shortestPath) {
        NSLog(@"shortest path: %f",[shortestPath length]);
         NSLog(@"path: %@",[shortestPath finalPath]);
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
