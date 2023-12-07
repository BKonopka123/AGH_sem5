public class Party extends Entertainment{
    
    boolean is_dancing;

    public Party(String noise, int guests_number, boolean is_dancing){
        super.noise = new String(noise);
        this.guests_number = guests_number;
        this.is_dancing = is_dancing;
    }

    public boolean getDancing() {
        return this.is_dancing;
    }

    public String makeNoise() {
        return "Party noise: " + this.getNoise() + ", number of people: " + this.getGuestsNumber() + ", is dancing?: " + this.getDancing();
    }
}
