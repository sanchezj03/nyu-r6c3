class Notifier < ActionMailer::Base
  def withdrawal (child)
    emails = User.find(:all, :conditions => { :send_withdraw_email => true }).collect { |user| user.email }
    
    recipients emails
    from      "NYU System <jesus.sanchez@med.nyu.edu>"
    subject   "#{child.name} has been withdrawn from the study."
    body      "#{child.name} (#{child.child_id}) has been withdrawn!"
  end
end
