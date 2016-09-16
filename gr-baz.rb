require 'formula'

class GrBaz < Formula
  homepage 'http://wiki.spench.net/wiki/Gr-baz'
  head 'https://github.com/balint256/gr-baz.git',
    :revision => 'b1abb4ecd26214efc472f0dcc0ffd5809fb58a55'

  depends_on 'cmake' => :build
  depends_on 'gnuradio'

  def install
    mkdir 'build' do
      system 'cmake', '..', '-DPYTHON_LIBRARY=/usr/local/Frameworks/Python.framework/Versions/2.7/Python ', *std_cmake_args
      system 'make'
      system 'make install'
    end
  end
end
