class FlatFixture
  def call
    raise
  rescue => exc
    exc
  end
end
