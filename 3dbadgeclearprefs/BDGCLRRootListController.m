#include "BDGCLRRootListController.h"

@implementation BDGLRHeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];
    if (self) {
        self.titleLabel.textColor = [UIColor whiteColor];
        self.subtitleLabel.textColor = [UIColor whiteColor];
    }
    return self;
}

@end

@implementation BDGCLRRootListController

- (instancetype)init {
  self = [super init];

  if (self) {
      CTDPreferenceSettings *preferenceSettings = [[CTDPreferenceSettings alloc] init];
      preferenceSettings.customizeNavbar = YES;
      
      preferenceSettings.tintColor = [UIColor colorWithRed:2.0f / 255.0f
                                                   green:168.0f / 255.0f
                                                    blue:132.0f / 255.0f
                                                   alpha:1];
      preferenceSettings.barTintColor = preferenceSettings.tintColor;
      self.preferenceSettings = preferenceSettings;

      UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
      titleLabel.text = @"3DBadgeClear";
      titleLabel.font = [UIFont boldSystemFontOfSize:18];
      titleLabel.textAlignment = NSTextAlignmentCenter;
      titleLabel.backgroundColor = [UIColor clearColor];
      titleLabel.textColor = [UIColor whiteColor];
      [titleLabel sizeToFit];
      self.navigationItem.titleView = titleLabel;

  }

  return self;
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)setSpecifier:(PSSpecifier *)specifier {
    [super setSpecifier:specifier];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    CGRect frame = self.table.bounds;
    frame.origin.y = -frame.size.height;
    
    [self.navigationController.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationController.navigationBar.translucent = YES;
}

- (void)github {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/isklikas/3DBadgeClear"] options:@{} completionHandler:nil];
}

- (void)twitter {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/isklikas"] options:@{} completionHandler:nil];
}

- (void)form {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://forms.gle/4MSaXZzYzQJKqLRr8"] options:@{} completionHandler:nil];
}

- (void)email {
    [self sendEmailTo:@"jsklikas@gmail.com" withSubject:@"3DBadgeClear Support" withBody:@""];
}

- (void) sendEmailTo:(NSString *)to withSubject:(NSString *)subject withBody:(NSString *)body {
    NSString *mailString = [NSString stringWithFormat:@"mailto:?to=%@&subject=%@&body=%@",
                        [to stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
                        [subject stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
                        [body stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailString]];
}

- (void)paypal {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.me/isklikas"] options:@{} completionHandler:nil];
}

@end
