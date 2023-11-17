/**
 * Class Movie represents movie objects witch contains duration of the movie, its title, and director who created movie
 */
public class Movie {
    final int duration;
    final String title;
    final String director;

    /**
     * Basic Constructor of Movie Class
     * @param duration duration of the movie
     * @param title title of the movie
     * @param director movie's director
     */
    public Movie(int duration, String title, String director){
        this.duration = duration;
        this.title = title;
        this.director = director;
    }

    /**
     * Copy constructor of Movie Class
     * @param movie movie witch is copied to this object
     */
    public Movie(Movie movie){
        this.duration = movie.getDuration();
        this.title = movie.getTitle();
        this.director = movie.getDirector();
    }

    /**
     * Getter returning duration
     * @return duration of this object
     */
    public int getDuration(){
        return this.duration;
    }

    /**
     * Getter returning title
     * @return title of this object
     */
    public String getTitle(){
        return this.title;
    }

    /**
     * Getter returning director
     * @return director of this object
     */
    public String getDirector(){
        return this.director;
    }

    /**
     * Overrided toString method which allows to print this object
     * @return String showing this object
     */
    @Override
    public String toString(){
        return (this.title + "," + this.duration + "," + this.director);
    }

}
