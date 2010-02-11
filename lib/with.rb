class Object
  alias with tap
  def without
  end
end

class NilClass
  def with
    self
  end
  alias without tap
end
