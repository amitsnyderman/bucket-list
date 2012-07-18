module MessageParser
  def self.parse_number(value)
    value.match(/\((\d{3})\) (\d{3})-(\d{4})/).captures.join
  end
  
  def self.parse_message(value)
    value.match(/Transcript:\s+(.*)/).captures.join
  end
  
  def self.remove_bucket_from_message(bucket, message)
    return message.sub(/to\s*?do[^\w]+/i, '') if bucket == 'todo'
    message.sub(/#{bucket}[^\w]+/i, '')
  end
  
  def self.parse_bucket(value)
    return 'todo' if value.match(/^to do/i)
    value.match(/^(\w+)/).captures.first.downcase
  end
end