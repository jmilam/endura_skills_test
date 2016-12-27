class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_login!, :stringify_num, :stringify_part_num

  def stringify_num
  	@stringify_num = { "one" => "1", "two"=> "2", "three" => "3", "four" => "4", "five" => "5", "six" => "6", "seven" => "7", "eight" => "8",
  										 "nine" => "9", "ten" => "10", "eleven" => "11", "twelve" => "12", "thirteen" => "13", "fourteen" => "14", "fifteen" => "15",
  										 "sixteen" => "16", "seventeen" => "17", "eighteen" => "18", "nineteen" => "19", "twenty" => "20"}
  end

  def stringify_part_num
  	@stringify_part_num = {"part_one" => "1", "part_two" => "2", "part_three" => "3", "part_four" => "4", "part_five" => "5", 
  												 "part_six" => "6", "part_seven" => "7", "part_eight" => "8", "part_nine" => "9", "part_ten" => "10", 
  												 "part_eleven" => "11", "part_twelve" => "12", "part_thirteen" => "13", "part_fourteen" => "14", 
  												 "part_fifteen" => "15", "part_sixteen" => "16", "part_seventeen" => "17", "part_eighteen" => "18", 
  												 "part_nineteen" => "19", "part_twenty" => "20"}
 	end
end
