namespace :buckets do
  desc "Fetch all new items"
  task :fetch => :environment do
    Gmail.connect(Buckets::Application.config.mail_username, Buckets::Application.config.mail_password) do |gmail|
      gmail.inbox.emails.each do |email|
        
        next unless email.message.from.include?(Buckets::Application.config.mail_whitelist)
        next if email.message.text_part.body.match('Unable to transcribe this message.')
        
        # puts email.message.message_id
        # puts email.message.subject # New voicemail from (718) 783-2134 at 12:27 AM
        # puts email.message.text_part.body
        
        number = MessageParser.parse_number(email.message.subject)
        message = MessageParser.parse_message(email.message.text_part.body)
        bucket = MessageParser.parse_bucket(message)
        message = MessageParser.remove_bucket_from_message(bucket, message)
        
        puts "   Date: #{email.message.date}"
        puts " Number: #{number}"
        puts "Message: #{message}"
        puts " Bucket: #{bucket}"
        puts "-------------------------"
        
        item = Item.create({
          # :user => User.find_or_create_by_phone_number(number),
          :bucket => Bucket.find_or_create_by_code(bucket),
          :text => message,
          :created_at => email.message.date
        })
        
        user = User.find_or_create_by_phone_number(number)
        user.items << item
      end
    end
  end
end