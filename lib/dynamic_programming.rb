class DynamicProgramming
  attr_accessor :cache

  def initialize
    @cache = []
    @blair_cache = {}
  end

  def blair_nums(n)
    # Base case(s): which inputs n should return early?
    # Recursive case: what's the recursive relationship?
    # *NB*: you'll need to figure out how to express the nth odd number in terms of n.
    return @blair_cache[n] if @blair_cache[n]
    return 1 if n==1
    return 2 if n==2
    @blair_cache[n] = blair_nums(n-2) + blair_nums(n-1) + nth_odd(n-1)
    @blair_cache[n]
  end

  def nth_odd(n)
    res = 1 
    (n-1).times do 
      res += 2 
    end 
    res 
  end 

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    # Make a hash or array for storing previous solutions
    # Add the base cases to the cache  
    # Build solutions 4..n into the cache
    # Return the cache

    cache = {}
    cache[1] = [[1]]
    cache[2] = [[1,1], [2]]
    cache[3] = [[1,1,1], [1,2], [2,1], [3]]
    (4..n).each do |idx| 
      cache[idx] = cache[idx-1].deep_dup.map{|el| el << 1} + cache[idx-2].deep_dup.map{|el| el << 2} + cache[idx-3].deep_dup.map{|el| el << 3}
    end
    cache
  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end

class Array 
  def deep_dup
    res = []
    self.each do |el| 
      res << el.dup 
    end 
    res 
  end 
end 
