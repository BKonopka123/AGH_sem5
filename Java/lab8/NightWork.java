public class NightWork extends Functional {
    
    String work_type;

    public NightWork(String noise, String worker, String work_type){
        super.noise = new String(noise);
        super.worker = new String(worker);
        this.work_type = new String(work_type);
    }

    public String getWork_type() {
        return this.work_type;
    }

    public String makeNoise() {
        return "NightWork noise: " + this.getNoise() + ", worker: " + this.getWorker() + ", work_type: " + this.getWork_type();
    }
}
