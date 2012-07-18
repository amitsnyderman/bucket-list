class EmailActionMailer < ActionMailer::Base
  default :from => Buckets::Application.config.mail_username
  
  def execute(action, item)
    @item = item
    mail(
      :to => action.email_address || item.user.email,
      # :from => item.user.email
      :subject => item.bucket.code.humanize
    )
  end
end
