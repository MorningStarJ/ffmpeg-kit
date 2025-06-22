Pod::Spec.new do |s|
  s.name             = 'ffmpeg_kit_flutter'
  s.version          = '6.0.3'
  s.summary          = 'FFmpeg Kit for Flutter'
  s.description      = 'A Flutter plugin for running FFmpeg and FFprobe commands.'
  s.homepage         = 'https://github.com/arthenica/ffmpeg-kit'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'ARTHENICA' => 'open-source@arthenica.com' }

  s.platform            = :ios
  s.requires_arc        = true
  s.static_framework    = true

  s.source              = { :path => '.' }
  s.source_files        = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.default_subspec     = 'https'

  s.dependency          'Flutter'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }

  s.subspec 'full' do |ss|
    ss.source_files        = 'Classes/**/*'
    ss.public_header_files = 'Classes/**/*.h'
    
    # 使用 prepare_command 下载 xcframework
    ss.prepare_command = <<-CMD
      curl -L https://github.com/luthviar/ffmpeg-kit-ios-full/releases/download/6.0/ffmpeg-kit-ios-full.zip -o ffmpeg-kit.zip
      unzip -o ffmpeg-kit.zip
      rm ffmpeg-kit.zip
    CMD
    
    ss.vendored_frameworks = 'ffmpeg-kit-ios-full/*.xcframework'
  end
end
