public class Integration extends Entertainment {
    
    String topic;

    public Integration(String noise, int guests_number, String topic){
        super.noise = new String(noise);
        this.guests_number = guests_number;
        this.topic = new String(topic);
    }

    public String getTopic() {
        return this.topic;
    }

    public String makeNoise() {
        return "Integration noise: " + this.getNoise() + ", number of people: " + this.getGuestsNumber() + ", topic: " + this.getTopic();
    }
}
