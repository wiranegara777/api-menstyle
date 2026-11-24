class CustomError < StandardError
    attr_reader :status, :error, :message

    def initialize(
        status: 422, 
        error: 'Unprocessable Entity', 
        message: { "error" => ["Something Went Wrong"] }
    )
        @status  = status
        @error   = error
        @message = message
    end
end