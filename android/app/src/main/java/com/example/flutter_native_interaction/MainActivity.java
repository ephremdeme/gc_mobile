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
//    public static
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
            .setMethodCallHandler(
                (call, result) -> {
                    final Map<String, Object> arguments = call.arguments();

                    if(call.method.equals("getMessage")) {
                        String modelUrl = (String) arguments.get("modelUrl");
                        result.success(modelUrl);

                        openActivity2(modelUrl);
                    } else {
                        result.notImplemented();
                    }
                }
            );
    }

    public void openActivity2(String modelUrl) {
        Intent intent = new Intent(this, Activity2.class);
        intent.putExtra("modelUrl", modelUrl);
        startActivity(intent);
    }
}
