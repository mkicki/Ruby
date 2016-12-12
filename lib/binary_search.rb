def binary_search(tab, klucz)
	return nil if klucz.nil?
	low = 0
	high = tab.size - 1
	while low <= high
		mid = (low + high) / 2
		wartosc = tab[mid]
		if wartosc > klucz
			high = mid - 1
		elsif wartosc < klucz
			low = mid + 1
		else
			return wartosc
		end
	end
	nil
end
