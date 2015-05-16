require 'formula'

class Rtlsdr < Formula
  homepage 'http://sdr.osmocom.org/trac/wiki/rtl-sdr'
  head 'git://git.osmocom.org/rtl-sdr.git',
    :shallow => false,
    :revision => '8b4d755ba1b889510fba30f627ee08736203070d'

  depends_on 'pkg-config' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'cmake' => :build
  depends_on 'libusb'

  if MacOS.xcode_version.to_f >= 4.3
    depends_on 'autoconf'
  end

  def install
    args = ["--prefix=#{prefix}"]
    system "autoreconf -i"
    system "./configure", *args
    system "make install"
  end
end
