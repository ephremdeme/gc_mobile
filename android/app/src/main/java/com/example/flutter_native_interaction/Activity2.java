package com.example.flutter_native_interaction;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.view.MotionEvent;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnSuccessListener;
import com.google.ar.core.Anchor;
import com.google.ar.core.HitResult;
import com.google.ar.core.Plane;
import com.google.ar.sceneform.AnchorNode;
import com.google.ar.sceneform.rendering.ModelRenderable;
import com.google.ar.sceneform.assets.RenderableSource;
import com.google.ar.sceneform.ux.ArFragment;
import com.google.ar.sceneform.ux.BaseArFragment;
import com.google.ar.sceneform.ux.TransformableNode;
import com.google.firebase.FirebaseApp;
import com.google.firebase.storage.FileDownloadTask;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;


public class Activity2 extends AppCompatActivity {

    String modelUrl;

    private ArFragment arFragment;
//    private String assetModel = "https://poly.googleusercontent.com/downloads/c/fp/1602302627357152/0BnDT3T1wTE/85QOHCZOvov/Mesh_Beagle.gltf";
//    private String assetModel = "https://www.mediafire.com/file/ht0s1x3akcaobct/chair.glb";
    private String assetModel = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        Intent intent = getIntent();
        modelUrl = intent.getStringExtra("modelUrl");
        assetModel = modelUrl;

                super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_2);

        arFragment = (ArFragment) getSupportFragmentManager()
                .findFragmentById(R.id.arFragment);

//        arFragment.setOnTapArPlaneListener((hitResult, plane, motionEvent) -> {
//            placeModel(hitResult.createAnchor());
//        });

        arFragment.setOnTapArPlaneListener(new BaseArFragment.OnTapArPlaneListener() {
            @Override
            public void onTapPlane(HitResult hitResult, Plane plane, MotionEvent motionEvent) {
                // when user taps on the plane, model will be add
                Anchor anchor = hitResult.createAnchor();
                AnchorNode anchorNode = new AnchorNode(anchor);
                anchorNode.setParent(arFragment.getArSceneView().getScene());

                createModel(anchorNode);
            }
        });
    }

//    private void placeModel(Anchor anchor) {
//        ModelRenderable
//                .builder()
//                .setSource(
//                        this,
//                        RenderableSource
//                        .builder()
//                        .setSource(this, Uri.parse(assetModel), RenderableSource.SourceType.GLB)
//                        .setScale(0.75f)
//                        .setRecenterMode(RenderableSource.RecenterMode.ROOT)
//                        .build()
//                )
//                .setRegistryId(assetModel)
//                .build()
//                .thenAccept(modelRenderable -> addNodeToScene(modelRenderable, anchor))
//                .exceptionally(throwable -> {
//                    AlertDialog.Builder builder = new AlertDialog.Builder(this);
//                    builder.setMessage(throwable.getMessage()).show();
//                    return null;
//                });
//    }

    private void createModel(AnchorNode anchorNode) {
        ModelRenderable
            .builder()
            .setSource(
                this,
                RenderableSource
                    .builder()
                    .setSource(this, Uri.parse(assetModel), RenderableSource.SourceType.GLB)
                    .setScale(0.75f)
                    .setRecenterMode(RenderableSource.RecenterMode.ROOT)
                    .build()
            )
            .setRegistryId(assetModel)
            .build()
            .thenAccept(modelRenderable -> addModel(modelRenderable, anchorNode))
            .exceptionally(throwable -> {
                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setMessage(throwable.getMessage()).show();
                return null;
            });
    }

    
    private void addModel(ModelRenderable modelRenderable, AnchorNode anchorNode) {
        TransformableNode transformableNode = new TransformableNode(arFragment.getTransformationSystem());
        transformableNode.setParent(anchorNode);
        transformableNode.setRenderable(modelRenderable);
        transformableNode.select();
    }

//    private void addNodeToScene(ModelRenderable modelRenderable, Anchor anchor) {
//        AnchorNode anchorNode = new AnchorNode(anchor);
//        anchorNode.setRenderable(modelRenderable);
//        arFragment.getArSceneView().getScene().addChild(anchorNode);
//    }
}
