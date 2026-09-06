/// Centralized string resources for Shoppy.
/// Organized by feature domain to guarantee zero scattered hardcoded text.
class AppStrings {
  static const common = _CommonStrings();
  static const nav = _NavStrings();
  static const auth = _AuthStrings();
  static const home = _HomeStrings();
  static const product = _ProductStrings();
  static const cart = _CartStrings();
  static const checkout = _CheckoutStrings();
  static const orders = _OrderStrings();
  static const profile = _ProfileStrings();
  static const notifications = _NotificationStrings();
  static const wishlist = _WishlistStrings();
  static const search = _SearchStrings();
  static const reviews = _ReviewStrings();
  static const admin = _AdminStrings();
  static const assistant = _AssistantStrings();
  static const errors = _ErrorStrings();
  static const validation = _ValidationStrings();
}

class _NavStrings {
  const _NavStrings();
  final String home = 'Home';
  final String explore = 'Explore';
  final String cart = 'Cart';
  final String wishlist = 'Wishlist';
  final String profile = 'Profile';
}

class _CommonStrings {
  const _CommonStrings();
  final String appName = 'Shoppy';
  final String cancel = 'Cancel';
  final String confirm = 'Confirm';
  final String save = 'Save';
  final String delete = 'Delete';
  final String edit = 'Edit';
  final String close = 'Close';
  final String retry = 'Try Again';
  final String ok = 'OK';
  final String viewAll = 'View All';
  final String seeMore = 'See More';
  final String search = 'Search';
  final String apply = 'Apply';
  final String reset = 'Reset';
  final String loading = 'Loading...';
  final String back = 'Back';
  final String done = 'Done';
}

class _AuthStrings {
  const _AuthStrings();
  final String login = 'Login';
  final String register = 'Register';
  final String createAccount = 'Create Account';
  final String email = 'Email';
  final String password = 'Password';
  final String confirmPassword = 'Confirm Password';
  final String fullName = 'Full Name';
  final String phone = 'Phone Number';
  final String forgotPassword = 'Forgot Password?';
  final String logout = 'Log Out';
  final String logoutConfirm = 'Are you sure you want to log out?';
  final String loginTitle = 'Shoppy Login';
  final String loginSubtitle = 'Sign in to access your cart, orders, and saved items';
  final String registerTitle = 'Join Shoppy Today';
  final String registerSubtitle = 'Create an account to start shopping curated collections';
  final String alreadyHaveAccount = 'Already have an account? Log in';
  final String dontHaveAccount = "Don't have an account? Register";
  final String noAccountPrompt = "Don't have an account?";
  final String enterEmail = 'Enter your email address';
  final String enterPassword = 'Enter your password';
  final String enterName = 'Enter your full name';
  final String enterConfirmPassword = 'Re-enter your password';
  final String passwordRule = 'At least 6 characters';
  final String alreadyHaveAccountPrompt = 'Already have an account?';
  final String signIn = 'Sign In';
  final String quickDemo = 'QUICK DEMO ACCOUNTS';
  final String demoCustomer = 'Customer';
  final String demoAdmin = 'Admin';
}

class _HomeStrings {
  const _HomeStrings();
  final String storeTitle = 'Shoppy Store';
  final String categories = 'Categories';
  final String featured = 'Featured Collection';
  final String recommended = 'Recommended For You';
  final String trending = 'Trending Right Now';
  final String discoverNow = 'Discover Now';
  final String shopCollection = 'Shop Collection';
  final String seasonHighlight = 'SEASON HIGHLIGHT';
  final String newArrivals = 'NEW ARRIVALS';
  final String limitedOffer = 'LIMITED OFFER';
}

class _ProductStrings {
  const _ProductStrings();
  final String addToCart = 'Add to Cart';
  final String buyNow = 'Buy Now';
  final String inStock = 'In Stock';
  final String outOfStock = 'Out of Stock';
  String onlyLeft(int count) => 'Only $count left';
  String addedToCart(String name) => 'Added $name to cart';
  final String reviews = 'Customer Reviews';
  final String description = 'Product Description';
  final String specifications = 'Specifications';
  final String verifiedSeller = 'Shoppy Verified';
  String soldBy(String seller) => 'Sold by $seller';
  final String quantity = 'Quantity';
  final String mediaPhoto = 'PHOTO';
  final String mediaVideo = 'VIDEO';
  final String media3d = '3D VIEW';
  final String dragRotate360 = 'Drag to rotate 360°';
  final String resetView = 'Reset';
  final String fullscreen = 'Fullscreen';
  final String imageUnavailable = 'Image unavailable';
  final String videoUnavailable = 'Video playback unavailable';
}

class _CartStrings {
  const _CartStrings();
  final String title = 'Shopping Cart';
  final String empty = 'Your cart is empty';
  final String emptySubtitle = 'Looks like you haven\'t added any items yet.';
  final String startShopping = 'Explore Products';
  final String clearCart = 'Clear Cart';
  final String clearCartConfirm = 'Are you sure you want to remove all items from your cart?';
  final String subtotal = 'Subtotal';
  final String tax = 'Estimated Tax (8%)';
  final String shipping = 'Shipping';
  final String shippingFree = 'FREE';
  final String discount = 'Discount';
  final String total = 'Total Amount';
  final String estimatedTotal = 'Estimated Total';
  final String orderSummary = 'Order Summary';
  final String proceedToCheckout = 'Proceed to Checkout';
  final String removeItem = 'Remove';
  final String freeShippingUnlocked = '🎉 You unlocked FREE Standard Shipping!';
  String freeShippingAddMore(double amount) =>
      'Add \$${amount.toStringAsFixed(2)} more for FREE Delivery';
}

class _CheckoutStrings {
  const _CheckoutStrings();
  final String title = 'Checkout';
  final String shippingAddress = 'Delivery Address';
  final String selectAddress = 'Select delivery address';
  final String addNewAddress = 'Add New Address';
  final String paymentMethod = 'Payment Method';
  final String cod = 'Cash on Delivery';
  final String creditCard = 'Credit / Debit Card';
  final String orderSummary = 'Order Summary';
  final String placeOrder = 'Place Order Now';
  final String confirmationTitle = 'Order Confirmed!';
  final String confirmationSubtitle = 'Your order has been placed and is being prepared.';
  final String viewOrderDetails = 'View Order Details';
  final String continueShopping = 'Continue Shopping';
}

class _OrderStrings {
  const _OrderStrings();
  final String title = 'My Orders';
  final String orderNumber = 'Order #';
  final String placedOn = 'Placed on';
  final String trackOrder = 'Track Fulfillment';
  final String cancelOrder = 'Cancel Order';
  final String cancelConfirm = 'Are you sure you want to cancel this order?';
  final String emptyOrders = 'No orders placed yet';
  final String emptyOrdersSubtitle = 'When you place orders, they will appear here with live tracking.';
  final String statusConfirmed = 'CONFIRMED';
  final String statusProcessing = 'PROCESSING';
  final String statusShipped = 'SHIPPED';
  final String statusDelivered = 'DELIVERED';
  final String statusCancelled = 'CANCELLED';
}

class _ProfileStrings {
  const _ProfileStrings();
  final String title = 'Profile & Account';
  final String editProfile = 'Edit Profile';
  final String myOrders = 'My Orders';
  final String savedAddresses = 'Saved Addresses';
  final String notifications = 'Notifications';
  final String adminDashboard = 'Admin Management Portal';
  final String support = 'Help & Support';
  final String about = 'About Shoppy';
}

class _NotificationStrings {
  const _NotificationStrings();
  final String title = 'Notifications';
  final String markAllAsRead = 'Mark all as read';
  final String empty = 'No notifications yet';
  final String emptySubtitle = 'Order status updates and promotions will appear here.';
  final String preferences = 'Notification Settings';
  final String viewOrder = 'View Order →';
  final String justNow = 'Just now';
}

class _WishlistStrings {
  const _WishlistStrings();
  final String title = 'My Wishlist';
  final String empty = 'Your wishlist is empty';
  final String emptySubtitle = 'Tap the heart icon on any product to save it for later.';
  final String moveToCart = 'Move to Cart';
  String movedToCart(String name) => '$name moved to cart!';
}

class _SearchStrings {
  const _SearchStrings();
  final String searchHint = 'Search products, brands, or describe what you need...';
  final String recentSearches = 'Recent Searches';
  final String clearHistory = 'Clear';
  final String clearAll = 'Clear All';
  final String filters = 'Filter Results';
  final String clearFilters = 'Clear Filters';
  final String sort = 'Sort By';
  final String noResults = 'No products found';
  final String noResultsSubtitle = 'Try checking for typos or searching for a broader term.';
  final String exploreCategories = 'Explore Categories';
  final String newest = 'Newest First';
  final String priceLowToHigh = 'Price: Low to High';
  final String priceHighToLow = 'Price: High to Low';
  final String highestRated = 'Highest Rated';
  String productsFound(int count) => '$count Products Found';
}

class _ReviewStrings {
  const _ReviewStrings();
  final String title = 'Ratings & Reviews';
  final String writeReview = 'Write a Review';
  final String rating = 'Your Rating';
  final String comment = 'Your Review';
  final String submitReview = 'Submit Review';
  final String verifiedBuyer = 'Verified Buyer';
  final String noReviews = 'No reviews yet. Be the first to review this product!';
}

class _AdminStrings {
  const _AdminStrings();
  final String title = 'Admin Management';
  final String metrics = 'Store Overview';
  final String totalRevenue = 'Total Revenue';
  final String totalOrders = 'Total Orders';
  final String totalUsers = 'Registered Users';
  final String lowStock = 'Low Stock Alerts';
  final String manageProducts = 'Manage Products';
  final String manageOrders = 'Manage Orders';
  final String manageUsers = 'Manage Users';
  final String manageReviews = 'Moderate Reviews';
  final String auditLogs = 'Audit Logs';
}

class _AssistantStrings {
  const _AssistantStrings();
  final String title = 'Shoppy Assistant';
  final String subtitle = 'AI Shopping Companion';
  final String greeting = 'How can I help you shop today?';
  final String tryAsking = 'Try asking:';
  final String inputPlaceholder = 'Ask for recommendations, products, or order status...';
  final String confirmAction = 'Confirm Action';
}

class _ErrorStrings {
  const _ErrorStrings();
  final String generic = 'Something went wrong. Please try again.';
  final String network = 'Unable to connect to Shoppy server. Check your connection.';
  final String notFound = '404 - Page Not Found';
  final String notFoundSubtitle = 'We could not find the requested screen or resource.';
  final String unauthorized = 'Please sign in to access this feature.';
}

class _ValidationStrings {
  const _ValidationStrings();
  final String emailRequired = 'Please enter your email';
  final String emailInvalid = 'Please enter a valid email address';
  final String passwordRequired = 'Please enter your password';
  final String passwordTooShort = 'Password must be at least 6 characters';
  final String nameRequired = 'Please enter your name';
  final String phoneRequired = 'Please enter your phone number';
  final String confirmPasswordRequired = 'Please confirm your password';
  final String passwordsDoNotMatch = 'Passwords do not match';
}
