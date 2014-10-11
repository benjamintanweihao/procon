defmodule ProCon do

  def start(num_producers, num_consumers) do
    manager_pid  = Manager.start(num_consumers)
    Enum.each 1..num_producers, fn _ ->
      Producer.start(manager_pid)
    end
  end

end
