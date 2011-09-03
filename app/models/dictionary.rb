class Dictionary < ActiveRecord::Base
  after_save :set_name

  attr_accessor :document_file_name

  has_attached_file :document,
    :url  => "/uploads/:id/:basename.:extension",
    :path => ":rails_root/public/uploads/:id/:basename.:extension"

  validates_attachment_presence :document

  HASH_FILE='public/hashed_words'

  def self.word_list
    @@word_list ||= self.load_word_list
  end

  def self.load_word_list
    word_list = {}
    File.open(HASH_FILE, "r") do |file|
      word_list = Marshal.load(file)
    end
    word_list
  end

  def self.find_anagram(word)
    if (word.kind_of? String) and (word.size > 0)
      # calculate the index for word
      sorted_anagram = word.split('').sort!.join('')
    
      # perform the lookup
      word_list[sorted_anagram]
    end
  end
  
  def save_index
    wordlist = {}   # results are stored here
    f = "public/uploads/#{id}/#{name}"
    File.open(f, "r") do |file|
      while line = file.gets
        # for each word
        word = line.chomp
        # break it into a sequence of ordered letters..
        index = word.split('').sort!.join('')
        # ..and use that as an index for anagrams
        wordlist[index] = [] if not wordlist.has_key? index
        wordlist[index] += [word]
      end
    end
    # make results persistent
    File.open(HASH_FILE, "w") do |file|
      Marshal.dump(wordlist, file)
    end
    true
  end

  private
  def set_name
    self.name = document_file_name
    true
  end
end
