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
end