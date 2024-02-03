public class Main {
    static int[][] m = {{1,2,3}, {4,5,6}, {7,8,9}};
    static int [] t = {-1,-2,-3};
    public static void main(String[] args){
        m[2][2] = 0;
        Object[] obj = m;
        obj[2] = t;
        System.out.println(m[2][2]);
    }
}