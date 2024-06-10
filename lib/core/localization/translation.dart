import 'package:get/get.dart';

class MyTranslation extends Translations {
  int? count;
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "اختر اللغة",
          "2": "استمرار",
          "3": "منتجات موثوقة وعالمية",
          "4":
              "لدينا منتج 100 ألف ، اختر منتجك من متجر التجارة الإلكترونية الخاص بنا",
          "5": "سهل وامن للشراء",
          "6":
              " سهولة الدفع والطريقة والدفع الآمن ، يثق بها عملاؤنا من جميع أنحاء العالم",
          "7": "تتبع طلبك",
          "8":
              " تم استخدام خاصية التتبع لتتبع طلبك ، وستعرف مكان منتجك في الوقت الحالي",
          "9": "سرعة الوصول",
          "10": " تسليم موثوق وسريع نقوم بتسليم منتجك بأسرع طريقة ممكنة",
          "11": "تسجيل الدخول",
          "12": "اهلا بك",
          "13":
              "يمكنك تسجيل الدخول من خلال البريد وكلمة المرور او من خلال وسائل التواصل الاجتماعي",
          "14": "ادخل البريد الالكتروني",
          "15": "ادخل كلمة المرور",
          "16": "هل نسيت كلمة المرور",
          "17": "تسجيل الدخول",
          "18": " ليس لديك حساب ؟ ",
          "19": "انشاء حساب",
          "20": "اسم المستخدم",
          "21": "البريد الالكتروني",
          "22": "رقم الهاتف",
          "23": "كلمة المرور",
          "24": "ادخل رقم الهاتف",
          "25": "ادخل اسم المستخدم",
          "26":
              "انشاء حساب من خلال البريد وكلمة المرور او من خلال وسائل التواصل الاجتماعي",
          "27": " لديك حساب ? ",
          "28": "تسجيل الدخول",
          "29": "فحص البريد الالكتروني",
          "30": "تم انشاء الحساب بنجاح",
          "31": "الرجاء ادخال البريد لتلقي رمز التحقق",
          "32": "فحص",
          "33": "الذهاب لتسجيل الدخول",
          "34": "نجاح",
          "35": "حفظ",
          "36": "الرجاء ادخال كلمة المرور الجديدة",
          "37": "الكلمة الجديدة",
          "38": "تم اعادة تعيين كلمة المرور بنجاح",
          "39": "تهانينا",
          "40": "تم التسجيل بنجاح",
          "41": "رمز التحقق",
          "42": "التحقق من الكود",
          "43": "الرجاء إدخال رمز  التحقق الذي تم إرساله إلى بريدك الإلكتروني",
          "44": "اعادة تعيين كلمة المرور",
          "45": "الرجاء إعادة إدخال كلمة المرور الجديدة",
          "46": "عربي",
          "47": "انجليزي",
          "48": "الرئيسية",
          "49": "الأعدادات",
          "50": "الملف ",
          "51": "المفضلة",
          "52": "فيس بوك",
          "53": "جوجل",
          "54": "تنبيه",
          "55": "كلمه المرور او البريد الألكتروني غير صحيحه",
          "56": "ابحث عن منتجك",
          "57": "افضل المنتجات لك",
          "58": "خصومات تصل حتي 30%",
          "59": "أفضل منتجاتنا",
          "60": "الأقسام",
          "61": "الأعلي مبيعاَ",
          "62": "الرئيسيه",
          "63": "الأشعارات",
          "64": "العروض",
          "65": "الأعدادات",
          "66": "المنتجات",
          "67": "الذهاب إلى سلة التسوق",
          "68": "تفاصيل المنتج",
          "69": "غير متوفر في المخزون الآن",
          "70": "خصم",
          "71": "سلة التسوق الخاصة بي",
          "72": "لديك",
          "73": "عنصر في قائمتك",
          "74": "تأكيد",
          "75": "رمز الكوبون",
          "76": "السعر",
          "77": "أنت تستخدم كود الخصم",
          "78": "السعر الكلي",
          "79": "طلب",
          "80": "الدفع",
          "81": "اختر وسيلة الدفع",
          "82": "نقدي",
          "83": "بطاقة الدفع",
          "84": "اختر نوع التسليم",
          "85": "توصيل",
          "86": "تسلم",
          "87": "عنوان الشحن",
          "88": "خطأ",
          "89": "الرجاء اختيار طريقة الدفع",
          "90": "الرجاء اختيار نوع النوصيل",
          "91": "الرجاء اختيار عنوان الشحن",
          "92": "نجاح",
          "93": "تم الطلب بنجاح",
          "94": "حاول مرة أخرى في وقت لاحق",
          "95": "إشعار",
          "96": "تمت إضافة هذا المنتج إلى سلة التسوق",
          "97": "تمت إزالة هذا المنتج من سلة التسوق",
          "98": "تنبيه",
          "99": "هذا العنصر غير متوفر في المخزون الآن",
          "100": "طلبك أكبر من المتاح في المخزون",
          "101": "الإشعارات",
          "102": "طلبك في انتظار الموافقة عليه",
          "103": "لقد تم تجهيز طلبك",
          "104": "طلبك في الطريق",
          "105": "لقد تم تسليم طلبك",
          "106": "التحقق من كلمة المرور",
          "107": "رمز التحقق هذا 77438 لإكمال إنشاء ملف التعريف الخاص بك.",
          "108": "دائما قم بتحديث الصفحة",
          "109": "قفل التنبيهات",
          "110": "الوضع المظلم",
          "111": "الطلبات",
          "112": "الأرشيف",
          "113": "العنوان",
          "114": "كوبونات",
          "115": "معلومات عنا",
          "116": "اتصل بنا",
          "117": "تسجيل خروج",
          "118": "الطلبات المعلقة",
          "119": "تغيير اللغة",
          "120": "عربي",
          "121": "إنجليزي",
          "122": "الطلبات المؤرشفة",
          "123": "إضافة عنوان جديد",
          "124": "إستمر",
          "125": "أضف تفاصيل العنوان",
          "126": "الاسم",
          "127": "المدينة",
          "128": "الشارع",
          "129": "إضافة",
          "130": "تفاصيل الطلب",
          "131": "اسم العنصر",
          "132": "الكمية",
          "133": "سعر التوصيل",
          "134": "خصم الكوبون",
          "135": "تفاصيل",
          "136": "حذف",
          "137": "تتبع",
          "138": "رقم الطلب",
          "139": "نوع الطلب",
          "140": "سعر الطلب",
          "141": "سعر توصيل الطلب",
          "142": "الدفع",
          "143": "حالة الطلب",
          "144": "خصم القسيمة",
          "145": "في انتظار الموافقة",
          "146": "جاري تجهيز الطلب",
          "147": "تسلمة رجل التوصيل",
          "148": "في الطريق مع رجل التوصيل",
          "149": "مؤرشف",
          "150": "رقم الكوبون",
          "151": "اسم الكوبون",
          "152": "عدد الكوبونات",
          "153": "تقييم",
          "154": "تنبيه",
          "155": "هل تريد الخروج من التطبيق",
          "156": "لقد قمت بتعطيل الإشعارات",
          "157": "تغيير ملف تعريف الصورة الخاص بك (اختياري)",
          "158": "حفظ",
          "159": "التقييم",
          "160":
              "اضغط على نجمة لتعيين تقييمك. أضف المزيد من الوصف هنا إذا كنت تريد.",
          "161": "تقديم",
          "162": "قم بتعيين تلميح التعليق المخصص الخاص بك",
          "163": "ملغى",
          "164": "المفضلة",
          "165": "بيانات غير صالحة",
          "166": "رقم الهاتف أو البريد الإلكتروني موجود بالفعل تحقق من بياناتك",
          "167": "يرجى تشغيل خدمة الموقع",
          "168": "يرجى إعطاء إذن الموقع للتطبيق",
          "169": "لا يمكن استخدام التطبيق دون استخدام الموقع",
          "170": "رمز التحقق غير صحيح",
          "171": "إعادة إرسال رمز التحقق",
          "172": "كلمة السر غير متطابقة",
          "173": "لا تستخدم نفس كلمة المرور القديمة",
          "174": "تم التحقق من الحساب بنجاح",
        },
        "en": {
          "1": "Choose Your Language",
          "2": "Continue",
          "3": "Reliable Products & universal",
          "4":
              "We Have a 100k Product , Choose \n Your Product From  Our \n E-commerce Shop",
          "5": "Easy & Safe Paymnet",
          "6":
              "Easy Checkout & Safe Payment \n Method, Trusted By Our Customers \n From All Over The World",
          "7": "Track Your Order",
          "8":
              "Beat Tracker Has Been Used For \n Track Your Order, You'll Know Where \n Your Product is at The Moment",
          "9": "Fast Delivery",
          "10":
              "Reliable And Fast Delivery We \n Deliver Your Product the Fastest \n Way Possible",
          "11": "Login",
          "12": "Welcome Back",
          "13":
              "Sign In With Your Email And Password Or  Continue With Social Media",
          "14": "Enter Your Email",
          "15": "Enter Your Password",
          "16": "Forget Password",
          "17": "Sign In",
          "18": "Don't Have An Account ? ",
          "19": "Register",
          "20": "Username",
          "21": "Email",
          "22": "Phone",
          "23": "Password",
          "24": "Enter Your Phone",
          "25": "Enter Your Username",
          "26":
              "Sign Up With Your Email And Password OR Continue With Social Media",
          "27": " have an account ? ",
          "28": "SignIn",
          "29": "Check Email",
          "30": "Account Created Successfully",
          "31": "please Enter Your Email Address To Recive A verification code",
          "32": "check",
          "33": "Go To Login",
          "34": "Success",
          "35": "save",
          "36": "Please Enter new Password",
          "37": "New Password",
          "38": "Password has been reset successfully",
          "39": "congratulations",
          "40": "successfully registered",
          "41": "Verification Code",
          "42": "Check Code",
          "43": "Please Enter The Dight Code That Sent To   ",
          "44": "Reset Password",
          "45": "Please Re Enter new Password",
          "46": "Arabic",
          "47": "English",
          "48": "Home",
          "49": "Setting",
          "50": "Profile",
          "51": "Favorite",
          "52": "Facebook",
          "53": "Google",
          "54": "Watchout",
          "55": "Email OR Password Not Correct",
          "56": "Find Your Products",
          "57": "",
          "58": "",
          "59": "Our Best Products",
          "60": "Categories",
          "61": "Top Selling",
          "62": "Home",
          "63": "Notification",
          "64": "Offers",
          "65": "Settings",
          "66": "Products",
          "67": "Go To Cart",
          "68": "Product Details",
          "69": "Not availlable in Stock Now",
          "70": "discount",
          "71": "My Cart",
          "72": "You Have",
          "73": "Items In Your List",
          "74": "Apply",
          "75": "Coupon Code",
          "76": "Price",
          "77": "you using Coupon discoun",
          "78": "Total Price",
          "79": "Order",
          "80": "Checkout",
          "81": "Choose Payment Method",
          "82": "Cash",
          "83": "Payment Card",
          "84": "Choose Delivery Type",
          "85": "Delivery",
          "86": "Recieve",
          "87": "Shipping Address",
          "88": "Error",
          "89": "Please Choose Payment Method",
          "90": "Please Choose Delivery Type",
          "91": "Please Choose Shipping Address",
          "92": "Success",
          "93": "Order Successfully",
          "94": "try again later",
          "95": "Notification",
          "96": "This Product Was Added To Cart",
          "97": "This Product Was Removed From Cart",
          "98": "Alert",
          "99": "This Item Not available in Stock Now",
          "100": "Your order is larger than available in stock",
          "101": "Notifications",
          "102": "Your Order Waiting For Approved",
          "103": "Your Order has been Prepared",
          "104": "Your Order is On The Way ",
          "105": "Your Order Has Been Delivered",
          "106": "Verify OTP",
          "107": "this Verifycode 77438 to Complete Create your Profile.",
          "108": "Always refresh the page",
          "109": "Disable Notifications",
          "110": "Dark Mode",
          "111": "Orders",
          "112": "Archive",
          "113": "Address",
          "114": "Coupons",
          "115": "About Us",
          "116": "Contact Us",
          "117": "Logout",
          "118": "Pending Orders",
          "119": "Change Language",
          "120": "Arabic",
          "121": "English",
          "122": "Archived Orders",
          "123": "Add New Address",
          "124": "Continue",
          "125": "Add Details Address",
          "126": "Name",
          "127": "City",
          "128": "Street",
          "129": "Add",
          "130": "Order Details",
          "131": "Item name",
          "132": "Quantity",
          "133": "Delivery Price",
          "134": "Coupon Discount",
          "135": "Details",
          "136": "Delete",
          "137": "Tracking",
          "138": "Order Number",
          "139": "Order Type",
          "140": "Order Price",
          "141": "Order Price Delivery",
          "142": "Payment",
          "143": "Order Status",
          "144": "coupon Discount",
          "145": "Waiting Approval",
          "146": "Order Being Prepared",
          "147": "Picked up by Delivery Man",
          "148": "On the way by Delivery Man",
          "149": "Archived",
          "150": "Coupon Id",
          "151": "Coupon Name",
          "152": "Coupon Count",
          "153": "Rating",
          "154": "Warning",
          "155": "Do You Want Exit From App",
          "156": "You Disable Notifications",
          "157": "Change your photo profile (optional)",
          "158": "Save",
          "159": "Rating Dialog",
          "160":
              "Tap a star to set your rating. Add more description here if you want.",
          "161": "Submit.",
          "162": "Set your custom comment hint",
          "163": "Cancelled",
          "164": "Favorite",
          "165": "Invalid data",
          "166": "Phone Number OR Email Already Exist Check Your Data",
          "167": "Please turn on the location service",
          "168": "Please give location permission to the application",
          "169": "Application cannot be used without using the location",
          "170": "",
          "171": "Resend Verify Code",
          "172": "password does not match",
          "173": "Don't use the same old password",
          "174": "Account Verified Successfully",
        }
      };
}