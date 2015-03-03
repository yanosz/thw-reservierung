# encoding: utf-8
class NoticeMailer < ActionMailer::Base
  

  def created(rental)
    subject    '[THW-Reservierung] Reservierung eingetragen'
    recipients rental.subject.notify_address
    from       "reservierung@thw-koeln.de"
    reply_to   "#{rental.user}@thw-koeln.de"
    sent_on    Time.now  + 70
    body       :rental => rental
  end

  def canceled(rental)
    subject    '[THW-Reservierung] Reservierung gelöscht'
    recipients rental.subject.notify_address
    from       "reservierung@thw-koeln.de"
    reply_to   "#{rental.user}@thw-koeln.de"
    sent_on    Time.now
    body       :rental => rental
  end

end
