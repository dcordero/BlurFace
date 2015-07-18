Pod::Spec.new do |s|
  s.name = 'BlurFace'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Blur the faces in an image'
  s.source_files = 'BlurFace/BlurFace/*.{swift}'
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
end
