module RequestHelpers
  def request_headers
    {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  end
end
