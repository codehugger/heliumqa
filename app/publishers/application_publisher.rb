class ApplicationPublisher
  def self.publish(queue_name, message, &block)
    connection = Bunny.new
    connection.start
    channel = connection.create_channel
    queue = channel.queue(queue_name, durable: true)
    exchange = channel.exchange(:heliumqa, durable: true)
    exchange.publish(message, routing_key: queue.name)
    connection.close
  end
end
