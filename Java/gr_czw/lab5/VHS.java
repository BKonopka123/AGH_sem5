import java.util.UUID;
import java.time.LocalDate;

/**
 * VHS class which represents cassette objects which contains UUID - id of cassette, Movie which is recorded in this VHS, return amd rental Dates of renting VHS
 */
public class VHS {
    Movie movie;
    final UUID uuid;
    LocalDate returnDate;
    LocalDate rentalDate;

    /**
     * Basic Constructor of VHS Class
     * @param uuid id of VHS
     * @param movie Movie which is on VHS object
     * @param returnDate Return date of VHS
     * @param rentalDate Rental date of VHS
     */
    public VHS(UUID uuid, Movie movie, LocalDate returnDate, LocalDate rentalDate){
        this.uuid = uuid;
        this.movie = new Movie(movie);
        this.returnDate = LocalDate.of(returnDate.getYear(), returnDate.getMonthValue(), returnDate.getDayOfMonth());
        this.rentalDate = LocalDate.of(rentalDate.getYear(), rentalDate.getMonthValue(), rentalDate.getDayOfMonth());
    }

    /**
     * Method which allows to change Movie and dates of existing VHS tape
     * @param movie Movie which will be overrided in existing VHS
     * @param returnDate Return date which will be overrided in existing VHS
     * @param rentalDate Rental date will be overrided in existing VHS
     */
    public void change_movie(Movie movie, LocalDate returnDate, LocalDate rentalDate){
        this.setMovie(movie);
        this.setReturnDate(returnDate);
        this.setRentalDate(rentalDate);
    }

    /**
     * Getter returning Movie
     * @return Movie of this object
     */
    public Movie getMovie(){
        return this.movie;
    }

    /**
     * Getter returning VHS id
     * @return UUID of this object
     */
    public UUID getUuid(){
        return this.uuid;
    }

    /**
     * Getter returning return date
     * @return returnDate of this object
     */
    public LocalDate getReturnDate(){
        return this.returnDate;
    }

    /**
     * Getter returning rental date
     * @return rentalDate of this object
     */
    public LocalDate getRentalDate(){
        return this.rentalDate;
    }

    /**
     * Setter of movie
     * @param movie variable set in this object
     */
    public void setMovie(Movie movie){
        this.movie = new Movie(movie);
    }

    /**
     * Setter of returnDate
     * @param returnDate variable set in this object
     */
    public void setReturnDate(LocalDate returnDate){
        this.returnDate = LocalDate.of(returnDate.getYear(), returnDate.getMonthValue(), returnDate.getDayOfMonth());
    }

    /**
     * Setter of rentalDate
     * @param rentalDate variable set in this object
     */
    public void setRentalDate(LocalDate rentalDate){
        this.rentalDate = LocalDate.of(rentalDate.getYear(), rentalDate.getMonthValue(), rentalDate.getDayOfMonth());
    }

    /**
     * Overrided toString method which allows to print this object
     * @return String showing this object
     */
    @Override
    public String toString(){
        return (this.movie + "," + this.uuid.toString() + "," + this.returnDate.toString() + "," + this.rentalDate.toString());
    }
}
