import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';

//---------------  project colors  ---------------//

const backgroundColor = Color(0xffe0eef4); // цвет фона

const greyBlue45Color = Color(0xff3f5073); // основной цвет текста
const overlayColor = Color(0xffe3e6ff); // цвет при наведении и выделении
const dangerColor = Color(0xffe62e2e);
const warningColor = Color(0xFFFFBF00);
const orangeColor = Color(0xffff6633);
const blueColor = Color(0xff3361ff);
const darkBlueColor = Color(0xff0039ff);
const darkBlueColor50 = Color.fromARGB(69, 51, 99, 255);
const whiteColor = Color(0xFFFFFFFF);
const greenColor = Color(0xff29cc39);
const greenColor2 = Color.fromRGBO(93, 96, 245, 1);
const blackColor = Color.fromARGB(255, 0, 0, 0);
const kBack10 = Color.fromARGB(28, 0, 0, 0);
const kBack16 = Color.fromARGB(43, 0, 0, 0);
const greyBlue50Color = Color(0xff7c8aa6);
const greyBlueColor60 = Color(0xff6b7a99);
const greyBlueColor65 = Color(0xff7d8fb3);
const greyBlueColor75 = Color(0xff99a6bf);
const greyBlueColor93 = Color(0xffe1e5ed);
const greyBlueColor96 = Color(0xfff2f3f5);
const tiffanyColor = Color(0xff2ee6ca);
const purpleColor = Color(0xffa666ff);
const darkPurpleColor = Color(0xff6a00ff);
const transparent = Colors.transparent;
const hoverColors = Color.fromARGB(30, 102, 183, 241);
const hoverColors2 = Color(0xffc7ecfc);
const Color tealBlue = Color(0xffe0eef4);
// ----------- для тестов ------//
// const testColor1 = Color.fromARGB(255, 233, 9, 214);
// const testColor3 = Color.fromARGB(255, 56, 226, 4);
// const testColor2 = Color(0xffe62e2e);
// const testColor4 = Color.fromARGB(255, 150, 125, 219);
// основная светлая схема
final mainTheme = ThemeData(
  useMaterial3: true,

  // цвета темы
  colorScheme: const ColorScheme(
      primary: blueColor,
      onPrimary: darkBlueColor,
      brightness: Brightness.light,
      secondary: greyBlue45Color,
      onSecondary: greyBlueColor60,
      error: dangerColor,
      onError: dangerColor,
      background: backgroundColor,
      onBackground: greyBlue45Color,
      surface: whiteColor,
      onSurface: greyBlue45Color),

  //---------------  default colors style ---------------//
  primaryColor: blueColor,
  primaryColorDark: darkBlueColor,
  primaryColorLight: backgroundColor, //const greyBlue45Color,

  dialogBackgroundColor: whiteColor,
  disabledColor: greyBlueColor93,
  hintColor: greyBlueColor60,
  splashColor: const Color.fromARGB(6, 51, 99, 255), // цвет при нажатии
  dividerColor: greenColor,
  focusColor: blueColor,
  scaffoldBackgroundColor: backgroundColor,
  hoverColor:
      const Color.fromARGB(6, 51, 99, 255), // цвет при наведении на элементы
  shadowColor: const Color.fromARGB(136, 172, 172, 172),
  secondaryHeaderColor: purpleColor,
  unselectedWidgetColor: greenColor,

  //---------------  default Font style ---------------//
  fontFamily: 'SFProDisplay',

  //---------------  appBar style ---------------//
  appBarTheme: const AppBarTheme(
    backgroundColor: backgroundColor,
    surfaceTintColor: transparent,
    toolbarHeight: 60,
  ),
  // icons base theme
  primaryIconTheme: const IconThemeData(
    color: greyBlue45Color,
  ),

  drawerTheme: const DrawerThemeData(
    backgroundColor: whiteColor,
    surfaceTintColor: whiteColor,
  ),

// --- Navigation rail style  --- //

  navigationRailTheme: const NavigationRailThemeData(
    backgroundColor: backgroundColor, // backgroundColor
    labelType: NavigationRailLabelType.all,
    minWidth: 100.0,
    useIndicator: true,
    indicatorColor: Colors.white,
    unselectedLabelTextStyle: TextStyle(color: greyBlue45Color, fontSize: 10),
    selectedLabelTextStyle: TextStyle(
      color: greyBlue45Color,
      fontSize: 10,
    ),
    selectedIconTheme: IconThemeData(
      color: greyBlue45Color,
    ),
  ),

// ------------------- Table Style -----------------------------//
  dataTableTheme: const DataTableThemeData(),

// ------------------ SearchBar Style  ----------------------- //

  searchBarTheme: const SearchBarThemeData(
    hintStyle: MaterialStatePropertyAll(
      TextStyle(
        fontFamily: 'SFProDisplay',
        fontSize: 12,
        color: greyBlueColor60,
        fontWeight: FontWeight.w400,
      ),
    ),
    textStyle: MaterialStatePropertyAll(
      TextStyle(
        fontFamily: 'SFProDisplay',
        fontSize: 12,
        color: greyBlue45Color,
      ),
    ),
    surfaceTintColor: MaterialStatePropertyAll<Color>(whiteColor),
    overlayColor: MaterialStatePropertyAll<Color>(whiteColor),
    backgroundColor: MaterialStatePropertyAll<Color>(whiteColor),
    shadowColor: MaterialStatePropertyAll<Color>(transparent),
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)))),
    padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(
      horizontal: 10.0,
    )),
  ),

  //---------------  divider style ---------------//
  dividerTheme: const DividerThemeData(
    thickness: 1,
    color: greyBlueColor96,
  ),

  listTileTheme: const ListTileThemeData(
    iconColor: greyBlue45Color,
    textColor: greyBlue45Color,
    selectedColor: darkBlueColor,
    selectedTileColor: transparent,
    titleTextStyle: TextStyle(
      fontFamily: 'SFProDisplay',
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
  ),

  //---------------   expansionTile style ---------------//

  expansionTileTheme: const ExpansionTileThemeData(
    backgroundColor: transparent,
    textColor: greyBlue45Color,
    collapsedTextColor: greyBlue45Color,
    iconColor: darkBlueColor,
    collapsedIconColor: darkBlueColor,
    tilePadding: EdgeInsets.all(0),
    shape: Border(
      bottom: BorderSide.none,
      top: BorderSide.none,
      left: BorderSide.none,
      right: BorderSide.none,
    ),
    collapsedShape: Border(
      bottom: BorderSide.none,
      top: BorderSide.none,
      left: BorderSide.none,
      right: BorderSide.none,
    ),
  ),

  //---------------   dropdownMenuTheme style ---------------//

  dropdownMenuTheme: const DropdownMenuThemeData(
    textStyle: TextStyle(
      fontSize: 14,
      color: greyBlue45Color,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: greyBlue45Color,
        fontSize: 10,
      ),
      labelStyle: TextStyle(
        color: greyBlue45Color,
        fontSize: 14,
      ),
      counterStyle: TextStyle(
        color: greyBlue45Color,
      ),
    ),
    menuStyle:
        MenuStyle(backgroundColor: MaterialStatePropertyAll<Color>(whiteColor)),
  ),

  //---------------   popup styles ---------------//

  popupMenuTheme: const PopupMenuThemeData(
    color: whiteColor,
    textStyle: TextStyle(
      color: greyBlue45Color,
      fontSize: 10,
    ),
  ),

// ------------ inputs styles --------------//

  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(
      color: greyBlue45Color,
    ),
    suffixIconColor: greyBlue45Color,
    labelStyle: TextStyle(
      fontFamily: 'SFProDisplay',
      fontSize: 14,
      color: greyBlue45Color,
    ),
    floatingLabelStyle: TextStyle(
      fontFamily: 'SFProDisplay',
      fontSize: 14,
      color: greyBlue45Color,
    ),
    helperStyle: TextStyle(color: greyBlue45Color),
    fillColor: whiteColor,
    filled: false,
    isDense: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: greyBlueColor75,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: greyBlueColor96),
    ),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: greyBlueColor75)),
  ),

  //--------------- Text styles ---------------//

  textTheme: const TextTheme(
    // -------------  h1  -------------
    displayLarge: TextStyle(
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: greyBlue45Color,
      letterSpacing: 0,
    ),

    //-------------  h2  -------------
    displayMedium: TextStyle(
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: greyBlue45Color,
      letterSpacing: 0,
    ),

    //-------------  h3  -------------
    displaySmall: TextStyle(
      fontFamily: 'SFProDisplay',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: greyBlue45Color,
      letterSpacing: 0,
    ),

    // -------------  h4  -------------

    headlineLarge: TextStyle(
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: greyBlue45Color,
      letterSpacing: 0,
    ),

    //-------------  h5  -------------
    headlineMedium: TextStyle(
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 16,
      color: greyBlue45Color,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),

    //-------------  h6  ------------- // AlertDialog title

    headlineSmall: TextStyle(
        fontFamily: 'SFProDisplay',
        fontSize: 16,
        color: greyBlue45Color,
        fontWeight: FontWeight.w600),

    //-------------  Title  large -------------
    titleLarge: TextStyle(
      fontFamily: 'SFProDisplay',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: greyBlue45Color,
    ),

    //-------------  Title  medium -------------
    titleMedium: TextStyle(
      fontFamily: 'SFProDisplay',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: greyBlue45Color,
    ),

    //-------------  Title  small ------------- кнопки в списке

    titleSmall: TextStyle(
      fontFamily: 'SFProDisplay',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: greyBlue45Color,
    ),

    //-------------  body p -------------

    // основной текст
    bodyLarge: TextStyle(
      fontFamily: 'SFProDisplay',
      fontSize: 16,
      color: greyBlue45Color,
      fontWeight: FontWeight.w400,
    ), // body upercase

    bodyMedium: TextStyle(
      fontFamily: 'SFProDisplay',
      fontSize: 14, // normal 16
      color: greyBlue45Color,

      fontWeight: FontWeight.w400,
    ),

    bodySmall: TextStyle(
      fontFamily: 'SFProDisplay',
      fontSize: 14,
      color: greyBlue45Color,
      fontWeight: FontWeight.w400,
    ),

// Текст в поле
    labelLarge: TextStyle(
      fontFamily: 'SFProDisplay',
      fontSize: 14,
      color: greyBlueColor60,
    ),

    labelMedium: TextStyle(
      fontFamily: 'SFProDisplay',
      fontSize: 12,
      color: greyBlueColor60,
    ), // label

    labelSmall: TextStyle(
      fontFamily: 'SFProDisplay',
      fontSize: 10,
      color: greyBlueColor60,
    ), // label small
  ),

  //-------------   datePicker style ----------//

  datePickerTheme: const DatePickerThemeData(
    elevation: 9999,
    todayBorder: BorderSide(width: 1, color: blueColor),
    backgroundColor: whiteColor,
    confirmButtonStyle: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(blueColor),
      foregroundColor: MaterialStatePropertyAll<Color>(greyBlueColor93),
    ),
    cancelButtonStyle: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll<Color>(greyBlueColor60),
      backgroundColor: MaterialStatePropertyAll<Color>(greyBlueColor93),
    ),
  ),

  //--------------- default Buttons style ---------------//
  segmentedButtonTheme: const SegmentedButtonThemeData(
    selectedIcon: null,
  ),

  buttonTheme: const ButtonThemeData(
    hoverColor: whiteColor,
    padding: EdgeInsets.all(5),
    height: 20,
    alignedDropdown: true,
  ),

  // elevatedButton style
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      backgroundColor: blueColor,
      foregroundColor: whiteColor,
    ),
  ),

  // iconButton style
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
      backgroundColor: MaterialStatePropertyAll<Color>(whiteColor),
      shadowColor: MaterialStatePropertyAll(blackColor),
      iconColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
      iconSize: MaterialStatePropertyAll(16),
    ),
  ),

  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
      backgroundColor: MaterialStatePropertyAll<Color>(whiteColor),
      shadowColor: MaterialStatePropertyAll(blackColor),
      overlayColor: MaterialStatePropertyAll(blackColor),
      iconColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
      iconSize: MaterialStatePropertyAll(16),
    ),
  ),

  // outlinedButton style
  outlinedButtonTheme: const OutlinedButtonThemeData(
    style: ButtonStyle(
      side: MaterialStatePropertyAll(
        BorderSide(color: blueColor, width: 2.0),
      ),
    ),
  ),

  extensions: const <ThemeExtension<dynamic>>[
    // dropdown select text style
    // DropDownTextTheme(
    //     dropDownText: TextStyle(
    //   fontFamily: 'SFProDisplay',
    //   fontSize: 14,
    //   color: greyBlue45Color,
    // )),

    //------------- Custom Buttons style ----------//
    ButtonsTheme(
// простая синяя кнопка
      prymaryButton: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(blueColor),
        foregroundColor: MaterialStatePropertyAll<Color>(whiteColor),
        overlayColor: MaterialStatePropertyAll(darkBlueColor),
      ),

// вторичная кнопка
      secondaryButton: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(greyBlueColor93),
        foregroundColor: MaterialStatePropertyAll<Color>(greyBlueColor60),
        overlayColor: MaterialStatePropertyAll(overlayColor),
      ),
// кнопка удалить
      dangerButton: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(transparent),
        foregroundColor: MaterialStatePropertyAll<Color>(dangerColor),
      ),
// маленькая текстовя кнопка --  отвзяать ответить
      smallTextButton: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(transparent),
          foregroundColor: MaterialStatePropertyAll<Color>(blueColor),
          textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 10))),

      menuButton: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(transparent),
        surfaceTintColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
        foregroundColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
        overlayColor: MaterialStatePropertyAll<Color?>(hoverColors),
        textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 16)),
        maximumSize:
            MaterialStatePropertyAll<Size>(Size(double.infinity, 50.0)),
        minimumSize:
            MaterialStatePropertyAll<Size>(Size(double.infinity, 50.0)),
        padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0)),
      ),

// кнопки добавить
      iconButtonAdd: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        // backgroundColor: MaterialStatePropertyAll<Color>(blueColor),
        foregroundColor: MaterialStatePropertyAll<Color>(whiteColor),
        iconColor: MaterialStatePropertyAll<Color>(whiteColor),
        iconSize: MaterialStatePropertyAll(16),
        maximumSize: MaterialStatePropertyAll<Size>(Size(50, 50)),
        minimumSize: MaterialStatePropertyAll<Size>(Size(50, 50)),
        overlayColor: MaterialStatePropertyAll(hoverColors),
      ),

// кнопки очистить в списке
      iconButtonClear: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(transparent),
          iconColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
          iconSize: MaterialStatePropertyAll(16),
          textStyle:
              MaterialStatePropertyAll(TextStyle(color: greyBlue45Color))),

// кнопки удалить
      iconButtonDelete: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        backgroundColor: MaterialStatePropertyAll<Color>(transparent),
        foregroundColor: MaterialStatePropertyAll<Color>(dangerColor),
        iconColor: MaterialStatePropertyAll<Color>(dangerColor),
        iconSize: MaterialStatePropertyAll(18),
      ),

// стиль кнопки редактировать
      iconButtonEdit: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        backgroundColor: MaterialStatePropertyAll<Color>(transparent),
        foregroundColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
        iconColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
        iconSize: MaterialStatePropertyAll(18),
      ),

// кнопки фильров
      filterButton: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(whiteColor),
        foregroundColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
        iconColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
        overlayColor: MaterialStatePropertyAll(overlayColor),
        iconSize: MaterialStatePropertyAll(16),
      ),

// стиль маленьких кнопок редактировать и добавить в избранное
      iconButtonSmall: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        backgroundColor: MaterialStatePropertyAll<Color>(transparent),
        foregroundColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
        iconColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
        minimumSize: MaterialStatePropertyAll<Size>(Size(26, 26)),
        maximumSize: MaterialStatePropertyAll<Size>(Size(26, 26)),
        overlayColor: MaterialStatePropertyAll(overlayColor),
        iconSize: MaterialStatePropertyAll(16),
      ),

// кнопка выхода
      iconButtonExit: ButtonStyle(
        overlayColor: MaterialStatePropertyAll(overlayColor),
        iconSize: MaterialStatePropertyAll(20),
      ),

// кнопка выбора даты
      choiceButtonDate: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
          backgroundColor: MaterialStatePropertyAll<Color>(whiteColor)),

// кнопка вперед назад
      iconButtonMedium: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        backgroundColor: MaterialStatePropertyAll<Color>(whiteColor),
        foregroundColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
        iconColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
        minimumSize: MaterialStatePropertyAll<Size>(Size(32, 32)),
        maximumSize: MaterialStatePropertyAll<Size>(Size(32, 32)),
        overlayColor: MaterialStatePropertyAll(overlayColor),
        iconSize: MaterialStatePropertyAll(16),
      ),

// кнопка меню
      iconButtonMenu: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        backgroundColor: MaterialStatePropertyAll<Color>(whiteColor),
        foregroundColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
        iconColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
        minimumSize: MaterialStatePropertyAll<Size>(Size(40, 40)),
        maximumSize: MaterialStatePropertyAll<Size>(Size(40, 40)),
        overlayColor: MaterialStatePropertyAll(overlayColor),
        iconSize: MaterialStatePropertyAll(25),
      ),
      iconButtonExclued: null,

// кнопка cсылки
      linkTextButton: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        backgroundColor: MaterialStatePropertyAll<Color>(transparent),
        foregroundColor: MaterialStatePropertyAll<Color>(greyBlue45Color),
        textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 16)),
        overlayColor: MaterialStatePropertyAll(transparent),
      ),
    ),
  ],

  // colorScheme:
  //     ColorScheme.fromSeed(seedColor: blueColor).copyWith(error: dangerColor),
);

// темная тема
final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
        primary: blueColor,
        onPrimary: darkBlueColor,
        brightness: Brightness.light,
        secondary: greyBlue45Color,
        onSecondary: greyBlueColor60,
        error: dangerColor,
        onError: dangerColor,
        background: Colors.red,
        onBackground: greyBlue45Color,
        surface: whiteColor,
        onSurface: greyBlue45Color));
