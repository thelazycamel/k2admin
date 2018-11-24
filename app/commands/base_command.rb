class BaseCommand

  def self.execute(*args)
    new(*args).execute
  end

  def execute
    raise InterfaceNotImplemented
  end

end
