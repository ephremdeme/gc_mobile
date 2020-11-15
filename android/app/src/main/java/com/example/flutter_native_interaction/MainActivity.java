package com.example.flutter_native_interaction;

import android.content.Intent;
import android.net.Uri;

import androidx.annotation.NonNull;

import java.util.Map;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "arcore";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
            .setMethodCallHandler(
                (call, result) -> {
                    final Map<String, Object> arguments = call.arguments();

                    if(call.method.equals("getMessage")) {
//                        String from = (String) arguments.get("from");
//                        String message = "From native android " + from;
//                        result.success(message);
//                        openWebPage("http://google.com");
                        openActivity2();
                    } else {
                        result.notImplemented();
                    }
                }
            );
    }

    public void openActivity2() {
        Intent intent = new Intent(this, Activity2.class);
        startActivity(intent);
    }

    public void openWebPage(String url) {
        Uri webpage = Uri.parse(url);
        Intent intent = new Intent(Intent.ACTION_VIEW, webpage);
        if(intent.resolveActivity(getPackageManager()) != null) {
            startActivity(intent);
        }
    }
}
