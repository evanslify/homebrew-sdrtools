require 'formula'

class EttusUhd < Formula
  homepage 'http://www.ettus.com/'
  url 'https://github.com/EttusResearch/uhd/archive/release_003_009_005.tar.gz'
  sha256 '8e642d724412712fa8a799f3ae4c6aff5352167942e5c4e77243fca8db14a7bb'
  version '3.9.5'
  head 'https://github.com/EttusResearch/uhd.git',
    :revision => 'f70dd85daa8a6b9e1762c9339532027e40a67018',
    :shallow => true

  depends_on 'cmake' => :build
  depends_on 'automake' => :build
  depends_on 'libusb'
  depends_on 'boost'

  def install
    cd "host"
    mkdir "build"
    cd "build"
    system "cmake","../","-DCMAKE_INSTALL_PREFIX=#{prefix}",*std_cmake_args
    # system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test ettus-uhd`.
    system "false"
  end
end
