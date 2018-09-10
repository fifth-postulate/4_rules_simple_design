class Juxtapose
  def these(*arrays)
    arrays.reduce { |accumulator, array|
      accumulator.map.with_index { |item, index| item + array[index] }
    }
  end
end
