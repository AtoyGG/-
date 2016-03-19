//
//  UILabel+Height.m
//  多个UILabel
//
//  Created by LingYiKeJi on 16/3/17.
//  Copyright © 2016年 vera. All rights reserved.
//

#import "UILabel+Height.h"

/*
 property(NS_NONATOMIC_IOSONLY) CGFloat lineSpacing;
 @property(NS_NONATOMIC_IOSONLY) CGFloat paragraphSpacing;
 @property(NS_NONATOMIC_IOSONLY) NSTextAlignment alignment;
 @property(NS_NONATOMIC_IOSONLY) CGFloat firstLineHeadIndent;
 @property(NS_NONATOMIC_IOSONLY) CGFloat headIndent;
 @property(NS_NONATOMIC_IOSONLY) CGFloat tailIndent;
 @property(NS_NONATOMIC_IOSONLY) NSLineBreakMode lineBreakMode;
 @property(NS_NONATOMIC_IOSONLY) CGFloat minimumLineHeight;
 @property(NS_NONATOMIC_IOSONLY) CGFloat maximumLineHeight;
 @property(NS_NONATOMIC_IOSONLY) NSWritingDirection baseWritingDirection;
 @property(NS_NONATOMIC_IOSONLY) CGFloat lineHeightMultiple;
 @property(NS_NONATOMIC_IOSONLY) CGFloat paragraphSpacingBefore;
 @property(NS_NONATOMIC_IOSONLY) float hyphenationFactor;
 @property(null_resettable, copy, NS_NONATOMIC_IOSONLY) NSArray<NSTextTab *> *tabStops NS_AVAILABLE(10_0, 7_0);
 @property(NS_NONATOMIC_IOSONLY) CGFloat defaultTabInterval NS_AVAILABLE(10_0, 7_0);
 @property(NS_NONATOMIC_IOSONLY) BOOL allowsDefaultTighteningForTruncation NS_AVAILABLE(10_11, 9_0);
 */

@implementation UILabel (Height)

- (CGFloat)heightWithLabel:(UILabel *)label width:(CGFloat)width fontSize:(CGFloat)fontSize{
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];

    paragraph.alignment = NSTextAlignmentJustified;
    paragraph.firstLineHeadIndent = 37;
    paragraph.lineSpacing = 5;
    paragraph.paragraphSpacing = 10;
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.headIndent = 5;
    paragraph.tailIndent = -5;
//    paragraph.paragraphSpacingBefore = 20;
//    paragraph.hyphenationFactor = 1.0;
    
    NSDictionary *attributes = @{
                                    NSFontAttributeName:FONT_SYSTEM(fontSize),
                                    NSParagraphStyleAttributeName:paragraph,
                                    NSForegroundColorAttributeName:RGB(45, 45, 150)};
    
    label.attributedText = [[NSAttributedString alloc] initWithString:label.text attributes:attributes];
    
    CGRect rect = [label.text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    return rect.size.height;
}

@end
