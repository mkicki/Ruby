require 'simplecov'
SimpleCov.start

require 'binary_search'

RSpec.describe 'binary_search.rb' do		
		
	it 'works for empty array' do
		expect(binary_search([],1)).to be_nil
	end
	
	it 'works for array of size 1 when key exists' do
		expect(binary_search([1],1)).to eq(1)
	end
	
	it 'works for array of size 1 when key deosnt exists' do
		expect(binary_search([1],2)).to be_nil
	end
	
	it 'works for sorted array of numbers when key exists' do
	array = Array.new(100) { rand(100) }
	array = array.sort
	key = array.first
		expect(binary_search(array,key)).to eq(key)
	end
	
	it 'works when looking for nil' do
	array = Array.new(100) { rand(100) }
	array = array.sort
		expect(binary_search(array,nil)).to be_nil
	end
	
	it 'works for sorted array of numbers when key doesnt exists' do
	array = [1,2,4,6,8,9,15,16,22,23,53,56,75,83,89]
		expect(binary_search(array,55)).to be_nil
	end
	
	it 'works for sorted array of letters when key exists' do
	array = ['a','b','c','d','e','f','g','h','i','j','k','l']
	key = 'd'
		expect(binary_search(array,key)).to eq(key)
	end
	
	it 'works for sorted array of letters when key doesnt exists' do
	array = ['a','b','c','d','e','f','g','h','i','j','k','l']
		expect(binary_search(array,'m')).to be_nil
	end
	
	it 'works when looking for empty string' do
	array = ['a','b','c','d','e','f','g','h','i','j','k','l']
		expect(binary_search(array,'')).to be_nil
	end
	
end
