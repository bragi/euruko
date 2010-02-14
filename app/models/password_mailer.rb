class PasswordMailer < ActionMailer::Base
  default_url_options[:host] = "registration.euruko2010.org"

  def instructions(user)
    subject "EuRuKo Password Reset"
    from "EuRuKo Mr. Roboto <robot@euruko2010.org>"
    recipients user.email
    sent_on Time.now
    body :user => user
  end
end
