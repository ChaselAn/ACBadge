Pod::Spec.new do |s|
    s.name         = 'ACBadge'
    s.version      = '1.2.2'
    s.summary      = 'Swift3.0版未读红点'
    s.homepage     = 'https://github.com/ChaselAn/ACBadge'
    s.license      = 'MIT'
    s.authors      = {'ChaselAn' => 'chaselan1993@gmail.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/ChaselAn/ACBadge.git', :tag => s.version}
    s.source_files = 'ACBadge/*.swift'
    s.requires_arc = true
end
