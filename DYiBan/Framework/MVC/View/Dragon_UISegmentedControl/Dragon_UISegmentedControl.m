//
// SWSegmentedControl.m
// SWSegmentedControl
//
// Created by Sam Vermette on 26.10.10.
// Copyright 2010 Sam Vermette. All rights reserved.
//
// https://github.com/samvermette/SVSegmentedControl

#import <QuartzCore/QuartzCore.h>
#import "Dragon_UISegmentedControl.h"
#import "UIView+DragonViewSignal.h"

#define SVSegmentedControlBG [[UIImage imageNamed:@"Dragon_UISegmentedControl.bundle/inner-shadow"] stretchableImageWithLeftCapWidth:4 topCapHeight:5]


@interface DragonUISegmentedThumb ()

@property (nonatomic, assign) DragonUISegmentedControl *segmentedControl;
@property (nonatomic, assign) UIFont *font;

@property (nonatomic, readonly) UILabel *label;
@property (nonatomic, readonly) UILabel *secondLabel;

- (void)activate;
- (void)deactivate;

@end



@interface DragonUISegmentedControl()

- (void)activate;
- (void)snap:(BOOL)animated;
- (void)updateTitles;
- (void)toggle;
- (void)setupAccessibility;

//@property (nonatomic, strong) NSMutableArray *titlesArray;
@property (nonatomic, strong) NSMutableArray *thumbRects;
@property (nonatomic, strong) NSMutableArray *accessibilityElements;

@property (nonatomic, readwrite) NSUInteger snapToIndex;
@property (nonatomic, readwrite) BOOL trackingThumb;
@property (nonatomic, readwrite) BOOL moved;
@property (nonatomic, readwrite) BOOL activated;

@property (nonatomic, readwrite) CGFloat halfSize;
@property (nonatomic, readwrite) CGFloat dragOffset;
@property (nonatomic, readwrite) CGFloat segmentWidth;
@property (nonatomic, readwrite) CGFloat thumbHeight;

@end

#pragma mark -
@implementation DragonUISegmentedControl

@synthesize selectedSegmentChangedHandler, changeHandler, selectedIndex, animateToInitialSelection, accessibilityElements;
@synthesize cornerRadius, tintColor, backgroundImage, font, textColor, textShadowColor, textShadowOffset, segmentPadding, titleEdgeInsets, height, crossFadeLabelsOnDrag;
@synthesize titlesArray, thumb, thumbRects, snapToIndex, trackingThumb, moved, activated, halfSize, dragOffset, segmentWidth, thumbHeight,_muA_BackBroundColorComponent,_b_selectChange;

// deprecated
@synthesize delegate, thumbEdgeInset, shadowColor, shadowOffset;

DEF_SIGNAL(SEGMENTCHANGED)

#pragma mark -
#pragma mark Life Cycle

- (void)initSelf
{
    [self addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
}

-(void)dealloc
{
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame SectionTitles:(NSArray*)array {
    
	if (self = [super initWithFrame:frame]) {
        [self initSelf];

        self.titlesArray = [NSMutableArray arrayWithArray:array];
        self.thumbRects = [NSMutableArray arrayWithCapacity:[array count]];
        self.accessibilityElements = [NSMutableArray arrayWithCapacity:self.titlesArray.count];
        
        self.backgroundColor = [UIColor clearColor];
        self.tintColor = /*[UIColor colorWithRed:232 green:232 blue:232 alpha:1]*/ [UIColor clearColor];
        self.clipsToBounds = YES;
        self.userInteractionEnabled = YES;
        self.animateToInitialSelection = NO;
        self.clipsToBounds = NO;
        
        self.font = [UIFont boldSystemFontOfSize:15];
        self.textColor = [UIColor /*blackColor*/ colorWithRed:(CGFloat)(51/255) green:(CGFloat)(51/255) blue:(CGFloat)(51/255) alpha:1 ];
        self.textShadowColor = [UIColor clearColor];
        self.textShadowOffset = CGSizeMake(0, 0);
        
        self.titleEdgeInsets = UIEdgeInsetsMake(/*0, 10, 0, 10*/ 0,0,0,0);
        self.thumbEdgeInset = UIEdgeInsetsMake(/*2, 2, 3, 2*/ 0,0,0,0);//每部分内嵌宽高
        self.height = frame.size.height;
        self.cornerRadius = 4.0;
        
        self.selectedIndex = 0;
        self.thumb.segmentedControl = self;
        
        self.LKWidth = frame.size.width;
    }
    
	return self;
}

- (DragonUISegmentedThumb *)thumb {
    
    if(thumb == nil)
        thumb = [[DragonUISegmentedThumb alloc] initWithFrame:CGRectZero];
    
    return thumb;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
	
	if(newSuperview == nil)
		return;
    
	int c = [self.titlesArray count];
	int i = 0;
	
	self.segmentWidth = 0;
	
	for(id title in self.titlesArray) {
        if([title isKindOfClass:[NSString class]])
        {
            if(self.LKWidth > 0)
            {
                self.segmentWidth = self.LKWidth;		

            }
            else{
                CGFloat stringWidth = [title sizeWithFont:self.font].width+(self.titleEdgeInsets.left+self.titleEdgeInsets.right+self.thumbEdgeInset.left+self.thumbEdgeInset.right);
                self.segmentWidth = MAX(stringWidth, self.segmentWidth);
            }
        }
        if([title isKindOfClass:[UIImage class]])
        {
            UIImage* timage = title;
            if(self.LKWidth > 0)
            {
                self.segmentWidth = self.LKWidth;
            }
            else{
                
                self.segmentWidth = MAX(timage.size.width, self.segmentWidth);
            }
        }
	}
    
	self.segmentWidth = ceil(self.segmentWidth/2.0)*2; // make it an even number so we can position with center
	self.bounds = CGRectMake(0, 0, self.segmentWidth*c, self.height);
    self.thumbHeight = self.thumb.backgroundImage ? self.thumb.backgroundImage.size.height : self.height-(self.thumbEdgeInset.top+self.thumbEdgeInset.bottom);
    
    i = 0;
    
	for(id title in self.titlesArray) {
        [self.thumbRects addObject:[NSValue valueWithCGRect:CGRectMake(self.segmentWidth*i+self.thumbEdgeInset.left, self.thumbEdgeInset.top, self.segmentWidth-(self.thumbEdgeInset.left*2), self.thumbHeight)]];
		i++;
	}
	
	self.thumb.frame = [[self.thumbRects objectAtIndex:0] CGRectValue];
	self.thumb.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.thumb.bounds cornerRadius:2].CGPath;
    [self.thumb setTitleData:[self.titlesArray objectAtIndex:0]];
	self.thumb.font = self.font;
	
	[self insertSubview:self.thumb atIndex:0];
    
    BOOL animateInitial = self.animateToInitialSelection;
    
    if(self.selectedIndex == 0)
        animateInitial = NO;
	
    [self moveThumbToIndex:selectedIndex animate:animateInitial];
}

#pragma mark - Drawing code
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if(self.backgroundImage)
        [self.backgroundImage drawInRect:rect];
    
    else {
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();//创建一个设备相关的灰度颜色空间的引用
        
        // bottom gloss
        CGContextSetFillColorWithColor(context,[UIColor colorWithWhite:1 alpha:0.1]  /*[UIColor clearColor]*/.CGColor);//画笔的填充色
        CGPathRef bottomGlossRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, rect.size.width, rect.size.height) cornerRadius:self.cornerRadius].CGPath;
        CGContextAddPath(context, bottomGlossRect);
        CGContextFillPath(context);//设置填充的路径
        
        CGPathRef roundedRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, rect.size.width, rect.size.height-1) cornerRadius:self.cornerRadius].CGPath;
        CGContextAddPath(context, roundedRect);
        CGContextClip(context);
        
        // background tint
//        CGFloat components[4] = {0.9 ,1/*上半部分的颜色和alpha*/,  0.88 , 1 /*下半部分的颜色和alpha*/};//整体的背景色
        CGFloat components[4]={0,0,0,0};
        for (int i=0; i<_muA_BackBroundColorComponent.count; i++) {
            components[i]=[[_muA_BackBroundColorComponent objectAtIndex:i] floatValue];
        }
        CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, NULL, 2);
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0,0), CGPointMake(0,CGRectGetHeight(rect)-1), 0);
        CGGradientRelease(gradient);
        
        [self.tintColor set];
        UIRectFillUsingBlendMode(rect, kCGBlendModeOverlay);
        
        // inner shadow  顶部横线阴影直线
        CGContextAddPath(context, roundedRect);
        CGContextSetShadowWithColor(UIGraphicsGetCurrentContext(), CGSizeMake(0, /*1*/0), 1, [UIColor colorWithWhite:0 alpha:0.6] /*[UIColor clearColor]*/ .CGColor);
			//顶部横线
        CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:0 alpha:0.1] /*[UIColor clearColor]*/.CGColor);
        CGContextStrokePath(context);
        
        CGColorSpaceRelease(colorSpace);
    }
    
	CGContextSetShadowWithColor(context, self.textShadowOffset /*CGSizeMake(0, 0)*/, 0, self.textShadowColor /*[UIColor clearColor]*/.CGColor);
	[self.textColor set];
	
	CGFloat posY = ceil((CGRectGetHeight(rect)-self.font.pointSize+self.font.descender)/2)+self.titleEdgeInsets.top-self.titleEdgeInsets.bottom;
	int pointSize = self.font.pointSize;
	
	if(pointSize%2 != 0)
		posY--;
	
	int i = 0;
	
	for(id title in self.titlesArray) {
        
        //CGContextFillRect(context, labelRect);
        if([title isKindOfClass:[NSString class]])
        {
            CGRect labelRect = CGRectMake((self.segmentWidth*i), posY, self.segmentWidth, self.font.pointSize);
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 60000
            [title drawInRect:labelRect withFont:self.font lineBreakMode:UILineBreakModeClip alignment:UITextAlignmentCenter];
#else
            [title drawInRect:labelRect withFont:self.font lineBreakMode:NSLineBreakByClipping alignment:NSTextAlignmentCenter];
#endif
        }
        if([title isKindOfClass:[UIImage class]])
        {
            UIImage* grayImage = [[self class] grayscaleImage:title];
            CGRect labelRect = CGRectMake((self.segmentWidth*i), 2, self.segmentWidth,self.height - 4);
            [grayImage drawInRect:labelRect blendMode:kCGBlendModeNormal alpha:1.0f];
        }
		i++;
	}
}

+(UIImage *)grayscaleImage:(UIImage *)image
{
    CGSize size = image.size;
    CGRect rect = CGRectMake(0.0f, 0.0f, image.size.width,
                             image.size.height);
    // Create a mono/gray color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(nil, size.width,
                                                 size.height, 8, 0, colorSpace, kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);
    // Draw the image into the grayscale context
    CGContextDrawImage(context, rect, [image CGImage]);
    CGImageRef grayscale = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    // Recover the image
    UIImage *img = [UIImage imageWithCGImage:grayscale];
    CFRelease(grayscale);
    return img;
}
#pragma mark - Accessibility

- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    
    [self setupAccessibility];
}

- (void)setCenter:(CGPoint)center {
    [super setCenter:center];
    
    [self setupAccessibility];
}

- (void)setupAccessibility {
    [self.accessibilityElements removeAllObjects];
    
    NSUInteger i = 0;
    for (NSString *title in self.titlesArray) {
        UIAccessibilityElement *element = [[UIAccessibilityElement alloc] initWithAccessibilityContainer:self];
        element.isAccessibilityElement = YES;
        element.accessibilityLabel = [NSString stringWithFormat:NSLocalizedString(@"%@ tab",), title];
        element.accessibilityHint = [NSString stringWithFormat:NSLocalizedString(@"Tab %d of %d",), i + 1, self.titlesArray.count];
        
        [self.accessibilityElements addObject:element];
        i++;
    }
}

- (NSInteger)accessibilityElementCount {
    return self.accessibilityElements.count;
}

- (id)accessibilityElementAtIndex:(NSInteger)index {
    UIAccessibilityElement *element = [self.accessibilityElements objectAtIndex:index];
    
    CGFloat posY = ceil((CGRectGetHeight(self.bounds)-self.font.pointSize+self.font.descender)/2)+self.titleEdgeInsets.top-self.titleEdgeInsets.bottom;
    element.accessibilityFrame = [self.window convertRect:CGRectMake((self.segmentWidth*index), posY, self.segmentWidth, self.font.pointSize) fromView:self];
    
    element.accessibilityTraits = UIAccessibilityTraitNone;
    if (index == self.selectedIndex)
        element.accessibilityTraits = element.accessibilityTraits | UIAccessibilityTraitSelected;
    else if (!self.enabled)
        element.accessibilityTraits = element.accessibilityTraits | UIAccessibilityTraitNotEnabled;
    
    return element;
}

- (NSInteger)indexOfAccessibilityElement:(id)element {
    NSString *title = [[[element accessibilityLabel] componentsSeparatedByString:@" "] objectAtIndex:0];
    return [self.titlesArray indexOfObject:title];
}

#pragma mark -
#pragma mark Tracking

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super beginTrackingWithTouch:touch withEvent:event];
    
    CGPoint cPos = [touch locationInView:self.thumb];
	self.activated = NO;
	
	self.snapToIndex = floor(self.thumb.center.x/self.segmentWidth);
	
	if(CGRectContainsPoint(self.thumb.bounds, cPos)) {
//		self.trackingThumb = YES;  屏蔽拖动
//        [self.thumb deactivate];
//		self.dragOffset = (self.thumb.frame.size.width/2)-cPos.x;
        return NO;
	}
    
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super continueTrackingWithTouch:touch withEvent:event];
    
    CGPoint cPos = [touch locationInView:self];
	CGFloat newPos = cPos.x+self.dragOffset;
	CGFloat newMaxX = newPos+(CGRectGetWidth(self.thumb.frame)/2);
	CGFloat newMinX = newPos-(CGRectGetWidth(self.thumb.frame)/2);
	
	CGFloat buffer = 2.0; // to prevent the thumb from moving slightly too far
	CGFloat pMaxX = CGRectGetMaxX(self.bounds) - buffer;
	CGFloat pMinX = CGRectGetMinX(self.bounds) + buffer;
	
	if((newMaxX > pMaxX || newMinX < pMinX) && self.trackingThumb) {
		self.snapToIndex = floor(self.thumb.center.x/self.segmentWidth);
        
        if(newMaxX-pMaxX > 10 || pMinX-newMinX > 10)
            self.moved = YES;
        
		[self snap:NO];
        
		if (self.crossFadeLabelsOnDrag)
			[self updateTitles];
	}
	
	else if(self.trackingThumb) {
		self.thumb.center = CGPointMake(cPos.x+self.dragOffset, self.thumb.center.y);
		self.moved = YES;
        
		if (self.crossFadeLabelsOnDrag)
			[self updateTitles];
	}
    
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super endTrackingWithTouch:touch withEvent:event];
    
    CGPoint cPos = [touch locationInView:self];
	CGFloat pMaxX = CGRectGetMaxX(self.bounds);
	CGFloat pMinX = CGRectGetMinX(self.bounds);
	
	if(!self.moved && self.trackingThumb && [self.titlesArray count] == 2)
		[self toggle];
	
	else if(!self.activated && cPos.x > pMinX && cPos.x < pMaxX) {
		self.snapToIndex = floor(cPos.x/self.segmentWidth);
		[self snap:YES];
	}
	
	else {
        CGFloat posX = cPos.x;
        
        if(posX < pMinX)
            posX = pMinX;
        
        if(posX >= pMaxX)
            posX = pMaxX-1;
        
        self.snapToIndex = floor(posX/self.segmentWidth);
        [self snap:YES];
    }
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
    [super cancelTrackingWithEvent:event];
    
    if(self.trackingThumb)
		[self snap:YES];
}

#pragma mark -

- (void)snap:(BOOL)animated {
    
	[self.thumb deactivate];
    
    if(self.crossFadeLabelsOnDrag)
        self.thumb.secondLabel.alpha = 0;
    
	int index;
	
	if(self.snapToIndex != -1)
		index = self.snapToIndex;
	else
		index = floor(self.thumb.center.x/self.segmentWidth);
	
	[self.thumb setTitleData:[self.titlesArray objectAtIndex:index]];
    
    if(self.changeHandler && self.snapToIndex != self.selectedIndex && !self.isTracking)
		self.changeHandler(self.snapToIndex);
    
	if(animated)
		[self moveThumbToIndex:index animate:YES];
	else
		self.thumb.frame = [[self.thumbRects objectAtIndex:index] CGRectValue];
}

- (void)updateTitles {
	int hoverIndex = floor(self.thumb.center.x/self.segmentWidth);
	
	BOOL secondTitleOnLeft = ((self.thumb.center.x / self.segmentWidth) - hoverIndex) < 0.5;
	
	if (secondTitleOnLeft && hoverIndex > 0) {
		self.thumb.label.alpha = 0.5 + ((self.thumb.center.x / self.segmentWidth) - hoverIndex);
//		self.thumb.secondLabel.text = [self.titlesArray objectAtIndex:hoverIndex - 1];
		self.thumb.secondLabel.alpha = 0.5 - ((self.thumb.center.x / self.segmentWidth) - hoverIndex);
	}
	
    else if (hoverIndex + 1 < self.titlesArray.count) {
		self.thumb.label.alpha = 0.5 + (1 - ((self.thumb.center.x / self.segmentWidth) - hoverIndex));
//		self.thumb.secondLabel.text = [self.titlesArray objectAtIndex:hoverIndex + 1];
		self.thumb.secondLabel.alpha = ((self.thumb.center.x / self.segmentWidth) - hoverIndex) - 0.5;
	}
	
    else {
		self.thumb.secondLabel.text = nil;
		self.thumb.label.alpha = 1.0;
	}
    
	[self.thumb setTitleData:[self.titlesArray objectAtIndex:hoverIndex]];
}

- (void)activate {
	
	self.trackingThumb = self.moved = NO;
	
	[self.thumb setTitleData:[self.titlesArray objectAtIndex:self.selectedIndex]];
    
    void (^oldChangeHandler)(id sender) = [self valueForKey:@"selectedSegmentChangedHandler"];//定义名为oldChangeHandler的独立闭包
    
	if(oldChangeHandler)
		oldChangeHandler(self);
    
    if([self valueForKey:@"delegate"]) {
        id controlDelegate = [self valueForKey:@"delegate"];
        
        if([controlDelegate respondsToSelector:@selector(segmentedControl:didSelectIndex:)])
            [controlDelegate segmentedControl:self didSelectIndex:selectedIndex];
    }
    
	[UIView animateWithDuration:0.1
						  delay:0
						options:UIViewAnimationOptionAllowUserInteraction
					 animations:^{
						 self.activated = YES;
						 [self.thumb activate];
					 }
					 completion:NULL];
}


- (void)toggle {
	
	if(self.snapToIndex == 0)
		self.snapToIndex = 1;
	else
		self.snapToIndex = 0;
	
	[self snap:YES];
}

- (void)moveThumbToIndex:(NSUInteger)segmentIndex animate:(BOOL)animate {
    
    self.selectedIndex = segmentIndex;
    [self sendActionsForControlEvents:UIControlEventValueChanged];//模拟用户点击
    
	if(animate) {
        
        [self.thumb deactivate];
		
		[UIView animateWithDuration:0.2
							  delay:0
							options:UIViewAnimationOptionCurveEaseOut
						 animations:^{
							 self.thumb.frame = [[self.thumbRects objectAtIndex:segmentIndex] CGRectValue];
                             
							 if(self.crossFadeLabelsOnDrag)
								 [self updateTitles];
						 }
						 completion:^(BOOL finished){
                             if (finished) {
                                 [self activate];
                             }
						 }];
	}
	
	else {
		self.thumb.frame = [[self.thumbRects objectAtIndex:segmentIndex] CGRectValue];
		[self activate];
	}
}

#pragma mark -

- (void)setBackgroundImage:(UIImage *)newImage {
    
    if(backgroundImage)
        backgroundImage = nil;
    
    if(newImage) {
        backgroundImage = newImage;
        self.height = backgroundImage.size.height;
    }
}

#pragma mark - Support for deprecated methods

- (void)setSegmentPadding:(CGFloat)newPadding {
    self.titleEdgeInsets = UIEdgeInsetsMake(0, newPadding, 0, newPadding);
}

- (void)setShadowOffset:(CGSize)newOffset {
    self.textShadowOffset = newOffset;
}

- (void)setShadowColor:(UIColor *)newColor {
    self.textShadowColor = newColor;
}

#pragma mark- SPSegmentedControl

- (void)segmentedControlChangedValue:(DragonUISegmentedControl*)segmentedControl {
    if (selectedIndex!=_i_lastSelectIndex) {
        _b_selectChange=YES;
        _i_lastSelectIndex=selectedIndex;
    }else{
        _b_selectChange=NO;
    }
    [self sendViewSignal:[DragonUISegmentedControl SEGMENTCHANGED] withObject:segmentedControl from:self];
    
}

@end
