//
//  HYDrawView.m
//  CoreAnimation
//
//  Created by XZM_XHY on 15/6/25.
//  Copyright (c) 2015年 HY. All rights reserved.
//

#import "HYDrawView.h"

#define BRUSH_WIDTH 50
#define BRUSH_HEIGHT 30

@interface HYDrawView ()
@property (nonatomic, strong) NSMutableArray *strokes;
@end

@implementation HYDrawView

- (NSMutableArray *)strokes
{
    if (!_strokes) {
        _strokes = [[NSMutableArray alloc] init];
    }
    return _strokes;
}

/**
 *  添加新的点到数据结构中，并重新绘制
 *
 *  @param pt 新点
 */
- (void)addBrushStrokeAtPoint:(CGPoint )pt
{
    // 添加画笔的笔画到数组中
    [self.strokes addObject:[NSValue valueWithCGPoint:pt]];
    
    // 重新绘制
    [self setNeedsDisplayInRect:[self brushRectForPoint:pt]];
}

- (CGRect)brushRectForPoint:(CGPoint)pt
{
    return CGRectMake(pt.x - BRUSH_WIDTH / 2, pt.y - BRUSH_HEIGHT / 2, BRUSH_WIDTH, BRUSH_HEIGHT);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    // 获取起始点
    CGPoint pt = [[touches anyObject] locationInView:self];
    
    // 添加笔画
    [self addBrushStrokeAtPoint:pt];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    // 获取触摸的点
    CGPoint pt = [[touches anyObject] locationInView:self];
    
    // 添加笔画
    [self addBrushStrokeAtPoint:pt];
}

- (void)drawRect:(CGRect)rect
{
    // 重新绘制
    for (NSValue *value in self.strokes) {
        CGPoint pt = [value CGPointValue];
        
        CGRect brushRect = [self brushRectForPoint:pt];
        
        // 仅仅绘制当前点范围
        if (CGRectIntersectsRect(rect, brushRect)) {
            [[UIImage imageNamed:@"brush"] drawInRect:brushRect];
        }
    }
}

- (void)clear
{
    [self.strokes removeAllObjects];
    
    [self setNeedsDisplay];
}

@end
