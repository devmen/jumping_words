class SayWords
  include OS

  def initialize(collection, options={})
    @collection = collection
    @show_message = options[:show_message] || SHOW_MESSAGE
    @space_words = options[:space_words] || SPACE_WORDS
    @space_interation = options[:space_interation] || SPACE_INTERATION
  end

  def run
    if mac?
      do_mac
    elsif linux?
      do_ubuntu
    end
  end

  private
  def do_ubuntu
    loop do
      @collection.each do |word|
        puts "I say #{word[0]}"
        system 'notify-send -i /usr/share/pixmaps/gnome-irc.png "'+ word[0] +'" "'+ word[1] +'"  -t 1' if @show_message
        system 'espeak -v en -s120 "'+ word[0] +'"'
        sleep @space_words
        #puts "I say #{word[1]}"
        system 'espeak -v ru -s120 "'+ word[1] +'"'
        sleep @space_interation
      end
      sleep 4 # for notification hiding
    end
  end

  def do_mac
    loop do
      @collection.each do |word|
        puts "I say #{word[0]}"
        #puts 'terminal-notifier -message "'+ word[0] +': '+ word[1] +'" -title "JWords"' if @show_message
        system 'terminal-notifier -message "'+ word[0] +': '+ word[1] +'" -title "JWords"' if @show_message
        system 'say -v Vicki "'+ word[0] +'"'
        sleep @space_words
        #puts "I say #{word[1]}"
        system 'say -v Milena "'+ word[1] +'"'
        sleep @space_interation
      end
      sleep 4 # for notification hiding
    end

  end

end
