# encoding: utf-8

require 'csv'
class DbWords
  attr_reader :words

  def initialize(argv=nil)
    @argv = argv
    @words = Array.new
    @file = "./" + DATABASE + ".csv"
  end

  #adding word in db
  def add
    split
    if double?
      puts "You have '#{@words[0]}' in database"
      exit
    end

    CSV.open(@file, "a") do |csv|
      csv << [@words[0], @words[1]]
    end
    puts "Word is added"
  end

  #Destroy a word from db file
  def destroy
    list_w = CSV.read(@file)
    @argv.map(&:to_i).each do |i|
      list_w.delete_at(i-1)
    end

    CSV.open(@file, "w") do |csv|
      list_w.each do |row|
        csv << row
      end
    end

    puts @argv.join(" ") + " deleted"
    list
  end

  #Print the list of words
  def list
    list_of_words do |word, idx|
      puts "#{idx + 1} #{word[0]}: #{word[1]}"
    end
  end

  private
  # input is ["to", "run:", "бежать"]
  # output is ["to run", "бежать"]
  def split
    w = @argv.join(" ").split(":")
    if w.size < 2
      pp 'You mast set ":" on word. Like this: "./word -a to run: бежать"'
    end
    @words = w.map(&:strip)
  end

  #return true if have double in db
  def double?
    w = @words.first
    list = CSV.read(@file)
    list.map(&:first).include?( w )
  end

  def list_of_words
    list = CSV.read(@file)
    list.each_with_index do |word, idx|
      yield(word, idx)
    end
  end
end
