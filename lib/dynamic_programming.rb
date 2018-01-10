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

  end

  def frog_cache_builder(n)

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
