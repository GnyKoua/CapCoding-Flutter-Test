// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/foundation.dart';

// APP CONSTANTS
const APP_CODE = "CapCodingTest";
const APP_NAME = "CapCoding Flutter Test";
const BACKEND_ROOT = "https://randomuser.me";
const BACKEND_API = "$BACKEND_ROOT/api/";

// STORAGES KEYs
const STORAGE_KEY =
    kDebugMode ? "$APP_CODE-STORE" : "$APP_CODE-LOCAL_STORE_PROD";
const THEME_KEY = kDebugMode ? "ThemeMode" : "$APP_CODE-THEME_MODE_PROD";
