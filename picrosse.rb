# board = Array.new(3) { Array.new(3) }
# row_data = [[1,1],[2],[1,1]]
# col_data = [[3],[1],[1,1]]
#
# def picrosse(board, row_data, col_data)
#   final_board = Array.new(3) { Array.new(3) }
#   row_data.each_with_index do |row_datum, idx|
#     total = row_datum.inject(:+)
#     i = 0
#     while i < total + row_datum.length - 1
#       final_board[idx] += possib(board[idx].length, group_size)
#       i += 1
#
#
# def possib(pos_in_row, group_size, result = [])


row = [1,2]
arr = Array.new(5, false)

def testing(arr, row)
  i = 0
  total = row.inject(:+)
  window = arr.length - (total + row.length - 1)
  result = []
  while i <= arr.length - (total + row.length - 1)
    0.upto(window) do |win|
      row.each do |group_size|
        p [i, win, group_size]
      end
    end
    i += 1
  end
end

testing(arr,row)
