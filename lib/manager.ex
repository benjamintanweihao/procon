defmodule Manager do

  def start(num_workers) do
    spawn(fn -> 
      consumer_pids = Enum.map(1..num_workers, fn _ -> Consumer.start(self) end)
      loop(consumer_pids)
    end)
  end

  def loop([]) do
    IO.puts "                                                                                                 [available: 0]"
    receive do
      {:request, producer_pid} ->
        loop([])

      {:done, consumer_pid} ->
        loop([consumer_pid])
    end
  end

  def loop([first | rest] = consumer_pids) do
    IO.puts "                                                                                                 [available: #{Enum.count(consumer_pids)}]"
    receive do
      {:request, producer_pid} ->
        send producer_pid, {:ok, first}
        loop(rest)

      {:done, consumer_pid} ->
        loop([consumer_pid | consumer_pids])
    end
  end

end
