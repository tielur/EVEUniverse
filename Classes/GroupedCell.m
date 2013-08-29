//
//  GroupedCell.m
//  EVEUniverse
//
//  Created by mr_depth on 20.07.13.
//
//

#import "GroupedCell.h"

@interface GroupedCell()
@property (nonatomic, assign) UITableViewCellStyle style;

@end

@implementation GroupedCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		self.style = style;
		self.textLabel.textColor = [UIColor whiteColor];
		self.textLabel.shadowColor = [UIColor blackColor];
		self.textLabel.font = [UIFont systemFontOfSize:12];
		self.textLabel.backgroundColor = [UIColor clearColor];
		
		self.detailTextLabel.textColor = [UIColor lightTextColor];
		self.detailTextLabel.shadowColor = [UIColor blackColor];
		self.detailTextLabel.font = [UIFont systemFontOfSize:12];
		self.detailTextLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void) awakeFromNib {
	self.textLabel.textColor = [UIColor whiteColor];
	self.textLabel.shadowColor = [UIColor blackColor];
	self.textLabel.font = [UIFont systemFontOfSize:12];
	self.textLabel.backgroundColor = [UIColor clearColor];
	
	self.detailTextLabel.textColor = [UIColor lightTextColor];
	self.detailTextLabel.shadowColor = [UIColor blackColor];
	self.detailTextLabel.font = [UIFont systemFontOfSize:12];
	self.detailTextLabel.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setGroupStyle:(GroupedCellGroupStyle)groupStyle {
	_groupStyle = groupStyle;
	UIImage* backgroundImage = nil;
	UIImage* selectedBackgroundImage = nil;
	UIEdgeInsets edgeInsets;
	
	if (groupStyle == GroupedCellGroupStyleTop) {
		backgroundImage = [UIImage imageNamed:@"cellGroupedTop.png"];
		selectedBackgroundImage = [UIImage imageNamed:@"cellGroupedTopSelected.png"];
		edgeInsets = UIEdgeInsetsMake(backgroundImage.size.height * 2.0 / 3.0 - 1, backgroundImage.size.width / 2.0 - 1, backgroundImage.size.height / 3.0, backgroundImage.size.width / 2.0);
	}
	else if (groupStyle == GroupedCellGroupStyleBottom) {
		backgroundImage = [UIImage imageNamed:@"cellGroupedBottom.png"];
		selectedBackgroundImage = [UIImage imageNamed:@"cellGroupedBottomSelected.png"];
		edgeInsets = UIEdgeInsetsMake(backgroundImage.size.height / 3.0 - 1, backgroundImage.size.width / 2.0 - 1, backgroundImage.size.height * 2.0 / 3.0, backgroundImage.size.width / 2.0);
	}
	else if (groupStyle == GroupedCellGroupStyleMiddle) {
		backgroundImage = [UIImage imageNamed:@"cellGroupedMiddle.png"];
		selectedBackgroundImage = [UIImage imageNamed:@"cellGroupedMiddleSelected.png"];
		edgeInsets = UIEdgeInsetsMake(backgroundImage.size.height / 2.0 - 1, backgroundImage.size.width / 2.0 - 1, backgroundImage.size.height / 2.0, backgroundImage.size.width / 2.0);
	}
	else {
		backgroundImage = [UIImage imageNamed:@"cellGrouped.png"];
		selectedBackgroundImage = [UIImage imageNamed:@"cellGroupedSelected.png"];
		edgeInsets = UIEdgeInsetsMake(backgroundImage.size.height / 2.0 - 1, backgroundImage.size.width / 2.0 - 1, backgroundImage.size.height / 2.0, backgroundImage.size.width / 2.0);
	}

	backgroundImage = [backgroundImage resizableImageWithCapInsets:edgeInsets];
	selectedBackgroundImage = [selectedBackgroundImage resizableImageWithCapInsets:edgeInsets];

	self.backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];
	self.selectedBackgroundView = [[UIImageView alloc] initWithImage:selectedBackgroundImage];
}

- (void) layoutSubviews {
	[super layoutSubviews];
	if (self.imageView.image) {
		CGFloat indentationOffset = self.indentationLevel * 10;
		self.imageView.frame = CGRectMake(4 + indentationOffset, 4, 32, 32);
		self.imageView.contentMode = self.imageView.image.size.width < 32 && self.imageView.image.size.height < 32 ? UIViewContentModeCenter : UIViewContentModeScaleAspectFit;
		
		if (self.style == UITableViewCellStyleSubtitle) {
			if (self.textLabel.text.length > 0) {
				CGRect frame = self.textLabel.frame;
				CGFloat maxX = CGRectGetMaxX(frame);
				frame.origin.x = 40 + indentationOffset;
				frame.size.width = maxX - frame.origin.x;
				self.textLabel.frame = frame;
			}
			if (self.detailTextLabel.text.length > 0) {
				CGRect frame = self.detailTextLabel.frame;
				CGFloat maxX = CGRectGetMaxX(frame);
				frame.origin.x = 40 + indentationOffset;
				frame.size.width = maxX - frame.origin.x;
				self.detailTextLabel.frame = frame;
			}
		}
		else if (self.style == UITableViewCellStyleValue1){
			if (self.textLabel.text.length > 0) {
				CGRect frame = self.textLabel.frame;
				CGFloat maxX;
				if (self.detailTextLabel.text.length > 0) {
					CGFloat rightX = CGRectGetMaxX(self.detailTextLabel.frame);
					CGRect rect = [self.detailTextLabel textRectForBounds:CGRectMake(0, 0, self.frame.size.width, self.detailTextLabel.frame.size.height) limitedToNumberOfLines:1];
					maxX = rightX - rect.size.width;
					
					rect.origin.x = maxX;
					rect.origin.y = self.detailTextLabel.frame.origin.y;
					rect.size.height = self.detailTextLabel.frame.size.height;
					self.detailTextLabel.frame = rect;
					maxX -= 10;
				}
				else
					maxX = CGRectGetMaxX(frame);
				frame.origin.x = 40 + indentationOffset;
				frame.size.width = maxX - frame.origin.x;
				self.textLabel.frame = frame;
			}
		}
	}
}

@end