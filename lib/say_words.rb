class SayWords

  def initialize(collection, options={})
    @collection = collection
    @show_message = options[:show_message] || true
    @space_words = options[:space_words] || 3
    @space_interation = options[:space_interation] || 10
  end

  def run
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

end
