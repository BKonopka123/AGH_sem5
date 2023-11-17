import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

import java.io.BufferedReader;
import java.io.FileReader;
import java.lang.StringBuilder;

public class BibliotekaTest{
    @Test
    public void Test_Ksiazka_constructor(){
        Ksiazka tmp = new Ksiazka(1, "aaa", "bbb");
        assertEquals(tmp.ksiazka_id(), 1);
        assertEquals(tmp.tytul(), "aaa");
        assertEquals(tmp.autor(), "bbb");
    }

    @Test
    public void Test_Czytelnik_constructor(){
        Czytelnik tmp = new Czytelnik(1, "Jan", "Kowalski", "123456789", "123@gmail.com", "ul. Kowalska", "1", "1", "Krakow");
        assertEquals(tmp.czytelnik_id, 1);
        assertEquals(tmp.imie, "Jan");
        assertEquals(tmp.nazwisko, "Kowalski");
        assertEquals(tmp.nr_telefonu, "123456789");
        assertEquals(tmp.e_mail, "123@gmail.com");
        assertEquals(tmp.ulica, "ul. Kowalska");
        assertEquals(tmp.dom, "1");
        assertEquals(tmp.miekszanie, "1");
        assertEquals(tmp.miasto, "Krakow");
    }

    @Test
    public void Test_Biblioteka_constructor() {
        Biblioteka tmp = new Biblioteka("a");
        assertEquals(tmp.nazwa, "a");
    }

    @Test
    public void Test_Biblioteka_wypozycz(){
        Biblioteka tmp_b = new Biblioteka("a");
        Czytelnik tmp_c = new Czytelnik(1, "Jan", "Kowalski", "123456789", "123@gmail.com", "ul. Kowalska", "1", "1", "Krakow");
        Ksiazka tmp_k = new Ksiazka(1,"aaaaa","bbbbb");
        tmp_b.wypozycz(tmp_k,tmp_c);
        assertEquals(tmp_c.wypozyczone_ksiazki.get(0), tmp_k);
    }


}