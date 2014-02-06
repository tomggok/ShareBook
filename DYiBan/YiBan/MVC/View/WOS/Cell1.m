
#import "Cell1.h"

@implementation Cell1
@synthesize titleLabel,arrowImageView;

- (void)dealloc
{
    self.titleLabel = nil;
    self.arrowImageView = nil;
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        [self creatCell];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)changeArrowWithUp:(BOOL)up
{
    if (up) {
        self.arrowImageView.image = [UIImage imageNamed:@"UpAccessory.png"];
    }else
    {
        self.arrowImageView.image = [UIImage imageNamed:@"DownAccessory.png"];
    }
}

-(void)creatCell{

    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 5.0f, 50.0f, 50.0f)];
    [self addSubview:titleLabel];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    RELEASE(titleLabel);
    
    arrowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(200.0f, 5.0f, 50.0f, 50.0f)];
    [arrowImageView setBackgroundColor:[UIColor clearColor]];
    [self addSubview:arrowImageView];
    RELEASE(arrowImageView);


}

@end
