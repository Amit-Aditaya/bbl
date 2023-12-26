import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_classes/buy_membership_page_arguments.dart';
import 'package:flutter_babuland_app/custom_classes/edit_child_profile_arguments.dart';
import 'package:flutter_babuland_app/custom_classes/edit_profile_page_arguments.dart';
import 'package:flutter_babuland_app/custom_classes/membership_invoice_arguments.dart';
import 'package:flutter_babuland_app/custom_classes/membership_select_child_page_arguments.dart';
import 'package:flutter_babuland_app/custom_classes/my_ticket_invoice_page_arguments.dart';
import 'package:flutter_babuland_app/custom_classes/ticket_details_page_arguments.dart';
import 'package:flutter_babuland_app/custom_classes/ticket_invoice_page_arguments.dart';
import 'package:flutter_babuland_app/custom_widgets/class_card.dart';
import 'package:flutter_babuland_app/data/repository/branch_capacity_repository.dart';
import 'package:flutter_babuland_app/data/repository/branch_traffic_repo/badda_traffic_repository.dart';
import 'package:flutter_babuland_app/data/repository/branch_traffic_repo/mirpur_traffic_repository.dart';
import 'package:flutter_babuland_app/data/repository/branch_traffic_repo/uttara_traffic_repository.dart';
import 'package:flutter_babuland_app/data/repository/branch_traffic_repo/wari_traffic_repository.dart';
import 'package:flutter_babuland_app/data/repository/children_repo.dart';
import 'package:flutter_babuland_app/data/repository/class_details_repository.dart';
import 'package:flutter_babuland_app/data/repository/class_repository.dart';
import 'package:flutter_babuland_app/data/repository/coupon/my_coupon_repository.dart';
import 'package:flutter_babuland_app/data/repository/coupon/scanned_coupon_repository.dart';
import 'package:flutter_babuland_app/data/repository/coupon_item_repository.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';
import 'package:flutter_babuland_app/data/repository/dessert_repository.dart';
import 'package:flutter_babuland_app/data/repository/drinks_repository.dart';
import 'package:flutter_babuland_app/data/repository/expired_ticket_repository.dart';
import 'package:flutter_babuland_app/data/repository/fast_food_repository.dart';
import 'package:flutter_babuland_app/data/repository/free_ticket_repository.dart';
import 'package:flutter_babuland_app/data/repository/ice_cream_repository.dart';
import 'package:flutter_babuland_app/data/repository/memberhsip_repository.dart';
import 'package:flutter_babuland_app/data/repository/membership_subscription_repository.dart';
import 'package:flutter_babuland_app/data/repository/notification_history_repository.dart';
import 'package:flutter_babuland_app/data/repository/offer_item_repository.dart';
import 'package:flutter_babuland_app/data/repository/offer_repository.dart';
import 'package:flutter_babuland_app/data/repository/party_booking_history_repository.dart';
import 'package:flutter_babuland_app/data/repository/past_events_repository.dart';
import 'package:flutter_babuland_app/data/repository/reward_points_repository/reward_points_history_repository.dart';
import 'package:flutter_babuland_app/data/repository/reward_points_repository/reward_points_sum_repository.dart';
import 'package:flutter_babuland_app/data/repository/slot_booking/slot_booking_branch_repository.dart';
import 'package:flutter_babuland_app/data/repository/slot_booking/slot_booking_event_repository.dart';
import 'package:flutter_babuland_app/data/repository/slot_booking/slot_booking_time_repository.dart';
import 'package:flutter_babuland_app/data/repository/slot_booking/slot_repository.dart';
import 'package:flutter_babuland_app/data/repository/ticket_item_repository.dart';
import 'package:flutter_babuland_app/data/repository/ticket_order_item_repository.dart';
import 'package:flutter_babuland_app/data/repository/ticket_order_repository.dart';
import 'package:flutter_babuland_app/data/repository/upcoming_event_repository.dart';
import 'package:flutter_babuland_app/data/repository/valid_ticket_order_repository.dart';
import 'package:flutter_babuland_app/router/app_routes.dart';
import 'package:flutter_babuland_app/views/active_memberships_page.dart';
import 'package:flutter_babuland_app/views/add_child_page.dart';
import 'package:flutter_babuland_app/views/book_now_page.dart';
import 'package:flutter_babuland_app/views/buy_memberhsip_page.dart';
import 'package:flutter_babuland_app/views/child_vaccine_age_list_page.dart';
import 'package:flutter_babuland_app/views/class_schedule_page.dart';
import 'package:flutter_babuland_app/views/coupon_list_page.dart';
import 'package:flutter_babuland_app/views/coupons_page.dart';
import 'package:flutter_babuland_app/views/customer_care_page.dart';
import 'package:flutter_babuland_app/views/delete_profile_page.dart';
import 'package:flutter_babuland_app/views/deserts_page.dart';
import 'package:flutter_babuland_app/views/drinks_page.dart';
import 'package:flutter_babuland_app/views/edit_child_profile_page.dart';
import 'package:flutter_babuland_app/views/edit_profile_page.dart';
import 'package:flutter_babuland_app/views/events_page.dart';
import 'package:flutter_babuland_app/views/expired_tickets_page.dart';
import 'package:flutter_babuland_app/views/fast_food_page.dart';
import 'package:flutter_babuland_app/views/final_child_vaccine_info_page.dart';
import 'package:flutter_babuland_app/views/final_mom_vaccine_info_page.dart';
import 'package:flutter_babuland_app/views/final_remedy_page.dart';
import 'package:flutter_babuland_app/views/foods_page.dart';
import 'package:flutter_babuland_app/views/free_tickets_page.dart';
import 'package:flutter_babuland_app/views/guest_volume_page.dart';
import 'package:flutter_babuland_app/views/healthy_food_list_page.dart';
import 'package:flutter_babuland_app/views/healthy_food_page.dart';
import 'package:flutter_babuland_app/views/healthy_food_recepie_page.dart';
import 'package:flutter_babuland_app/views/healthy_food_type_page.dart';
import 'package:flutter_babuland_app/views/home_page.dart';
import 'package:flutter_babuland_app/views/ice_cream_page.dart';
import 'package:flutter_babuland_app/views/live_quiz_page.dart';
import 'package:flutter_babuland_app/views/loading_page.dart';
import 'package:flutter_babuland_app/views/locations_page.dart';
import 'package:flutter_babuland_app/views/membership_history_page.dart';
import 'package:flutter_babuland_app/views/membership_invoice_page.dart';
import 'package:flutter_babuland_app/views/membership_page.dart';
import 'package:flutter_babuland_app/views/membership_select_child_page.dart';
import 'package:flutter_babuland_app/views/mom_vaccine_list_page.dart';
import 'package:flutter_babuland_app/views/my_coupons_page.dart';
import 'package:flutter_babuland_app/views/my_ticket_invoice_page.dart';
import 'package:flutter_babuland_app/views/my_ticket_mediator_page.dart';
import 'package:flutter_babuland_app/views/my_tickets_page.dart';
import 'package:flutter_babuland_app/views/new_login_page.dart';
import 'package:flutter_babuland_app/views/notification_history_page.dart';
import 'package:flutter_babuland_app/views/offer_ticket_invoice_page.dart';
import 'package:flutter_babuland_app/views/offers_page.dart';
import 'package:flutter_babuland_app/views/opening_hours_page.dart';
import 'package:flutter_babuland_app/views/parenting_page.dart';
import 'package:flutter_babuland_app/views/party_booking_history_page.dart';
import 'package:flutter_babuland_app/views/party_booking_mediator_page.dart';
import 'package:flutter_babuland_app/views/party_booking_page.dart';
import 'package:flutter_babuland_app/views/photo_album_page.dart';
import 'package:flutter_babuland_app/views/profile_page.dart';
import 'package:flutter_babuland_app/views/quiz_page.dart';
import 'package:flutter_babuland_app/views/remedy_age_page.dart';
import 'package:flutter_babuland_app/views/remedy_page.dart';
import 'package:flutter_babuland_app/views/reward_points_history_page.dart';
import 'package:flutter_babuland_app/views/scan_coupon_page.dart';
import 'package:flutter_babuland_app/views/scanned_coupon_page.dart';
import 'package:flutter_babuland_app/views/schedule_page.dart';
import 'package:flutter_babuland_app/views/select_tickets_page.dart';
import 'package:flutter_babuland_app/views/shows_page.dart';
import 'package:flutter_babuland_app/views/slot_booking/booked_slots_page.dart';
import 'package:flutter_babuland_app/views/slot_booking/slot_booking_branch_page.dart';
import 'package:flutter_babuland_app/views/slot_booking/slot_booking_mediator_page.dart';
import 'package:flutter_babuland_app/views/slot_booking/slot_booking_page.dart';
import 'package:flutter_babuland_app/views/slot_booking/slot_date_page.dart';
import 'package:flutter_babuland_app/views/slot_booking/slot_time_page.dart';
import 'package:flutter_babuland_app/views/social_media_page.dart';
import 'package:flutter_babuland_app/views/ticket_details_page.dart';
import 'package:flutter_babuland_app/views/ticket_invoice_page.dart';
import 'package:flutter_babuland_app/views/tickets_page.dart';
import 'package:flutter_babuland_app/views/vaccine_info_page.dart';
import 'package:flutter_babuland_app/views/valid_tickets_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        FirebaseAuth auth = FirebaseAuth.instance;
        return PageTransition(
            child: auth.currentUser == null
                ? NewLoginPage()
                : MultiRepositoryProvider(
                    providers: [
                      RepositoryProvider(
                        create: (context) => ChildrenRepository(),
                      ),
                      RepositoryProvider(
                        create: (context) => MembershipSubscriptionRepository(),
                      ),
                      RepositoryProvider(
                        create: (context) => RewardPointsSumRepository(),
                      ),
                    ],
                    child: HomePage(
                      currentUser: auth.currentUser,
                    ),
                  ),
            type: PageTransitionType.fade);

      case AppRoutes.eventsPage:
        return PageTransition(
            child: MultiRepositoryProvider(
              providers: [
                RepositoryProvider(
                  create: (context) => PastEventRepository(),
                ),
                RepositoryProvider(
                  create: (context) => UpcomingEventRepository(),
                ),
              ],
              child: const EventsPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.membershipPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => MembershipRepository(),
              child: const MembershipPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.activeMemberhsipPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => MembershipSubscriptionRepository(),
              child: ActiveMembershipsPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.membershipHistoryPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => MembershipSubscriptionRepository(),
              child: MemberhsipHistoryPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.buyMembershipPage:
        final args = settings.arguments as BuyMembershipPageArguments;

        return PageTransition(
            child: MultiRepositoryProvider(
              providers: [
                RepositoryProvider(
                  create: (context) => ChildrenRepository(),
                ),
                RepositoryProvider(
                  create: (context) => MembershipRepository(),
                ),
                RepositoryProvider(
                  create: (context) => MembershipSubscriptionRepository(),
                ),
              ],
              child: BuyMembershipPage(
                packageName: args.packageName,
                packageTitle: args.packageTitle,
                packageId: args.packageId,
                regularPrice: args.regularPrice,
                offerPrice: args.offerPrice,
                duration: args.duration,
                packageValue: args.packageValue,
                packageType: args.packageType,
                //membershipCard: args.membershipCard,
              ),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.membershipInvoicePage:
        final args = settings.arguments as MembershipInvoiceArguments;
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => CustomerRepository(),
              child: MemberhsipInvoicePage(
                childId: args.childId,
                packageTitle: args.packageTitle,
                duration: args.duration,
                id: args.id,
                price: args.price,
                childName: args.childName,
                packageType: args.packageType,
                renwalPackMaxDateTime: args.renewalPackMaxDateTime,
                renewalPackCreateDate: args.renewalPackageCreateDate,
              ),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.membershipSelectChildPage:
        final args = settings.arguments as MembershipSelectChildPageArgument;
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => ChildrenRepository(),
              child: MembershipSelectChildPage(
                membershipcard: args.membershipCard,
              ),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.ticketsPage:
        return PageTransition(
            child: TicketsPage(), type: PageTransitionType.fade);

      case AppRoutes.myTicketsPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => TicketOrderRepository(),
              child: const MyTicketsPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.validTicketsPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => ValidTicketOrderRepository(),
              child: ValidTicketsPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.expiredTicketsPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => ExpiredTicketRepository(),
              child: const ExpiredTicketsPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.myTicketsMediatorPage:
        return PageTransition(
            child: const MyTicketsMediatorPage(),
            type: PageTransitionType.fade);

      case AppRoutes.myTicketInvoicePage:
        final args = settings.arguments as MyTicketInvoicePageArguments;
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => TicketOrderItemRepository(),
              child: MyTicketInvoicePage(
                discountCoupon: args.discountCoupon,
                priceDiscount: args.discountAmount,
                ticketOrderUnixTimeStamp: args.ticketUnixTimeStamp,
                ticketOrderPrice: args.ticketPrice,
                ticketOrderPurchaseDate: args.ticketPurchaseDate,
                ticketOrderId: args.ticketOrderId,
              ),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.freeTicketsPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => FreeTicketRepository(),
              child: FreeTicketsPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.ticketDetailsPage:
        final args = settings.arguments as TicketDetailsPageArguments;
        return PageTransition(
            child: TicketDetailsPage(
              freeTicketContainer: args.ticketContainer,
              ticketItemList: args.list,
            ),
            type: PageTransitionType.fade);

      case AppRoutes.selectTicketsPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => TicketItemRepository(),
              child: SelectTicketsPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.ticketInvoicePage:
        final args = settings.arguments as TicketInvoicePageArguments;

        return PageTransition(
            child: RepositoryProvider(
              create: (context) => CustomerRepository(),
              child: TicketInvoicePage(
                ticketItemList: args.list,
              ),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.bookNowPage:
        return PageTransition(
            child: const BookNowPage(), type: PageTransitionType.fade);

      case AppRoutes.slotBookingPage:
        final args = settings.arguments as SlotBookingPage;
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => SlotBookingEventRepository(),
              child: SlotBookingPage(
                couponCodepk: args.couponCodepk,
                couponCode: args.couponCode,
              ),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.slotBookingMediatorPage:
        return PageTransition(
            child: const SlotBookingMediatorPage(),
            type: PageTransitionType.fade);

      case AppRoutes.bookedSlotsPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => SlotRepository(),
              child: BookedSlotsPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.slotBookingDatePage:
        final args = settings.arguments as SlotDatePage;
        return PageTransition(
            child: SlotDatePage(
              couponCodepk: args.couponCodepk,
              couponCode: args.couponCode,
              slotDateStart: args.slotDateStart,
              slotDateEnd: args.slotDateEnd,
              sbeId: args.sbeId,
              branch: args.branch,
            ),
            type: PageTransitionType.fade);

      case AppRoutes.slotBookingTimePage:
        final args = settings.arguments as SlotTimePage;
        return PageTransition(
            child: MultiRepositoryProvider(
              providers: [
                RepositoryProvider(
                  create: (context) => SlotBookingTimeRepository(),
                ),
                RepositoryProvider(
                  create: (context) => CustomerRepository(),
                ),
              ],
              child: SlotTimePage(
                couponCodepk: args.couponCodepk,
                couponCode: args.couponCode,
                branch: args.branch,
                date: args.date,
                sbeId: args.sbeId,
              ),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.slotBookingBranchPage:
        final args = settings.arguments as SlotBookingBranchPage;
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => SlotBookingBranchRepository(),
              child: SlotBookingBranchPage(
                couponCodepk: args.couponCodepk,
                couponCode: args.couponCode,
                sbeId: args.sbeId,
                slotBookingEndDate: args.slotBookingEndDate,
                slotBookingStartDate: args.slotBookingStartDate,
              ),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.partyBookingPage:
        final args = settings.arguments as PartyBookingPage;
        return PageTransition(
            child: PartyBookingPage(
              customerId: args.customerId,
              customerPhoneNumber: args.customerPhoneNumber,
            ),
            type: PageTransitionType.fade);

      case AppRoutes.offersPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => OfferRepository(),
              child: const OffersPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.foodPage:
        return PageTransition(
            child: const FoodsPage(), type: PageTransitionType.fade);

      case AppRoutes.offerTicketInvoicePage:
        final args = settings.arguments as OfferTicketInvoicePage;
        return PageTransition(
            child: MultiRepositoryProvider(
              providers: [
                RepositoryProvider(
                  create: (context) => OfferItemRepository(),
                ),
                RepositoryProvider(
                  create: (context) => CustomerRepository(),
                ),
              ],
              child: OfferTicketInvoicePage(
                comboItemId: args.comboItemId,
                comboItemMrp: args.comboItemMrp,
                discountAmount: args.discountAmount,
                comboPk: args.comboPk,
                grandTotal: args.grandTotal,
                comboTitle: args.comboTitle,
                comboExpireDate: args.comboExpireDate,
                offerStartDate: args.offerStartDate,
              ),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.fastFoodPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => FastFoodRepository(),
              child: const FastFoodPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.drinksPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => DrinksRepository(),
              child: const DrinksPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.desertsPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => DessertRepository(),
              child: const DesertsPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.iceCreamPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => IceCreamRepository(),
              child: const IceCreamPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.parentingPage:
        return PageTransition(
            child: const ParentingPage(), type: PageTransitionType.fade);

      case AppRoutes.remedyPage:
        return PageTransition(
            child: const RemedyPage(), type: PageTransitionType.fade);

      case AppRoutes.remedyAgePage:
        return PageTransition(
            child: const RemedyAgePage(), type: PageTransitionType.fade);

      case AppRoutes.finalRemedyPage:
        return PageTransition(
            child: const FinalRemedyPage(), type: PageTransitionType.fade);

      case AppRoutes.healthyFoodPage:
        return PageTransition(
            child: const HealthyFoodPage(), type: PageTransitionType.fade);

      case AppRoutes.healthyFoodListPage:
        return PageTransition(
            child: const HealthyFoodListPage(), type: PageTransitionType.fade);

      case AppRoutes.healthyFoodTypePage:
        return PageTransition(
            child: const HealthyFoodTypePage(), type: PageTransitionType.fade);

      case AppRoutes.healthyFoodRecepiePage:
        return PageTransition(
            child: const HealthyFoodRecepiePage(),
            type: PageTransitionType.fade);

      case AppRoutes.vaccineInfoPage:
        return PageTransition(
            child: const VaccineInfoPage(), type: PageTransitionType.fade);

      case AppRoutes.childVaccineAgeListPage:
        return PageTransition(
            child: const ChildVaccineAgeListPage(),
            type: PageTransitionType.fade);

      case AppRoutes.finalChildVaccineInfoPage:
        return PageTransition(
            child: const FinalChildVaccineInfoPage(),
            type: PageTransitionType.fade);

      case AppRoutes.momVaccineAgeListPage:
        return PageTransition(
            child: const MomVaccineListPage(), type: PageTransitionType.fade);

      case AppRoutes.finalMomVaccineInfoPage:
        return PageTransition(
            child: const FinalMomVaccineInfoPage(),
            type: PageTransitionType.fade);

      case AppRoutes.classSchedulePage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => ClassRepository(),
              child: const ClassSchedulePage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.schedulePage:
        final args = settings.arguments as ClassCard;
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => ClassDetailsRepository(id: args.classId),
              child: SchedulePage(
                card: args,
              ),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.socialMediaPage:
        return PageTransition(
            child: const SocialMediaPage(), type: PageTransitionType.fade);

      case AppRoutes.showsPage:
        return PageTransition(
            child: const ShowsPage(), type: PageTransitionType.fade);

      case AppRoutes.quizPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => CustomerRepository(),
              child: QuizPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.liveQuizPage:
        final args = settings.arguments as LiveQuizPage;
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => CustomerRepository(),
              child: LiveQuizPage(
                customerName: args.customerName,
                customerPhoneNumber: args.customerPhoneNumber,
              ),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.profilePage:
        return PageTransition(
            child: MultiRepositoryProvider(
              providers: [
                RepositoryProvider(
                  create: (context) => CustomerRepository(),
                ),
                RepositoryProvider(
                  create: (context) => ChildrenRepository(),
                ),
                RepositoryProvider(
                  create: (context) => MembershipSubscriptionRepository(),
                ),
              ],
              child: ProfilePage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.locationPage:
        return PageTransition(
            child: const LocationsPage(), type: PageTransitionType.fade);

      case AppRoutes.addChildPage:
        final args = settings.arguments as AddChildPage;
        return PageTransition(
            child: AddChildPage(
              guardianId: args.guardianId,
            ),
            type: PageTransitionType.fade);

      case AppRoutes.editChildProfilePage:
        final args = settings.arguments as EditChildProfileArguments;
        return PageTransition(
            child: EditChildProfilePage(
              childName: args.childName,
              childImage: args.childImage,
              childClass: args.childClass,
              childSchool: args.childSchool,
              gender: args.gender,
              childId: args.childId,
              dob: args.dob,
            ),
            type: PageTransitionType.fade);

      case AppRoutes.editProfilePage:
        final args = settings.arguments as EditProfilePageArguments;
        return PageTransition(
            child: EditProfilePage(
              prefferedBranch: args.prefferedBranch,
              userId: args.id,
              userGender: args.gender,
              userImage: args.image,
              userEmail: args.email,
              userAddress: args.address,
              userSpouseName: args.spouseName,
              userName: args.name,
            ),
            type: PageTransitionType.fade);

      case AppRoutes.photoAlbumPage:
        return PageTransition(
            child: const PhotoAlbumPage(), type: PageTransitionType.fade);

      case AppRoutes.myCouponsPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => MyCouponRepository(),
              child: MyCouponPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.scannedCouponPage:
        final args = settings.arguments as ScannedCouponPage;
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => ScannedCouponRepository(),
              child: ScannedCouponPage(
                scannedData: args.scannedData,
              ),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.couponListPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => CouponItemRepository(),
              child: CouponListPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.customerCarePage:
        return PageTransition(
            child: const CustomerCarePage(), type: PageTransitionType.fade);

      case AppRoutes.openingHoursPage:
        return PageTransition(
            child: const OpeningHoursPage(), type: PageTransitionType.fade);

      case AppRoutes.scanCouponPage:
        return PageTransition(
            child: const ScanCouponPage(), type: PageTransitionType.fade);

      case AppRoutes.couponsPage:
        return PageTransition(
            child: const CouponsPage(), type: PageTransitionType.fade);

      case AppRoutes.guestVolumePage:
        return PageTransition(
            child: MultiRepositoryProvider(
              providers: [
                RepositoryProvider(
                  create: (context) => BranchCapacityRepository(),
                ),
                RepositoryProvider(
                  create: (context) => MirpurTrafficRepository(),
                ),
                RepositoryProvider(
                  create: (context) => BaddaTrafficRepository(),
                ),
                RepositoryProvider(
                  create: (context) => WariTrafficRepository(),
                ),
                RepositoryProvider(
                  create: (context) => UttaraTrafficRepository(),
                ),
              ],
              child: GuestVolumePage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.partyBookingHistoryPage:
        final args = settings.arguments as PartyBookingHistorypage;
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => PartyBookingRepository(),
              child: PartyBookingHistorypage(
                customerId: args.customerId,
              ),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.partyBookingMediatorPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => CustomerRepository(),
              child: PartyBookingMediatorPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.rewardPointsHistoryPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => RewardPointsHistoryRepository(),
              child: RewardPointsHistoryPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.deleteProfilePage:
        final args = settings.arguments as DeleteProfilePage;
        return PageTransition(
            child: DeleteProfilePage(
              phoneNumber: args.phoneNumber,
              customerId: args.customerId,
            ),
            type: PageTransitionType.fade);

      case AppRoutes.notificationHistoryPage:
        return PageTransition(
            child: RepositoryProvider(
              create: (context) => NotificationHistoryRepository(),
              child: const NotificationHistoryPage(),
            ),
            type: PageTransitionType.fade);

      case AppRoutes.loadingPage:
        return PageTransition(
            child: const LoadingPage(), type: PageTransitionType.fade);

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(child: Text('Invalid Route')),
                ));
    }
  }
}
