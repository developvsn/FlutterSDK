package com.example.idenfy_sdk_flutter

import android.app.Activity
import android.content.Intent
import android.graphics.Color
import android.graphics.Rect
import androidx.annotation.NonNull
import androidx.core.content.res.ResourcesCompat
import com.facetec.sdk.FaceTecCancelButtonCustomization
import com.facetec.sdk.FaceTecCustomization
import com.google.gson.Gson
import com.idenfy.idenfySdk.CoreSdkInitialization.IdenfyController
import com.idenfy.idenfySdk.api.initialization.IdenfySettingsV2
import com.idenfy.idenfySdk.api.liveliness.IdenfyLivenessUISettings
import com.idenfy.idenfySdk.api.logging.IdenfySDKLoggingSettings
import com.idenfy.idenfySdk.api.response.IdenfyIdentificationResult
import com.idenfy.idenfySdk.api.ui.IdenfyUISettingsV2
import com.idenfy.idenfySdk.camerasession.commoncamerasession.presentation.model.IdenfyInstructionsType

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.common.PluginRegistry

/** IdenfySdkFlutterPlugin */
class IdenfySdkFlutterPlugin: FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var activity: Activity
  //Is nullable after proccess death.
  private var mResult: Result?=null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "idenfy_sdk_flutter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method == "start") {
      mResult = result

      val idenfyLivenessUISettings = IdenfyLivenessUISettings()
      val livenessIdCheckCustomization = IdenfyLivenessUISettings.LivenessIdCheckCustomization();

      var faceTechCustom : FaceTecCustomization = FaceTecCustomization()
      faceTechCustom.feedbackCustomization.textColor = Color.parseColor("#FFC700")
      faceTechCustom.frameCustomization.borderWidth = 0
      faceTechCustom.guidanceCustomization.headerFont = ResourcesCompat.getFont(activity,R.font.sfpro_bold)
      faceTechCustom.guidanceCustomization.retryScreenHeaderTextColor = Color.parseColor("#161617")
      faceTechCustom.guidanceCustomization.retryScreenImageBorderColor = Color.TRANSPARENT
      faceTechCustom.guidanceCustomization.retryScreenSubtextFont = ResourcesCompat.getFont(activity,R.font.sfpro_medium)
      faceTechCustom.guidanceCustomization.retryScreenSubtextTextColor = Color.parseColor("#161617")
      faceTechCustom.guidanceCustomization.buttonBackgroundDisabledColor = Color.parseColor("#A2A2A2")
      faceTechCustom.guidanceCustomization.buttonBackgroundHighlightColor = Color.parseColor("#161617")
      faceTechCustom.guidanceCustomization.buttonBackgroundNormalColor = Color.parseColor("#161617")
      faceTechCustom.guidanceCustomization.foregroundColor = Color.parseColor("#161617")
      faceTechCustom.feedbackCustomization.textColor = Color.parseColor("#161617")
      faceTechCustom.guidanceCustomization.readyScreenHeaderTextColor = Color.parseColor("#161617")
      faceTechCustom.guidanceCustomization.readyScreenSubtextFont = ResourcesCompat.getFont(activity,R.font.sfpro_medium)
      faceTechCustom.guidanceCustomization.readyScreenSubtextTextColor = Color.parseColor("#161617")
      faceTechCustom.cancelButtonCustomization.customImage = R.drawable.close_big
      faceTechCustom.cancelButtonCustomization.location  = FaceTecCancelButtonCustomization.ButtonLocation.CUSTOM
      var rect = Rect()
      rect.left = 24
      rect.bottom = 24
      rect.right = 24
      rect.top = 24
      faceTechCustom.cancelButtonCustomization.customLocation = rect
      faceTechCustom.ovalCustomization.strokeColor =  Color.parseColor("#FFC700")
      faceTechCustom.ovalCustomization.progressColor1 = Color.parseColor("#FFC700")
      faceTechCustom.ovalCustomization.progressColor2 = Color.parseColor("#FFC700")
      faceTechCustom.overlayCustomization.showBrandingImage = false
      faceTechCustom.feedbackCustomization.backgroundColors = Color.parseColor("#FFC700")
      faceTechCustom.guidanceCustomization.buttonCornerRadius = 4
      faceTechCustom.feedbackCustomization.textColor = Color.parseColor("#161617")
      faceTechCustom.feedbackCustomization.textFont = ResourcesCompat.getFont(activity,R.font.sfpro_bold)
      faceTechCustom.resultScreenCustomization.uploadProgressFillColor = Color.parseColor("#FFC700")
      faceTechCustom.resultScreenCustomization.uploadProgressTrackColor = Color.parseColor("#161617")
      faceTechCustom.resultScreenCustomization.customActivityIndicatorImage = R.drawable.empty
      faceTechCustom.resultScreenCustomization.customActivityIndicatorRotationInterval = 0
      faceTechCustom.resultScreenCustomization.foregroundColor = Color.parseColor("#FFFFFF")
      idenfyLivenessUISettings.livenessCustomUISettings = faceTechCustom

      val idenfyUISettingsV2 = IdenfyUISettingsV2.IdenfyUIBuilderV2()
        .withInstructions(IdenfyInstructionsType.DRAWER)
        .withLivenessUISettings(idenfyLivenessUISettings)
        .build()

      val idenfySettingsV2 = IdenfySettingsV2.IdenfyBuilderV2()
        .withAuthToken(call.argument<String>("authToken")!!)
        .withIdenfyUISettingsV2(idenfyUISettingsV2)
        .withLogging(IdenfySDKLoggingSettings.IdenfySDKLoggingEnum.FULL)
        .build()

      IdenfyController.getInstance().initializeIdenfySDKV2WithManual(
        this.activity,
        IdenfyController.IDENFY_REQUEST_CODE,
        idenfySettingsV2
      )

    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    this.activity = binding.activity
    binding.addActivityResultListener(this)
  }

  override fun onDetachedFromActivityForConfigChanges() {
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
  }

  override fun onDetachedFromActivity() {
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    if (requestCode == IdenfyController.IDENFY_REQUEST_CODE) {
      when (resultCode) {
        IdenfyController.IDENFY_IDENTIFICATION_RESULT_CODE -> {
          val idenfyIdentificationResult: IdenfyIdentificationResult = data!!.getParcelableExtra(IdenfyController.IDENFY_IDENTIFICATION_RESULT)!!
          val jsonString = Gson().toJson(idenfyIdentificationResult)
          mResult?.success(jsonString)
        }
      }
    } else {
      mResult?.notImplemented()
    }
    return true
  }
}
