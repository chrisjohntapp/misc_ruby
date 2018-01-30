require 'digest'
require 'pp'

# Basic blockchain to demonstrate principle.
class Block

  attr_reader :index
  attr_reader :timestamp
  attr_reader :data
  attr_reader :previous_hash
  attr_reader :hash

  def initialize(index, data, previous_hash)
    @index         = index
    @timestamp     = Time.now
    @data          = data
    @previous_hash = previous_hash
    @hash          = calculate_hash
  end

  def calculate_hash
    hash = Digest::SHA256.new
    hash.update(@index.to_s + @timestamp.to_s + @data + @previous_hash)
    hash.hexdigest
  end

  def self.first(data)
    Block.new(0, 'First block', '0')
  end

  def self.next(previous, data='Transaction data..')
    Block.new(previous.index + 1, data, previous.hash)
  end

end
