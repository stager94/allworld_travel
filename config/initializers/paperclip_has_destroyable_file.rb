# encoding: UTF-8
class ActiveRecord::Base

  def self.has_destroyable_file(*attachments)
    attachments.each do |attachment|
      attr_accessible :"delete_#{attachment}"
      
      before_update do
        self.send(attachment).clear if self.send(:"delete_#{attachment}") == true
      end

      after_update do
        # update_attributes delete_image: false, skip_callbacks: true
      end

    end
  end
end
