//
//  Constants.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import UIKit

enum Constants {
    static let approxDaysInMonth: Double = 30.0
    static let debounceValue = 300 // milliseconds
    static let bannerCarouselDurationValue = 5.0
    static let phoneNumberDigitCountWithoutCode: Int = 10
    static let phoneNumberDigitCountForRussia: Int = 11
    static let phoneNumberDigitCountForBelarus: Int = 12
    static let birthdateDefaultAge: Int = 18
    static let maximumEmailLength: Int = 320
    static let inzLength: Int = 9
    static let defaultCornerRadiusValue: CGFloat = 10.0
    static let enterPromoCodeRadiusValue: CGFloat = 14.0
    static let snackViewDurationValue = 5.0
    static let orderCellsShadowRadius: CGFloat = 4.0
    static let mapDetailsViewDefaultHeight: CGFloat = 350.0
    static let mapDetailsViewDefaultHeightForCart: CGFloat = 410.0
    static let mapDetailsViewTopMargin: CGFloat = 20.0
    static let routeButtonFadeLimit: CGFloat = 490.0
    static let routeButtonFadeSmallLimit: CGFloat = 430.0
    static let closeButtonDimension: CGFloat = 30.0
    static let tabbarHeight: CGFloat = 50.0
    
    // swiftlint:disable identifier_name
    static let headerViewComplexAnalysesTextHeightValue: CGFloat = 100.0
    static let headerLabelComplexAnalysesHeightValue: CGFloat = 62.0
    static let headerViewComplexAnalysesHeight: CGFloat = 50.0
    static let headerLabelComplexAnalysesBottomOffsetValue: CGFloat = 16.0
    static let headerLabelUsualAnalysesBottomOffsetValue: CGFloat = 8.0
    static let INZBriefTableViewCellHeight: CGFloat = 78
    static let orderDetailSectionContentTopMargin: CGFloat = 16
    static let orderDetailSectionContentBottomMargin: CGFloat = 31
    
    static let navigationViewHeight: CGFloat = 44.7
    static let defaultTabBarHeight: CGFloat = UIDevice().isXSeriesScreen ? 83.0 : 49.0
    static let statusBarHeight: CGFloat = 20.0
    static let navigationViewTopOffsetValue: CGFloat = 20.0
    static let navigationViewTopOffsetiPhoneXValue: CGFloat = 48.0
    static let collectionViewSideInsetValue: CGFloat = 10.0
    static let resendCodeTimeoutDuration: Int = 15
    static let complexAnalysisSectionHeight: CGFloat = 281.0
    
    static let dashboardMainPageFirstSectionHeaderHeight: CGFloat = 80.0
    static let dashboardMainPageSectionHeaderHeight: CGFloat = 54.0
    
    static let medCardsSectionHeaderHeight: CGFloat = 39.0
    static let medCardsSectionFooterHeight: CGFloat = 70.0
    static let cartSnackViewShowingDelayValue: Double = 0.75
    
    static let analysisListCartButtonTopInset: CGFloat = 10.0
    static let analysisListCartButtonBottomInset: CGFloat = 10.0
    static let analysisListCartButtonLeftInset: CGFloat = 10.0
    static let analysisListCartButtonRightInset: CGFloat = 10.0
    
    static let analysisListCartButtonTappedTopInset: CGFloat = 12.0
    static let analysisListCartButtonTappedBottomInset: CGFloat = 12.0
    static let analysisListCartButtonTappedLeftInset: CGFloat = 12.0
    static let analysisListCartButtonTappedRightInset: CGFloat = 12.0
    static let analysisDetailsCartButtonBottomCostraint: CGFloat = UIDevice.current.isXSeriesScreen ? 60.0 : 75.0
    
    static let roundedButtonStandardTopInset: CGFloat = 6.0
    static let roundedButtonStandardBottomInset: CGFloat = 6.0
    static let roundedButtonStandardLeftInset: CGFloat = 17.0
    static let roundedButtonStandardRightInset: CGFloat = 17.0
    
    static let makeOrderShowResultsButtonStandardTopInset: CGFloat = 6.0
    static let makeOrderShowResultsButtonStandardBottomInset: CGFloat = 6.0
    static let makeOrderShowResultsButtonStandardLeftInset: CGFloat = 13.0
    static let makeOrderShowResultsButtonStandardRightInset: CGFloat = 13.0
    
    static let mapBackButtonTopInset: CGFloat = 9.0
    static let mapBackButtonBottomInset: CGFloat = 9.0
    static let mapBackButtonLeftInset: CGFloat = 14.0
    static let mapBackButtonRightInset: CGFloat = 14.0
    
    static let orangeSmallButtonTopInset: CGFloat = 4.0
    static let orangeSmallButtonBottomInset: CGFloat = 4.0
    static let orangeSmallButtonLeftInset: CGFloat = 14.0
    static let orangeSmallButtonRightInset: CGFloat = 14.0
    
    static let cityFinishContinueButtonTopInset: CGFloat = 12.5
    static let cityFinishContinueButtonBottomInset: CGFloat = 12.5
    static let cityFinishContinueButtonLeftInset: CGFloat = 22.0
    static let cityFinishContinueButtonRightInset: CGFloat = 22.0
    static let authSideConstraintValue: CGFloat = 32.0
    static let authLimiterCenterPaddingValue: CGFloat = 70.0
    static let cityFinishContinueButtonMinLeftInset: CGFloat = 16.0
    static let cityFinishContinueButtonMinRightInset: CGFloat = 16.0
    
    static let officesStateSwitchCornerRadius: CGFloat = 8.0
    static let officeViewCellRadius: CGFloat = 15.0
    
    static let parentViewCornerRadius: CGFloat = 20.0
    static let closeHandlerCornerRadius: CGFloat = 3.0
    static let searchModuleTopPaddingFromNavbar: CGFloat = 35.0
    static let stateSwitchVerticalSpacing: CGFloat = 14.0
    static let searchModuleZeroTopPaddingFromNavbar: CGFloat = 0
    static let switchSideOffset: CGFloat = 20.0
    static let searshBarSideOffset: CGFloat = 10.0
    
    static let defaultTooltipCornerRadiusValue: CGFloat = 7.0
    static let minPaddingFromTextField: CGFloat = 18.0
    static let bottomTooltipBackgoundPadding: CGFloat = 10.0
    static let bottomTooltipLabelPadding: CGFloat = 20.0
    static let topTooltipLabelPadding: CGFloat = 10.0
    
    static let dashboardTapCellWidth: CGFloat = 165.0
    static let dashboardPromosCellWidth: CGFloat = 135
    static let dashboardPromosCellLeadingAnchor: CGFloat = 16
    static let dashboardAnalysesCellWidth: CGFloat = 270.0
    static let dashboardAnalysesSmallCellWidth: CGFloat = 250.0
    static let dashboardOfficesCellWidth: CGFloat = 310.0
    static let dashboardOfficesSmallCellWidth: CGFloat = 220.0
    static let dashboardPromosCellHeight: CGFloat = 150
    static let dashboardCategoriesCellHeight: CGFloat = 195.0
    static let dashboardCategoriesCellWidth: CGFloat = 230.0
    static let dashboardOfficesCellHeightWithHiddenIcons: CGFloat = 150.0
    static let dashboardOfficesCellHeight: CGFloat = 195.0
    static let dashboardOfficesCellHeightIfLocationOff: CGFloat = 125
    static let dashboardAnalysesCellHeight: CGFloat = 205.0
    static let dashboardAnalysesCellContentViewHeight: CGFloat = 185.0
    static let dashboardAnalysesCellHeightIfSmallScreen: CGFloat = 140.0
    static let cartViewHeight: CGFloat = 65.0
    static let cartNotAvailablePadding: CGFloat = 20.0
    static let cartNotAvailableImageDescriptionPadding: CGFloat = 17.0
    static let cartNotAvailableImageSide: CGFloat = 25.0
    static let chartHeightConstraint: CGFloat = 250.0
    static let chartHeightConstraintSmall:CGFloat = 200.0
    static let chartHeightConstraintLandscape: CGFloat = 245.0
    static let chartHeightConstraintLandscapeSmall: CGFloat = 200.0
    static let chartSliderContainerTopConstraint: CGFloat = 20.0
    static let chartSliderContainerTopConstraintLandscape: CGFloat = 15.0
    
    static let needToShowPinCodeTimeInterval: TimeInterval = 60.0
    
    static let defaultKeyboardBackspaceCode: Int = -92
    static let phoneNumberFormat = "+X (XXX) XXX-XX-XX"
    static let dateProfileFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    static let waitingScreenDelayValue: Double = 0.5
    static let resultDetailPriceCellHeight: CGFloat = 38.5
    static let calendarCellOffset: CGFloat = 10.0
    
    static let mainScreenOfficeWidthAnchor: CGFloat = 270.0
    static let mainScreenOfficeHeighAnchor: CGFloat = 195.0
    static let mainScreenOfficeHeightIfLocationOffAnchor: CGFloat = 155.0
    static let mainScreenOfficeBackButtonLeading: CGFloat = 5.0
    static let mainScreenOfficeCloseButtonLeading: CGFloat = 20.0
    
    static let mainScreenIconWidthAnchor: CGFloat = 30.0
    static let mainScreenIconHeighAnchor: CGFloat = 30.0
    
    static let labelContainerHeightAnchor: CGFloat = 91
    static let labelContainerWidthAnchor: CGFloat = 185

    static let subwayDistanceTopAnchor: CGFloat = 30
    static let subwayDistanceLeadingAnchor: CGFloat = 20

    static let subwayNameHeaderLeadingAnchor: CGFloat =  20
    static let subwayNameHeaderTrailingAnchor: CGFloat =  -10

    static let colorOfSubwayLineLeadingAnchor: CGFloat =  20
    static let colorOfSubwayLineHeight: CGFloat = 12
    static let colorOfSubwayLineWidth: CGFloat =  12
    
    static let subwayStackViewLeadingAnchor: CGFloat = 20
    static let subwayStackViewTopAnchor: CGFloat = 10

    static let subwayNameFooterTopAnchor: CGFloat = 10
    static let subwayNameFooterLeadingFromColorLine: CGFloat = 10
    static let subwayNameFooterLeadingAnchor: CGFloat = 20
    static let subwayNameFooterTrailingAnchor: CGFloat = -10

    static let closingHoursTopAnchor: CGFloat = 10
    static let closingHoursLeadingAnchor: CGFloat = 20
    static let closingHoursBottomAnchor: CGFloat = -10

    static let likeButtonWidthAndHeightAnchor: CGFloat = 35
    
    static let enterRegistrationImageViewTopAnchor: CGFloat = 202
    static let enterRegistrationImageViewWidthAndHeightAnchor: CGFloat = 210
    static let enterRegistrationTitleLabelTopAnchor: CGFloat = 15
    static let enterRegistrationTitleLabelLeadingTrailingAnchor: CGFloat = 10
    static let enterRegistrationButtonStackViewTopAnchor: CGFloat = 20
    static let enterRegistrationButtonStackViewLeadingTrailingAnchor: CGFloat = 75
    static let enterRegistrationAuthorizeButtonWidthAnchor: CGFloat = 110
    static let enterRegistrationAuthorizeButtonHeightAnchor: CGFloat = 40
    
    static let saveButtonTopResultFooter: CGFloat = 15
    static let saveButtonTrailingResultFooter: CGFloat = -20
    static let saveButtonHeightResultFooter: CGFloat = 40
    static let saveButtonLeadingResultFooter: CGFloat = 10

    static let notSaveButtonTopResultFooter: CGFloat = 15
    static let notSaveButtonTrailingResultFooter: CGFloat =  -10
    static let notSaveButtonHeightResultFooter: CGFloat = 40
    static let notSaveButtonLeadingResultFooter: CGFloat = 20
    
    static let nameOfPatientTopHeader: CGFloat = 20
    static let nameOfPatientLeadingHeader: CGFloat = 30
    static let nameOfPatientTrailingHeader: CGFloat  = -30
    static let inzNumberTopHeader: CGFloat = 20
    
    static let hightHeaderResult: CGFloat = 140
    static let hightFooterResult: CGFloat = 85
    
    static let measurementValueTrailingCell: CGFloat = -20
    static let measurementUnderValueBottomCell: CGFloat = -20
    static let titleLabelLeadingCell: CGFloat  = 20
    
    static let dayLabelScheduleViewCellTopAnchor: CGFloat = 10
    static let dayLabelScheduleViewCellLeadingAnchor: CGFloat = 20

    static let stackViewScheduleViewCellTopBottomAnchor: CGFloat = 7
    
    static let headerScheduleMainViewHeightAnchor: CGFloat = 50
    static let stackViewScheduleMainViewTopCloseButtonAnchor: CGFloat = -8
    static let closeButtonScheduleMainViewHeightWidthAnchor: CGFloat = 30
    
    static let titleScheduleHeaderViewTopAnchor: CGFloat = 15
    static let titleScheduleHeaderViewLeadingAnchor: CGFloat = 15
    static let titleScheduleHeaderViewBottomAnchor: CGFloat = -10
    static let scheduleViewControllerWidthAnchor: CGFloat = 275
    static let scheduleViewControllerWidthAnchorIfSmallScreen: CGFloat = 260
    
    static let constantToCorrectedOfficePointIfGeoOff = 0.05
    static let onboardingButtonHeight: CGFloat = UIDevice.current.isSmallScreen ? 25.0 : 40.0
    
    static let buttonAnimationDuration: TimeInterval = 0.05
    static let buttonTappedAlphaValue: CGFloat = 0.3
    static let buttonReleasedAlphaValue: CGFloat = 1.0
    
    static let cartButtonIsNotAddedTag = 0
    static let cartButtonIsAddedTag = 1
    static let tableViewCellDefaultHeight: CGFloat = 44
    
    static let basketShowOnPopDelay: TimeInterval = 0.1
    static let rateAppStoreCount = 4
    
    // MARK: - Cart
    
    static let defaultPayCardValue = false
    
    static var dynamicTopOffset: CGFloat {
        return UIDevice().isXSeriesScreen
            ? Constants.navigationViewTopOffsetiPhoneXValue
            : Constants.navigationViewTopOffsetValue
    }
    
    static var dynamicNavBarOffset: CGFloat {
        return dynamicTopOffset + navigationViewHeight
    }
}

enum CacheKeys {
    static let tappedItemFrame = "tappedItemFrame"
    static let tappedTitleFrame = "tappedTitleFrame"
    static let title = "title"
}
