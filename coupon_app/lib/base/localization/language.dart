import 'package:coupon_app/base/localization/language_key.dart';

class Language {
  static String orderReturn = 'order_return';
  static Map<String, String> mapEn = {
    //Dish

    LanguageKey.restaurant : "Restaurant",
    LanguageKey.coupon : "Coupons",
    LanguageKey.vendor : "Vendor",
    LanguageKey.user : "Users",
    LanguageKey.dashboard : "Dashboard",
    LanguageKey.orders: 'Orders',
    LanguageKey.profile: 'Profile',
    LanguageKey.account: "Account",
    LanguageKey.all: 'ALL',
    LanguageKey.active: 'ACTIVE',
    LanguageKey.inactive: 'INACTIVE',
    LanguageKey.addDish: 'Add Dish',
    LanguageKey.editDish: 'Edit Dish',
    LanguageKey.hasServingSize: 'Does dish have multiple serving sizes',
    LanguageKey.addServingSize: 'Add Serving Size',
    LanguageKey.dishName: 'Dish Name',
    LanguageKey.price: 'Price',
    LanguageKey.veg: 'Vegetarian',
    LanguageKey.nonVeg: 'Non-Vegetarian',
    LanguageKey.redeem: 'Redeem',
    LanguageKey.items: 'Items',

    //Restaurant
    LanguageKey.restaurantName: 'Restaurant Name',
    LanguageKey.isActive: 'Is the restaurant active',
    LanguageKey.latitude: 'Lat',
    LanguageKey.longitude: 'Long',
    LanguageKey.addRestaurant: 'Add Restaurant',
    LanguageKey.userName: 'User Name',
    LanguageKey.selectLocation: 'Select Location',
    LanguageKey.locality: 'Locality',
    LanguageKey.searchLocation: 'Search Location',
    LanguageKey.currentLocation: 'Current Location',
    LanguageKey.userPhone: 'User Phone',
    LanguageKey.editRestaurant: 'Edit Restaurant',
    LanguageKey.placeOrder: 'Place Order',
    LanguageKey.totalBill: 'Total bill',

    //End User:
    LanguageKey.deliveringTo : 'DELIVERING TO',
    LanguageKey.credentials : 'Credentials',
    LanguageKey.recipientName : 'Recipient Name',
    LanguageKey.additionalDetails : 'Additional Details(optional)',
    LanguageKey.apartmentAddressHint : 'Apartment No./House name, Street',
    LanguageKey.addAddress : 'Add Address',
    LanguageKey.confirm : 'CONFIRM',
    LanguageKey.addressTitle : 'Customer Address Name',
    LanguageKey.onGoing : 'Ongoing',
    LanguageKey.completed : 'Completed',

    //Photo Stories
    LanguageKey.photoStories: "Photo Stories",
    LanguageKey.searchForPhotos: "Search for Photos",
    LanguageKey.amazingItems: "Amazing Items",
    LanguageKey.follow: "Follow",
    LanguageKey.uploadedBy: "Uploaded By ",
    LanguageKey.topDeal: "Top Deals For You",
    LanguageKey.action: "Action",
    LanguageKey.usDollar: "%s \$US",
    LanguageKey.discountOff: "% OFF",
    LanguageKey.discover: "Discover",
    LanguageKey.catalogue: "Catalogue",
    LanguageKey.cart: "Cart",
    LanguageKey.whitelist: "Whitelist",
    LanguageKey.discountCoupons: "Discount Coupons",
    LanguageKey.offeredUp: "Offered up to 30% off for retreat with demand",

    //Home Decoration item
    LanguageKey.homeDecoration: "Home Decoration Item",
    LanguageKey.itemInStock: "Item in Stock",
    LanguageKey.selectSize: "Select Size",
    LanguageKey.small: "Small",
    LanguageKey.medium: "Medium",
    LanguageKey.big: "Big",
    LanguageKey.huge: "Huge",
    LanguageKey.replace: "Replace",
    LanguageKey.more: "More",
    LanguageKey.variants: "Variants",
    LanguageKey.selectColor: "Select Color",

    //sign up sign in
    LanguageKey.myStore: "My Store",
    LanguageKey.prototype: "Prototype shopping apps faster",
    LanguageKey.usingEmail: "USING E-MAIL",
    LanguageKey.signIn: "SIGN IN",
    LanguageKey.register: "REGISTER",

    //home
    LanguageKey.goShopping: "Go Shopping for...",
    LanguageKey.show: "SHOW",
    LanguageKey.viewAll: "VIEW ALL",

    //flower
    LanguageKey.popularGoods: 'Popular Goods',
    LanguageKey.deals: 'DEALS',
    LanguageKey.discounts: 'DISCOUNTS',
    LanguageKey.newArrivals: 'NEW ARRIVALS',
    LanguageKey.grid: 'GRID',
    LanguageKey.bestSellers: 'BEST SELLERS',

    //new arrival
    LanguageKey.newArrivalsNoCap: 'New Arrivals',
    LanguageKey.ms: 'MS',
    LanguageKey.filter: 'FILTER',
    LanguageKey.newestFirst: 'Newest First',
    LanguageKey.listenToMusic: 'listen to the music',

    //chair
    LanguageKey.help: 'HELP',


    //food
    LanguageKey.itemDesc: 'Item Description',
    LanguageKey.addToCart: 'ADD TO CART',


    //rolex
    LanguageKey.itemDetails: 'Item Details',
    LanguageKey.buyNow: 'BUY NOW',
    LanguageKey.watch: 'WATCH',

    //saved items
    LanguageKey.savedItems: 'Saved Items',
    LanguageKey.myDefault: 'My default WishList',
    LanguageKey.edit: 'EDIT',

    //edit mode
    LanguageKey.editMode: 'Edit Mode',
    LanguageKey.cancel: 'CANCEL',
    LanguageKey.moveTo: 'MOVE TO',
    LanguageKey.foodToOrder: 'Food To Order',

    LanguageKey.upcoming: 'upcoming',
    LanguageKey.finished: 'finished',

    //search flow
    LanguageKey.whatAreYou: 'What are you looking for?',
    LanguageKey.yourRecent: 'Your recent searches still empty',
    LanguageKey.mostSearched: 'Most Searched',
    LanguageKey.clear: 'CLEAR',
    LanguageKey.itemFound: '64 items found',

    //filter
    LanguageKey.filtering: 'Filtering',
    LanguageKey.category: 'Category',
    LanguageKey.narrow: 'Narrow your results',
    LanguageKey.rating: 'Rating',
    LanguageKey.andAbove: '%s and above',
    LanguageKey.colors: 'Colors',
    LanguageKey.anyColor: 'Any Color',
    LanguageKey.shipping: 'Shipping',
    LanguageKey.allDelivery: 'All Delivery Methods',
    LanguageKey.priceRange: 'Price Range',
    LanguageKey.anyPrice: 'Any Price',
    LanguageKey.fromTo: 'From %s to %s',
    LanguageKey.displayOnlyResults: 'Display Only Results',
    LanguageKey.showDiscounts: 'Show Discounts',
    LanguageKey.yourOption: 'Your Option Name',
    LanguageKey.itemConditions: 'Item Conditions',
    LanguageKey.usedVintage: 'Used, Vintage, OldSchool',
    LanguageKey.reset: 'RESET',
    LanguageKey.save: 'SAVE',

    //color
    LanguageKey.apply: 'APPLY',
    LanguageKey.hide: 'HIDE',

    //price range
    LanguageKey.itemsFound: 'Items Found',
    LanguageKey.minPrice: 'Min. Price',
    LanguageKey.maxPrice: 'Max. Price',
    LanguageKey.raised: 'RAISED',

    //rating
    LanguageKey.from: 'From',
    LanguageKey.pts: '%s pts.',

    //six
    LanguageKey.todayTop: 'TODAY\’S TOP',

    //pick the tour
    LanguageKey.pickTheTour: 'Pick The Tour',
    LanguageKey.placeToVisit: 'PLACES TO VISIT',

    //fruits
    LanguageKey.fruits: 'FRUITS',
    LanguageKey.vegetables: 'VEGETABLES',
    LanguageKey.moreFruits: 'MORE FRUITS',
    LanguageKey.juicesJuices: 'JUICES JUICES',

    //profile one
    LanguageKey.forYou: 'FOR YOU',
    LanguageKey.address: 'ADDRESS',

    //profile two

    LanguageKey.purchases: 'Purchases',
    LanguageKey.orderHistory: 'ORDER HISTORY',

    //profile four
    LanguageKey.noOrders:
        'No orders history tracked\nIt’s high time to buy something',
    LanguageKey.goShoppingNow: 'GO SHOPPING!',

    //profile five
    LanguageKey.ordersCap: 'ORDERS',
    LanguageKey.profileLow: 'Profile',

    //profile six
    LanguageKey.accountInformation: 'Account Information',
    LanguageKey.languageKeyboard: 'Languages And Keyboard',
    LanguageKey.purchaseHistory: 'Purchases History',
    LanguageKey.yourBalance: 'Your Balance & Financial',

    //profile seven
    LanguageKey.contactInformation: 'Contact Information',
    LanguageKey.captionContact: 'Caption For Contact Information',
    LanguageKey.notificationSetting: 'Notification Settings',
    LanguageKey.captionNotification: 'Caption For Notification Settings',
    LanguageKey.parametersCaption: 'Parameters Caption',
    LanguageKey.yourBalances: 'Your Balance',
    LanguageKey.captionYourBalances: 'Your Balance and Caption',
    LanguageKey.oneMoreItem: 'One More Item',
    LanguageKey.putYourCaptionHere: 'Put Your Caption Here',

    //profile eight
    LanguageKey.homeAddress: 'Home Address',
    LanguageKey.personalInformation: 'Personal Information',
    LanguageKey.firstName: 'First Name',
    LanguageKey.lastName: 'Last Name',
    LanguageKey.defaultName: 'Default Name',
    LanguageKey.zip: 'Zip',
    LanguageKey.city: 'City',
    LanguageKey.state: 'State',
    LanguageKey.financialInformation: 'Financial Information',
    LanguageKey.yourCategory: 'Your Category',
    LanguageKey.saveChanges: 'Save Changes',

    //profile nine
    LanguageKey.categoryOption: 'Category Caption',
    LanguageKey.password: 'Password',
    LanguageKey.yourBilling:
        'Your Billing Address is the same as shipping.\nThis could be managed somewhere',
    LanguageKey.shippingAddress: 'Shipping Address',
    LanguageKey.billingAddress: 'Billing Address',
    LanguageKey.add: 'ADD',

    //profile ten
    LanguageKey.myAccount: 'My Account',
    LanguageKey.orderReturn: 'Orders & Returns',
    LanguageKey.addressBook: 'Address Book',
    LanguageKey.myLocation: 'My Location',
    LanguageKey.unitedState: 'United States (USD)',
    LanguageKey.myShopping: 'My shopping Preference',
    LanguageKey.women: 'Women',
    LanguageKey.men: 'Men',
    LanguageKey.mySetting: 'My Settings',
    LanguageKey.pushNotification: 'Push Notifications',
    LanguageKey.detailPassword: 'Details & Password',

    //Activity one
    LanguageKey.activity: 'Activity',
    LanguageKey.following: 'FOLLOWING',
    LanguageKey.you: 'YOU',

    //activity two
    LanguageKey.thingHappen: 'things happened',
    LanguageKey.discoverCap: 'DISCOVER',
    LanguageKey.home: 'Home',
    LanguageKey.activityCap: 'ACTIVITY',
    LanguageKey.notifications: 'Notifications',

    //discover 416
    LanguageKey.topPicks: 'Top picks for you',
    LanguageKey.recommend: 'Recommended To Read',
    LanguageKey.trendy: 'TRENDY',
    LanguageKey.popular: 'POPULAR',
    LanguageKey.browse: 'Browse',

    //discover 417
    LanguageKey.yourTop: 'Yours Top Picks',
    LanguageKey.suggestion: 'Suggestions',

    //social one
    LanguageKey.like: 'Like',
    LanguageKey.comment: 'Comment',
    LanguageKey.share: 'Share',
    LanguageKey.searchMoreCard: 'Search More Cards',
    LanguageKey.facebookCard: 'Facebook Cards',
    LanguageKey.social: 'Social',
    LanguageKey.tasks: 'Tasks',
    LanguageKey.travel: 'Travel',

    //social two
    LanguageKey.mansoryCard: 'Masonry Cards',

    //social three
    LanguageKey.twitterCard: 'Twitter Cards',

    //social five
    LanguageKey.completedProject: 'Completed Projects',
    LanguageKey.addCard: 'ADD A CARD...',
    LanguageKey.currentProject: 'Current Projects',
    LanguageKey.trelloCard: 'Trello Cards',

    //social six
    LanguageKey.trelloVariant: 'Trello Variant',
    LanguageKey.priorities: 'Priorities',

    //social seven
    LanguageKey.trelloMasonry: 'Trello Masonry',
    LanguageKey.finishedProject: 'Finished Projects',
    LanguageKey.searchTask: 'Search For Tasks...',

    //social eight
    LanguageKey.experiences: 'Experiences',
    LanguageKey.scrollsHorizontally: 'Scrolls Horizontally',
    LanguageKey.airbnbCard: 'Airbnb Cards',

    //social nine
    LanguageKey.bodyCards: 'Body Cards',
    LanguageKey.scrollableHorizontally: 'SCROLLABLE HORIZONTALLY',
    LanguageKey.fullWidthCards: 'FULL WIDTH CARDS',
    LanguageKey.masonryGrid: 'MASONRY GRID',
    LanguageKey.cards: 'Cards',

    //cart one
    LanguageKey.yourDontHave: 'You don’t have any items in your Cart',
    LanguageKey.shopping: 'Shopping',
    LanguageKey.shoppingCart: 'Shopping Cart',

    //cart two
    LanguageKey.itemInCart: 'ITEMS IN CART',
    LanguageKey.savedItemsCap: 'SAVED ITEMS',

    //cart three
    LanguageKey.yourCart: 'Your Cart',
    LanguageKey.size: 'Size',
    LanguageKey.color: 'Color',
    LanguageKey.quantity: 'Quantity',
    LanguageKey.getPromo: 'Got a promo code?',
    LanguageKey.orderTotal: 'Order Total',
    LanguageKey.deliveryTaxes: 'Delivery and other taxes included',
    LanguageKey.applePay: 'APPLE PAY',
    LanguageKey.checkout: 'CHECKOUT',

    //cart four
    LanguageKey.startingSubtotal: 'Starting Subtotal',
    LanguageKey.subtotal: 'Subtotal',
    LanguageKey.shippingFee: 'Shipping Fee',
    LanguageKey.estimatedTax: 'Estimated Tax',
    LanguageKey.orderTotalCap: 'ORDER TOTAL',
    LanguageKey.proceedCheckout: 'Proceed To Checkout',
    LanguageKey.usDollarCap: 'US\$',

    //cart five
    LanguageKey.usDollarAround: '\$US',
    LanguageKey.saveForLater: 'SAVE FOR LATER',
    LanguageKey.deliveryIncluded: 'Delivery Included',

    //cart six
    LanguageKey.buyLater: 'BUY LATER',
    LanguageKey.bonAppetit: 'Bon Appetit!',

    //cart seven
    LanguageKey.thanksPurchase: 'Thanks For Purchase',
    LanguageKey.amount: 'Amount',

    //checkout one
    LanguageKey.payment: 'Payment',
    LanguageKey.review: 'Review',
    LanguageKey.addressInput: 'Address Input',
    LanguageKey.financialInfo: 'Financial Info',
    LanguageKey.checkTheOrder: 'Check The Order',
    LanguageKey.whereShip: 'Where should we ship?',
    LanguageKey.addressLineOne: 'Address Line 1',
    LanguageKey.addressLineTwo: 'Address Line 2 (optional)',
    LanguageKey.createAccount: 'Create an Account to continue',
    LanguageKey.signInFacebook: 'SIGN IN WITH FACEBOOK',
    LanguageKey.authorizeViaTwitter: 'AUTHORIZE VIA TWITTER',
    LanguageKey.jumpInGoogle: 'JUMP IN WITH GOOGLE+',
    LanguageKey.signUpEmail: 'SIGN UP WITH E-MAIL',
    LanguageKey.registerAgree: 'By registering you are agree to our ',
    LanguageKey.termService: 'Terms of Service',
    LanguageKey.and: ' and ',
    LanguageKey.privacyPolicy: 'Privacy Policy',
    LanguageKey.continues: 'Continue',
    LanguageKey.checkoutLow: 'Checkout',

    //checkout two
    LanguageKey.yourPaymentInfo: 'Your Payment Information',
    LanguageKey.ccNo: 'Credit Card Number',
    LanguageKey.expiration: 'Expiration',
    LanguageKey.cvcCode: 'CVC Code',
    LanguageKey.billingAddressSameShipping: 'Billing Address same as Shipping',
    LanguageKey.whatBillingAddress: 'What’s your Billing Address?',
    LanguageKey.submit: 'SUBMIT',

    //checkout three
    LanguageKey.orderReview: 'Order Review',
    LanguageKey.selectedPayment: 'Selected Payment Method',
    LanguageKey.yourDelivery: 'Your Delivery Method',
    LanguageKey.yourPurchase: 'You’re about to Purchase',
    LanguageKey.creditCard: 'CREDIT CARD',
    LanguageKey.selectedDelivery: 'Select Delivery',

    //checkout five
    LanguageKey.nextPayment: 'Next step is Payment',
    LanguageKey.emailAddress: 'E-mail Address',
    LanguageKey.or: 'or',
    LanguageKey.withTwitter: 'WITH TWITTER',
    LanguageKey.withGoogle: 'WITH GOOGLE',

    //checkout six
    LanguageKey.creditCardNumber: 'Credit Card Number',
    LanguageKey.expires: 'Expires',
    LanguageKey.reviewYourOrder: 'Review Your Order',

    //checkout seven
    LanguageKey.youArePurchased: 'You are purchasing this items',
    LanguageKey.confirmOrder: 'Confirm Your Order',

    //checkout eight
    LanguageKey.orderSuccessful: 'Order Successful!',
    LanguageKey.thankYouOrder:
        'Thanks for your order!\nTo be Delivered within 24 hours',
    LanguageKey.checkOffer: 'Check These Offers Also',

    //content screen
    LanguageKey.welcomeTitle: 'Welcome To The App',
    LanguageKey.posts: 'POSTS',
    LanguageKey.articles: 'ARTICLES',
    LanguageKey.stories: 'STORIES',
    LanguageKey.actionSpace: 'A C T I O N',
    LanguageKey.relatedAlbums: 'Related Albums',
    LanguageKey.takeSeat: 'Take Your Seat',
    LanguageKey.watchTrailer: 'Watch The Trailer',
    LanguageKey.survivalCourses: 'Survival Courses',
    LanguageKey.overview: 'OVERVIEW',
    LanguageKey.lessons: 'LESSONS',
    LanguageKey.enhanceSkills: 'Enhance Your Skills',
    LanguageKey.how: 'HOW?',
    LanguageKey.materialDesign:
        'Material Design provides responsive layouts based on the following column structures. Layouts using 4-column, 8-column, and 12-column grids.',
    LanguageKey.whatWillYouGet: 'What will you get',
    LanguageKey.videoLessons: '20 Video Lessons',
    LanguageKey.freeUpdates: 'Free updates for members',
    LanguageKey.secretTechniques: '7 Secret Techniques',
    LanguageKey.beatStreet: 'How to beat the street',
    LanguageKey.moneyback: 'MoneyBack guaranteed!',
    LanguageKey.trustedBank: 'Trusted Bank of Nikolay',

    //discover 419
    LanguageKey.popularNow: 'Popular Now',
    LanguageKey.onRise: 'On the Rise',
    LanguageKey.popularArticle: 'POPULAR ARTICLES',
    LanguageKey.searchRightHere: 'Search right here...',
    LanguageKey.forYouLower: 'For You',

    //discover 420
    LanguageKey.bestYou: 'What’s best for you?',
    LanguageKey.narrowInterest:
        'Please narrow your interests so we can specify the best suggestions for you',

    //discover 421
    LanguageKey.interest: 'Got the interest in?',

    //discover 418
    LanguageKey.trendingTopics: 'Trending Topics',

    //calendar
    LanguageKey.reminder: 'Reminder',
    LanguageKey.planner: 'Planner',

    //map
    LanguageKey.bikers: 'Bikers on Map',
    LanguageKey.contactDrivers: 'Contacting Drivers...',
    LanguageKey.cancelRide: 'Cancel Ride',
    LanguageKey.to: 'to',
    LanguageKey.yourLocation: 'Your Location',
    LanguageKey.car: 'CAR',
    LanguageKey.train: 'TRAIN',
    LanguageKey.walk: 'WALK',
    LanguageKey.departAt: 'Depart at %s',
    LanguageKey.options: 'OPTIONS',
    LanguageKey.recommendedRoute: 'Recommended Route',
    LanguageKey.every: 'Every %s min',
    LanguageKey.fromST: 'from %s st',
    LanguageKey.min: '%s min',
    LanguageKey.moreSubway: 'More by Subway',
    LanguageKey.otherOptions: 'Other Options',
    LanguageKey.tomorrow: 'TOMORROW · %s',
    LanguageKey.peopleVisited: '%s People Visited',
  };
}
