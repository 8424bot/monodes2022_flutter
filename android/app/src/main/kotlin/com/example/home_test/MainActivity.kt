package com.example.home_test

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
}

import android.os.Bundle
import io.flutter.app.FlutterActivity
// 追加
import io.flutter.plugins.urllauncher.UrlLauncherPlugin

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
	// 追加
	UrlLauncherPlugin.registerWith(registrarFor("io.flutter.plugins.urllauncher.UrlLauncherPlugin"))
    }
}