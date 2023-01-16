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
        detail: 'User with provided email already exists in database'
      }
    }
  end

  def self.bad_api_key
    {
      errors: 
      {
        status: 401,
        title: 'BAD API KEY',
        detail: 'Key does not match any users in database'
      }
    }
  end

  def self.bad_favorite_id
    {
      errors: 
      {
        status: 401,
        title: 'BAD FAVORITE ID',
        detail: 'Favorite ID does not match any favorites in database'
      }
    }
  end
end