def bubble_sort(tab)
    loop do
      zmienione = false
      (tab.size-1).times do |i|
        if (tab[i] <=> tab[i+1]) == 1
          tab[i], tab[i+1] = tab[i+1], tab[i] # Zmienione
          zmienione = true
        end
      end
      break unless zmienione
    end
    tab
  end
