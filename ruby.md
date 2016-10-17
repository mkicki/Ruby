## Notatki z Ruby, v2.3.1
Wpisz: "Hello World"

irb(main):001:0> "Hello World"
=> "Hello World"

Jeśli chcemy wyświetlić “Hello World” potrzebujemy troszkę więcej:

irb(main):002:0> puts "Hello World"
Hello World
=> nil

puts jest poleceniem, które ogólnie rzecz biorąc wyświetla różne rzeczy w Rubim. A co oznacza => nil ? To wynik wyrażenia. puts zawsze zwraca nil, nil w Rubim zawsze oznacza kompletny brak jakiejkolwiek wartości.

Mamy już wystarczająco informacji, aby użyć IRB’a jako prostego kalkulatora:

irb(main):003:0> 3+2
=> 5

Następnie, wypróbujmy potęgowania:

irb(main):005:0> 3**2
=> 9

Pierwiastek:

irb(main):006:0> Math.sqrt(9)
=> 3.0

Przypiszmy wynik do zmiennej.

irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0

Musimy zdefiniować metodę!

irb(main):010:0> def h
irb(main):011:1> puts "Hello World!"
irb(main):012:1> end
=> nil

Teraz wypróbujmy uruchomić tę metodę kilka razy:

irb(main):013:0> h
Hello World!
=> nil
irb(main):014:0> h()
Hello World!
=> nil

Musimy po prostu przedefiniować h aby przyjmowała imię jako parametr.

irb(main):015:0> def h(name)
irb(main):016:1> puts "Hello #{name}!"
irb(main):017:1> end
=> nil
irb(main):018:0> h("Matz")
Hello Matz!
=> nil

Możesz użyć tego sposobu na przykład aby upewnić się, że czyjeś imię jest drukowane z dużej litery:

irb(main):019:0> def h(name = "World")
irb(main):020:1> puts "Hello #{name.capitalize}!"
irb(main):021:1> end
=> nil
irb(main):022:0> h "chris"
Hello Chris!
=> nil
irb(main):023:0> h
Hello World!
=> nil

Co jeśli chcielibyśmy mieć prawdziwą klasę witającą, taką, która zapamiętuje twoje imię, wita Cię i traktuje zawsze z szacunkiem. Do tego celu użyjemy obiektu. Stwórzmy klasę “Greeter”.

irb(main):024:0> class Greeter
irb(main):025:1>   def initialize(name = "World")
irb(main):026:2>     @name = name
irb(main):027:2>   end
irb(main):028:1>   def say_hi
irb(main):029:2>     puts "Hi #{@name}!"
irb(main):030:2>   end
irb(main):031:1>   def say_bye
irb(main):032:2>     puts "Bye #{@name}, come back soon."
irb(main):033:2>   end
irb(main):034:1> end
=> nil

irb(main):035:0> g = Greeter.new("Pat")
=> #<Greeter:0x16cac @name="Pat">
irb(main):036:0> g.say_hi
Hi Pat!
=> nil
irb(main):037:0> g.say_bye
Bye Pat, come back soon.
=> nil

 Isnieją inne metody dostępu do zmiennych instancji, ale Ruby używa sprawdzonego, obiektowego podejścia “trzymania danych w pewien sposób ukrytych”.

Więc jakie to metody istnieją dla obiektów klasy Greeter?

irb(main):039:0> Greeter.instance_methods
=> ["method", "send", "object_id", "singleton_methods",
    "__send__", "equal?", "taint", "frozen?",
    "instance_variable_get", "kind_of?", "to_a",
    "instance_eval", "type", "protected_methods", "extend",
    "eql?", "display", "instance_variable_set", "hash",
    "is_a?", "to_s", "class", "tainted?", "private_methods",
    "untaint", "say_hi", "id", "inspect", "==", "===",
    "clone", "public_methods", "respond_to?", "freeze",
    "say_bye", "__id__", "=~", "methods", "nil?", "dup",
    "instance_variables", "instance_of?"]
Dużo metod. My zdefiniowaliśmy tylko dwie metody. Co tutaj się dzieje? No coż, to są wszystkie metody obiektów klas Greeter, kompletna lista, wliczając w to metody zdefiniowane w klasach nadrzędnych. Jeśli chcemy wyświetlić tylko metody zdefiniowane w klasie Greeter, możemy wskazać, że nie chcemy wyświetlać metod zdefiniowanych w klasach nadrzędnych poprzez przekazanie parametru false.

irb(main):040:0> Greeter.instance_methods(false)
=> ["say_bye", "say_hi"]
Zobaczmy więc, na jakie metody nasz obiekt odpowiada (responds_to):

irb(main):041:0> g.respond_to?("name")
=> false
irb(main):042:0> g.respond_to?("say_hi")
=> true
irb(main):043:0> g.respond_to?("to_s")
=> true

Co jeśli chielibyśmy wyświetlić albo zmienić imię (name)? Ruby zapewnia nam łatwy dostępn do zmiennych obiektu.

irb(main):044:0> class Greeter
irb(main):045:1>   attr_accessor :name
irb(main):046:1> end
=> nil
W Rubim możesz ponownie otworzyć klasę i zmodyfikować ją. To nie zmienia żadnych obiektów, które juz isnieją, ale zmienia obiekty, które dopiero powstaną. Utwórzmy więc nowy obiekt i pobawmy się jego właściwością @name.

irb(main):047:0> g = Greeter.new("Andy")
=> #<Greeter:0x3c9b0 @name="Andy">
irb(main):048:0> g.respond_to?("name")
=> true
irb(main):049:0> g.respond_to?("name=")
=> true
irb(main):050:0> g.say_hi
Hi Andy!
=> nil
irb(main):051:0> g.name="Betty"
=> "Betty"
irb(main):052:0> g
=> #<Greeter:0x3c9b0 @name="Betty">
irb(main):053:0> g.name
=> "Betty"
irb(main):054:0> g.say_hi
Hi Betty!
=> nil
Użycie attr_accessor zdefiniowało dwie nowe metody dla nas, name aby odczytać wartość oraz name= aby ją ustawić.

Witanie Wszystkiego, MegaGreeter Nie Opuszcza Niczego!
Nasz witający obiekt nie jest bardzo interesujący, może on zajmować się tylko jedną osobą naraz. Co jeśli mielibyśmy pewien rodzaj MegaGreeter’a, który mógłby witać albo cały świat, jedną osobę albo całą listę osób ?

Napiszmy go tym razem w pliku a nie w interaktywnej konsoli IRB’a.

Aby wyjść z IRB’a wpisz “quit”, “exit” albo po prostu naciśnij Control-D.

"#!/usr/bin/env ruby

class MegaGreeter
  attr_accessor :names

  # Create the object
  def initialize(names = "World")
    @names = names
  end

  # Say hi to everybody
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names is a list of some kind, iterate!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  # Say bye to everybody
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Join the list elements with commas
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end

end


if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  # Zmień imię na "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Zmień imię na tablicę imion
  mg.names = ["Albert", "Brenda", "Charles",
    "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # Zmień imię na nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end"
Zapisz ten plik pod nazwą “ri20min.rb”, i uruchom go wpisując “ruby ri20min.rb”. Wynik poniżej:

Hello World!
Goodbye World.  Come back soon!
Hello Zeke!
Goodbye Zeke.  Come back soon!
Hello Albert!
Hello Brenda!
Hello Charles!
Hello Dave!
Hello Engelbert!
Goodbye Albert, Brenda, Charles, Dave, Engelbert.  Come
back soon!

Patrząc bliżej na nasz program, zauważamy początkowe linie, które zaczynają się od (#). W Rubim wszystko w linii napisane za znakiem (#) jest uważane za komentarz i ignorowane przez interpreter. Pierwsza linia pliku jest wyjątkiem, system operacyjny Unix wskazuje przy jej pomocy konsoli jakiego programu użyć do uruchomienia tego pliku. Reszta komentarzy występuje po prostu dla przejrzystości:

Nasza metoda say_hi stała się trochę bardziej skomplikowana:

Powiedz hi wszystkim
def say_hi
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("each")
    # @names to pewnego rodzaju lista, przejdź po elementach tej listy
    @names.each do |name|
      puts "Hello #{name}!"
    end
  else
    puts "Hello #{@names}!"
  end
end
Metoda ta sprawdza teraz parametr @names i jeśli wynosi on nil to wyświetla trzy kropki. Nie ma sensu witać kogoś kogo nie ma, prawda ?

Iteracje i Pętle
Jeśli obiekt @names odpowiada na wywołanie metody each, wtedy można po tym obiekcie iterować, więc zróbmy to i przywitajmy każdą osobę. Jeśli @names jest czymkolwiek innym (nie odpowiada na each) zamieńmy to na stringa i wyświetlmy domyśle powitanie.

Przyjrzyjmy się bliżej iteratorowi:

@names.each do |name|
  puts "Hello #{name}!"
end
each jest metodą, która przyjmuje blok kodu i wywołuje ten blok kodu dla każdego elementu na liście. Kod pomiędzy do oraz end jest własnie takim blokiem. Blok przypomina anonimową funkcję lub lambda. Zmienna pomiędzy pionowymi liniami jest parametrem przekazywanym do bloku.

Zmiennej name przypisywany jest każdy element listy, później wywoływane jest wyrażenie “Hello #{name}!”@ które wyświetla powitanie.

Większość innych języków programowania obsługuje iterację po elementach listy za pomocą pętli for, w C wygląda to mniej więcej tak:

for (i=0; i<number_of_elements; i++)
{
  do_something_with(element[i]);
}
To działą, ale nie jest zbyt eleganckie. Potrzebujesz tu tymczasowej zmiennej do przechowania rozmiaru listy i oraz musisz opisać jak dostać się do kolejnych elementów listy. Sposób w jaki robi to Ruby jest o wiele bardziej elegancki, wszystko ukryte jest za metodą each, musisz jedynie wskazać co chcesz zrobić z każdym elementem. Wewnątrz, metoda each tak naprawdę wywołuje yield "Albert", później yield "Brenda" i w końcu yield "Charles", itd.

Bloki, Błyszcząca Iskra Rubiego
Prawdziwa potęga bloków ujawnia się kiedy mamy do czynienia ze strukturami bardziej skomplikowanymi niż listy. Poza obsługą prostej funkcjonalności w metodzie, możesz także obsłużyć wstępne ustawienia, zakończenie i błędy – wszystko ukryte przed użytkownikiem twoich metod.

Powiedz wszystkim "do widzenia"
def say_bye
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("join")
    # Połącz elementy listy przecinkiem
    puts "Goodbye #{@names.join(", ")}.  Come back soon!"
  else
    puts "Goodbye #{@names}.  Come back soon!"
  end
end
Metoda say_bye nie korzysta z each, zamiast tego sprawdza czy @names odpowiada na wywołanie metody join, jeśli tak, to uzywa tej metody. W przeciwnym wypadku, funkcja wyświetla po prostu zmienną jako stringa. Ten sposób, który polega na nie przejmowaniu się faktycznym typem zmiennej a poleganiu po prostu na metodach jakie są dostępne nazywa się “Duck Typing” (dosł kacze typowanie), tak jak w powiedzeniu “jeśli to chodzi jak kaczka, i kwacze jak kaczka to musi być kaczka…”. Zaletą tego podejścia jest to, że nie musimy się niepotrzebnie ograniczać typami jakie możemy wspierać. Jeśli ktoś wymyśli nowy typ listy, to jeśli tylko ten nowy typ będzie wspierał metodę join używając tej samej sematyki jak w przypadku innych list, wszystko będzie działać tak jak powinno.

Odpalanie Skryptu
Więc, oto jest klasa MegaGreeter , reszta pliku po prostu wywołuje metody z tej klasy. Zwróćmy uwagę jeszcze na ostatni trik, to linia:

if __FILE__ == $0
__FILE__ jest magiczną zmienną która zawiera nazwę obecnie używanego pliku. $0 jest nazwą pliku użytego do uruchomienia programu. To przyrównanie oznacza: “Jeśli obecny plik to plik, który został uruchomiony wtedy” takie rozwiązanie umożliwia użycie tego pliku jako biblioteki w innych miejscach i nie wykonywanie tego kodu w tym kontekście. Jeśli jednak plik jest użyty jako główny plik wykonywalny wtedy kod zostanie wykonany.
