class Maze # La classe doit être écrite avec un "s" à la fin
  def initialize(width, height)
    @width = width
    @height = height
    @maze = Array.new(height * 2 + 1) { Array.new(width * 2 + 1, "#") } # La méthode Array.new doit être écrite avec un "w" à new
    create_maze(1, 1)
    add_entry_exit
    display_maze
  end

  private

  def create_maze(x, y)
    directions = [[x, y - 2], [x, y + 2], [x - 2, y], [x + 2, y]].shuffle

    directions.each do |new_x, new_y|
      if new_y.between?(1, @height * 2) && new_x.between?(1, @width * 2) && @maze[new_y][new_x] == "#" # La méthode between? doit être écrite avec un "n" à between
        @maze[y + (new_y - y) / 2][x + (new_x - x) / 2] = " "
        @maze[new_y][new_x] = " "
        create_maze(new_x, new_y)
      end
    end
  end

  def add_entry_exit # La méthode add_entry_exit doit être écrite avec un "e" à entry
    @maze[1][0] = " "
    @maze[@height * 2 - 1][@width * 2] = " "
  end

  def display_maze
    @maze.each { |row| puts row.join } # La méthode each doit être écrite avec un "h" à each et il manque un "d" à row
  end
end

width = 10
height = 10

Maze.new(width, height) # La variable width était mal orthographiée et il manquait un "t" à height pour la déclaration de la classe Maze.