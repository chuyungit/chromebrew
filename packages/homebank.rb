require 'package'

class Homebank < Package
  description 'HomeBank is a free software that will assist you to manage your personal accounting.'
  homepage 'https://www.gethomebank.org/en/index.php'
  version '5.4.3'
  license 'GPL-2'
  compatibility 'aarch64 armv7l x86_64'
  source_url 'http://homebank.free.fr/public/homebank-5.4.3.tar.gz'
  source_sha256 '9222d7ed7cc44fcfff3f1fe20935a1b7fe91bb4d9f90003cb3c6f3b893298d0b'
  binary_compression 'tar.xz'

  binary_sha256({
    aarch64: '9d0b46459cfd423490481d5e136a1adcdd5c0e7f4de21f789e6d12285f88208b',
     armv7l: '9d0b46459cfd423490481d5e136a1adcdd5c0e7f4de21f789e6d12285f88208b',
     x86_64: 'c8d1b25d778c7bfbecc9b2704e1e5d166213be5d6fe760c624f1adf86df327de'
  })

  depends_on 'libofx'
  depends_on 'libsoup'
  depends_on 'gtk3'
  depends_on 'xdg_base'
  depends_on 'wayland_protocols'
  depends_on 'mesa'
  depends_on 'xcb_util'

  def self.build
    system "./configure #{CREW_CONFIGURE_OPTIONS}"
    system 'make'
  end

  def self.install
    system 'make', "DESTDIR=#{CREW_DEST_DIR}", 'install'
  end

  def self.postinstall
    puts
    puts 'To complete the installation, execute the following:'.lightblue
    puts "echo 'alias homebank=\"WAYLAND_DISPLAY=wayland-0 DISPLAY=\'\' GDK_BACKEND=wayland homebank\"' >> ~/.bashrc".lightblue
  end
end
