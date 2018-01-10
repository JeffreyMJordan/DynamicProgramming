class DynamicProgramming
  attr_accessor :cache

  def initialize
    @cache = []
    @blair_cache = {}
    @frog_cache = {}
    @knap = {}
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
    frog_hops_top_down_helper(1)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_hops_top_down_helper(n)
    # return @frog_cache[n] if @frog_cache[n]
    # return frog_hops_top_down(n)
    return if n==0
    frog_hops_top_down_helper(n-1)
  end


  #k is max stairs
  def super_frog_hops(n, k)
    cache = super_frog_cache(n, k)
    cache[n]
  end

  def super_frog_cache(n, k)
    cache = {}
    cache[0] = [[]]
    
    #Go to the 1-ith thing 
    #THen we add i to everything contained there 
    #Do this 

    #base cases
    (1..k).each do |idx| 
      arr = []
      (0..(idx-1)).each do |i| 
        arr = arr + cache[i].deep_dup.map{|el| el << (idx-i)}
      end
      cache[idx] = arr
    end 
    
    ((k+1)..n).each do |idx| 
      arr = []
      (1..k).each do |i| 
        arr = arr + cache[i].deep_dup.map{|el| el << (idx-i)}
      end 
      cache[idx] = arr
    end 
    
    cache
  end 

  def knapsack(weights, values, capacity)
    #Have @Knap cache 
    return 0 if capacity==0 or weights.empty? 
    return @knap[capacity] if @knap[capacity]
    if weights[0] > capacity 
      return knapsack(weights[1..-1], values[1..-1], capacity)
    else 
      excluded = knapsack(weights[1..-1], values[1..-1], capacity)
      included = knapsack(weights[1..-1], values[1..-1], capacity-weights[0]) + values[0]
      if excluded>included
        @knap[capacity] = excluded
      else 
        @knap[capacity] = included
      end 
    end 

    @knap[capacity]

  end

  # Helper method for bottom-up implementation


  #
  #Iterate through both the capacity and the items 
  #Base is no more items 
  #If capacity is 0, also base 


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
