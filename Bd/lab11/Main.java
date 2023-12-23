//Wwpisac jako stdin: 6 10 Wokulski, liczby moga byc inne (ksiazka id <=15 czytelnik id <= 10, sa 2 osoby o nazwisko Wokulski)

import java.sql.*;
import java.util.Scanner;
import java.lang.StringBuilder;
import java.util.ArrayList;

public class Main{
    public static void main(String[] args) {
        Connection connection = null;
        try{
            String serverName = "pascal.fis.agh.edu.pl";
            String baza = "u1konopka";
            String url = "jdbc:postgresql://" + serverName +  "/" + baza;
            String username = "u1konopka";
            String password = "1konopka";
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Successfully Connected to the database!");
        }

        catch (SQLException e) {
            System.out.println("Could not connect to the database " + e.getMessage());
        }

        Scanner scanner = new Scanner(System.in);
        System.out.print("1.Podaj ksiazka_id: ");
        int ksiazka_id = scanner.nextInt();
        System.out.print("1.Podaj czytelnik_id: ");
        int czytelnik_id = scanner.nextInt();
        System.out.print("2.Podaj nazwisko: ");
        String nazwisko = scanner.next();
        scanner.close();

        System.out.println("\nZAD1:");
        System.out.println(wypozycz(connection, ksiazka_id, czytelnik_id));

        System.out.println("ZAD2:");
        wypisz(connection, nazwisko);
    }

    public static String wypozycz(Connection c, int ksiazka_id, int czytelnik_id){
        StringBuilder result = new StringBuilder();
        try{ 
            result.append("Ostatnie dokonane wypozyczenie przed insert = ");
            PreparedStatement pstt1 = c.prepareStatement( "SELECT wypozyczenie_id FROM wypozyczenie ORDER BY wypozyczenie_id DESC LIMIT 1" );
            ResultSet rs1;
            rs1 = pstt1.executeQuery();
            rs1.next();
            result.append("czytelnik_id: "+rs1.getInt("wypozyczenie_id")+"\n");
            pstt1.close();
            result.append("Ostatnie dokonane wc przed insert = ");
            PreparedStatement pstt2 = c.prepareStatement( "SELECT wc_id FROM wc ORDER BY wc_id DESC LIMIT 1" );
            ResultSet rs2;
            rs2 = pstt2.executeQuery();
            rs2.next();
            result.append("wc_id: "+rs2.getInt("wc_id")+"\n");
            pstt2.close();

            PreparedStatement pst1 = c.prepareStatement( "INSERT INTO wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) VALUES (?,'2023-12-17',null)" );
            pst1.setInt(1,czytelnik_id);
            int rows = pst1.executeUpdate();
            result.append("Polecenie 1 -  INSERT wypozyczenie - ilosc dodanych rekordow: " + rows + "\n");    
            pst1.close(); 
            
            PreparedStatement pst2 = c.prepareStatement( "SELECT wypozyczenie_id FROM wypozyczenie ORDER BY wypozyczenie_id DESC LIMIT 1" );
            ResultSet rs;
            rs = pst2.executeQuery();

            PreparedStatement pst3 = c.prepareStatement( "INSERT INTO wc(wypozyczenie_id, ksiazka_id) VALUES (?,?)" );
            rs.next();
            pst3.setInt(1,rs.getInt("wypozyczenie_id"));
            pst2.close();
            pst3.setInt(2,ksiazka_id);
            rows = pst3.executeUpdate();
            result.append("Polecenie 2 -  INSERT wc - ilosc dodanych rekordow: " + rows + "\n");    
            pst3.close();

            result.append("Ostatnie dokonane wypozyczenie po insert = ");
            PreparedStatement pstt3 = c.prepareStatement( "SELECT wypozyczenie_id, czytelnik_id FROM wypozyczenie ORDER BY wypozyczenie_id DESC LIMIT 1" );
            ResultSet rs3;
            rs3 = pstt3.executeQuery();
            rs3.next();
            result.append("wypozyczenie_id: "+rs3.getInt("wypozyczenie_id")+ " czytelnik_id = " + rs3.getInt("czytelnik_id") + "\n");
            pstt1.close();
            result.append("Ostatnie dokonane wc po insert = ");
            PreparedStatement pstt4 = c.prepareStatement( "SELECT wc_id, ksiazka_id FROM wc ORDER BY wc_id DESC LIMIT 1" );
            ResultSet rs4;
            rs4 = pstt4.executeQuery();
            rs4.next();
            result.append("wc_id: "+rs4.getInt("wc_id")+ " ksiazka_id = " + rs4.getInt("ksiazka_id") +"\n");
            pstt4.close();
        }
        catch(SQLException e){
            result.append("Blad podczas przetwarzania danych:"+e+"\n");   
        }    
        return result.toString();  
    }

    public static void wypisz(Connection c, String nazwisko){
        try{
            PreparedStatement pst1 = c.prepareStatement( "SELECT czytelnik_id FROM czytelnik WHERE nazwisko = ?" );
            pst1.setString(1,nazwisko);
            ResultSet rs1;
            rs1 = pst1.executeQuery();
            ArrayList<Integer> czytelnik_id = new ArrayList<Integer>();
            while (rs1.next()){
                czytelnik_id.add(rs1.getInt("czytelnik_id"));
            }
            pst1.close();
            for(Integer id : czytelnik_id){
                System.out.println("Czytelnik o id = " + id + " wypozyczyl nastepujace ksiazki:");
                CallableStatement cst = c.prepareCall( "{call get_pozyyczone_ksiazki(?)}" );
                cst.setInt(1,id);
                ResultSet rs ;
                rs = cst.executeQuery();
                while (rs.next()){
                    String tytul = rs.getString(1) ;
                    String oddana = rs.getString(2) ;
                    System.out.println("tytul: " + tytul + " oddana: " + oddana);   
                }
                rs.close();      
                cst.close(); 
            }
        }
        catch(SQLException e){
            System.out.println("Blad podczas przetwarzania danych:"+e);   
        }
    }
}