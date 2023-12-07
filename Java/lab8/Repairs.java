public class Repairs extends Functional{
    
    String tools;

    public Repairs(String noise, String worker, String tools){
        super.noise = new String(noise);
        super.worker = new String(worker);
        this.tools = new String(tools);
    }

    public String getTools() {
        return this.tools;
    }

    public String makeNoise() {
        return "Repairs noise: " + this.getNoise() + ", worker: " + this.getWorker() + ", tools: " + this.getTools();
    }
}
