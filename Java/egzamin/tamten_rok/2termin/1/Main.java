public class Main{
    static int n;
    public Main(){
        this.n++;
    }
    public Main f(int n){
        System.out.println((--n) + " ");
        n--;
        return this;
    }
    public static void main(String[] args){
        new Main().f(n).f(n);
        new Main().f(n).f(n);
    }
}