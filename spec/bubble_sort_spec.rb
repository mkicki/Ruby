require 'simplecov'
SimpleCov.start

require 'bubble_sort'

RSpec.describe 'bubble_sort.rb' do		
		
	it 'works for empty array' do
		expect(bubble_sort([])).to eq([])
	end
	
	it 'works for array of size 1' do
		expect(bubble_sort([1])).to eq([1])
	end
	
	it 'works for decreasing array' do
		array = [9,8,7,6,5,4,3,2,1]
		expect(bubble_sort(array)).to eq(array.sort)
	end
	
	it 'works for increasing array' do
		array = [1,2,3,4,5,6,7,8,9]
		expect(bubble_sort(array)).to eq(array.sort)
	end
	
	it 'works for random array' do
		array = Array.new(10) { rand(10) }
		expect(bubble_sort(array)).to eq(array.sort)
	end
	
	it 'works with same numbers' do
		array = [5,4,8,3,1,9,7,5,4,4,3,8,2]
		expect(bubble_sort(array)).to eq(array.sort)
	end
	
	it 'works for huge and small numbers' do
		array = [1651861,10,65185315,135483,84,5,1685,894,6518,9851,198,3,5198,498984]
		expect(bubble_sort(array)).to eq(array.sort)
	end
	
	it 'works for positive and negative numbers' do
		array = [-3,5,-8,9,7,-2,-1,6,5]
		expect(bubble_sort(array)).to eq(array.sort)
	end
	
	it 'works for decimals' do
		array = [1.2,1.8,2.6,1.6,3.9,1.7]
		expect(bubble_sort(array)).to eq(array.sort)
	end
	
	it 'works for small letters' do
		array = ['h','w','q','a','d','j','s','t','b','v']
		expect(bubble_sort(array)).to eq(array.sort)
	end
	
	it 'works for small and capital letters' do
		array = ['g','s','d','W','H','J','k','q','t','N','X','K']
		expect(bubble_sort(array)).to eq(array.sort)
	end
	
	it 'works for words' do
		array = ['hello','hi','welcome','hola','bonjur']
		expect(bubble_sort(array)).to eq(array.sort)
	end
		
end
