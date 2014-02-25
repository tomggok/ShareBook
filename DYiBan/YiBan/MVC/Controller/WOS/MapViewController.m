//
//  MapViewController.m
//  
//
//  Created by Jian-Ye on 12-10-16.
//  Copyright (c) 2012年 Jian-Ye. All rights reserved.
//

#import "MapViewController.h"
#import "CallOutAnnotationVifew.h"
#import "JingDianMapCell.h"
#define span 40000

@interface MapViewController ()
{
    NSMutableArray *_annotationList;
    
    CalloutMapAnnotation *_calloutAnnotation;
	CalloutMapAnnotation *_previousdAnnotation;
    
}
-(void)setAnnotionsWithList:(NSArray *)list;

@end

@implementation MapViewController

@synthesize mapView=_mapView;
@synthesize target;
@synthesize delegate;
DEF_SIGNAL(TOUCHANNITION)
- (void)dealloc
{
    [target release];
    [_mapView release];
    [_annotationList release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    _annotationList = [[NSMutableArray alloc] init];
    
    
    _mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f,CGRectGetHeight(self.view.frame))];
    _mapView.mapType=MKMapTypeStandard;
    _mapView.delegate=self;
    _mapView.showsUserLocation=YES;
    [self.view addSubview:_mapView];
    RELEASE(_mapView);

    [super viewDidLoad];
}

-(void)setAnnotionsWithList:(NSArray *)list
{
    for (NSDictionary *dic in list) {
        
        CLLocationDegrees latitude=[[dic objectForKey:@"latitude"] doubleValue];
        CLLocationDegrees longitude=[[dic objectForKey:@"longitude"] doubleValue];
        CLLocationCoordinate2D location=CLLocationCoordinate2DMake(latitude, longitude);
        
        MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(location,span ,span );
        MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:region];
        [_mapView setRegion:adjustedRegion animated:YES];
        
        BasicMapAnnotation *  annotation=[[[BasicMapAnnotation alloc] initWithLatitude:latitude andLongitude:longitude]  autorelease];
        [_mapView   addAnnotation:annotation];
    }
    
    
}


- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
	if ([view.annotation isKindOfClass:[BasicMapAnnotation class]]) {
        if (_calloutAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
            _calloutAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
            return;
        }
        if (_calloutAnnotation) {
            [mapView removeAnnotation:_calloutAnnotation];
            _calloutAnnotation = nil;
        }
        _calloutAnnotation = [[[CalloutMapAnnotation alloc] 
                               initWithLatitude:view.annotation.coordinate.latitude
                               andLongitude:view.annotation.coordinate.longitude] autorelease];
        [mapView addAnnotation:_calloutAnnotation];
        
        [mapView setCenterCoordinate:_calloutAnnotation.coordinate animated:YES];
	}
    else{
        if([delegate respondsToSelector:@selector(customMKMapViewDidSelectedWithInfo:)]){
            [delegate customMKMapViewDidSelectedWithInfo:@"点击至之后你要在这干点啥"];
        }
    }
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    if (_calloutAnnotation&& ![view isKindOfClass:[CallOutAnnotationVifew class]]) {
        if (_calloutAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
            _calloutAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
            [mapView removeAnnotation:_calloutAnnotation];
            _calloutAnnotation = nil;
            
//            if([delegate respondsToSelector:@selector(customMKMapViewDidSelectedWithInfo:)]){
//                [delegate customMKMapViewDidSelectedWithInfo:@"点击至之后你要在这干点啥"];
//            }
//            if ([delegate respondsToSelector:@selector(customMKMapViewDidSelectedAnnitationWithInfo:)]) {
//                [delegate customMKMapViewDidSelectedAnnitationWithInfo:@"点击至之后你要在这干点啥"];
//            }
//            if (target) {
//                
//                NSLog(@"ffff");
//                
////                [self sendViewSignal:[MapViewController TOUCHANNITION] withObject:@"dd" from:self target:target];
//            }
            
        }
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	if ([annotation isKindOfClass:[CalloutMapAnnotation class]]) {

        CallOutAnnotationVifew *annotationView = (CallOutAnnotationVifew *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CalloutView"];
        if (!annotationView) {
            annotationView = [[[CallOutAnnotationVifew alloc] initWithAnnotation:annotation reuseIdentifier:@"CalloutView"] autorelease];
//            JingDianMapCell  *cell = [[[NSBundle mainBundle] loadNibNamed:@"JingDianMapCell" owner:self options:nil] objectAtIndex:0];
            JingDianMapCell *cell = [[JingDianMapCell alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 60)];
            [cell setBackgroundColor:[UIColor yellowColor]];
            cell.targetObjc  = self;
            [annotationView.contentView addSubview:cell];
//            [annotationView.contentView setBackgroundColor:[UIColor blueColor]];
        }
        return annotationView;
	} else if ([annotation isKindOfClass:[BasicMapAnnotation class]]) {
        
         MKAnnotationView *annotationView =[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
        if (!annotationView) {
            annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation 
                                                           reuseIdentifier:@"CustomAnnotation"] autorelease];
            annotationView.canShowCallout = NO;
            annotationView.image = [UIImage imageNamed:@"pin.png"];
        }
		
		return annotationView;
    }
	return nil;
}
- (void)resetAnnitations:(NSArray *)data
{
    [_annotationList removeAllObjects];
    [_annotationList addObjectsFromArray:data];
    [self setAnnotionsWithList:_annotationList];
}
- (void)handleViewSignal_JingDianMapCell:(MagicViewSignal *)signal
{
    if ([signal is:[JingDianMapCell TOUCHCELL]])
    {

        UIView *view = (UIView *)[signal object];
        
        
        NSLog(@"dddd");
        
        UIView *viewww = [[view superview] superview];
        if (_calloutAnnotation&& [viewww isKindOfClass:[CallOutAnnotationVifew class]]) {
            CallOutAnnotationVifew *tt = (CallOutAnnotationVifew *)viewww;
            if (_calloutAnnotation.coordinate.latitude == tt.annotation.coordinate.latitude&&
                _calloutAnnotation.coordinate.longitude == tt.annotation.coordinate.longitude) {
                [_mapView removeAnnotation:_calloutAnnotation];
                _calloutAnnotation = nil;
                
                [self mapView:nil didDeselectAnnotationView:nil];
                
                
                NSDictionary *dic1=[NSDictionary dictionaryWithObjectsAndKeys:@"30.281843",@"latitude",@"120.102193",@"longitude",nil];
                
                NSDictionary *dic2=[NSDictionary dictionaryWithObjectsAndKeys:@"30.290144",@"latitude",@"120.146696‎",@"longitude",nil];
                
                NSDictionary *dic3=[NSDictionary dictionaryWithObjectsAndKeys:@"30.248076",@"latitude",@"120.164162‎",@"longitude",nil];
                
                NSDictionary *dic4=[NSDictionary dictionaryWithObjectsAndKeys:@"30.425622",@"latitude",@"120.299605",@"longitude",nil];
                
                NSArray *array = [NSArray arrayWithObjects:dic1,dic2,dic3,dic4, nil];
                
                [self resetAnnitations:array];
                
                 [self sendViewSignal:[MapViewController TOUCHANNITION] withObject:@"dd" from:self target:target];
            }
        }
    }
}

#pragma mark - back button signal
- (void)handleViewSignal_DYBBaseViewController:(MagicViewSignal *)signal
{
    if ([signal is:[DYBBaseViewController BACKBUTTON]])
    {
        [self.drNavigationController popViewControllerAnimated:YES];
    }else if ([signal is:[DYBBaseViewController NEXTSTEPBUTTON]]){
    }
}

@end
