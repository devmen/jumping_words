module OS
  def windows?
    /cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM
  end

  def mac?
   /darwin/ =~ RUBY_PLATFORM
  end

  def unix?
    !OS.windows?
  end

  def linux?
    OS.unix? and not OS.mac?
  end
end

