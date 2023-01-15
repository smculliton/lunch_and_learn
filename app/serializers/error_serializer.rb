class ErrorSerializer
  def self.missing_params(param)
    {
      errors: 
      {
        status: 400,
        title: 'MISSING PARAMS',
        detail: "Missing required parameters: #{param}"
      }
    }
  end

  def self.user_email_taken
    {
      errors: 
      {
        status: 400,
        title: 'EMAIL ALREADY IN USE',
        detail: "User with provided email already exists in database"
      }
    }
  end
end