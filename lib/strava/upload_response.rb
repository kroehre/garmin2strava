module Strava

# id          | integer
# external_id | string
# activity_id | integer may be null
# status      | string              | describes the error, possible values:‘Your activity is still being processed.’, ‘The created activity has been deleted.’, ‘There was an error processing your activity.’, ‘Your activity is ready.’
# error       | string              | may be null. if there was an error during processing, this will contain a human a human readable error message that may include escaped HTML

  class UploadResponse

    STATUS_PROCESSING = "Your activity is still being processed."
    STATUS_DELETED    = "The created activity has been deleted."
    STATUS_ERROR      = "There was an error processing your activity."
    STATUS_READY      = "Your activity is ready."

    attr_accessor :id, :external_id, :activity_id, :status, :error

    def initialize(attributes={})
      attributes.each do |k,v|
        self.send "#{k}=", v
      end
    end

    def error?
      status == STATUS_ERROR
    end

    def ready?
      status == STATUS_READY
    end

    def processing?
      status == STATUS_PROCESSING
    end

  end
end
