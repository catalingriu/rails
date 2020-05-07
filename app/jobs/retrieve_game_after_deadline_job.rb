class RetrieveGameAfterDeadlineJob < ApplicationJob
  queue_as :default

  def perform(*loan)
    if loan[0].ended_at.nil?

      @game = loan[0].game; #?transaction
      @game.quantity += 1;
      @game.save;
  
      loan[0].ended_at = Time.now;
      loan[0].save;

      UserMailer.with(loan: loan[0]).notify_auto_return_done.deliver_now
    end
  end
end
