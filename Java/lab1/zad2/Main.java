public class Main
{
    public static double[] pierwiastki(double a, double b, double c)
    {
        double[] result;
        
        if(a < 0.000001 && a>=0.000000)
        {
            result = new double[1];
            result[0] = -1 * c / b;
            return result;
        }

        double delta = b*b - 4*a*c;
        
        int sgn;
        if(delta < 0.000001 && delta>=0.000000)
            sgn=0;
        else if(delta >= 0.000001)
            sgn=1;
        else
            sgn=-1;

        switch(sgn)
        {
            case -1:
                result = new double[0];
                break;
            case 0:
                result = new double[1];
                result[0] = (-1* b) / (2 * a);
                break;
            case 1:
                result = new double[2];
                result[0] = (-1*b - Math.sqrt(delta))/(2*a);
                result[1] = (-1*b + Math.sqrt(delta))/(2*a);
                break;
            default:
                result = new double[0];
                System.exit(0);
        }

        return result;
    }
    
    public static void main(String[] args)
    {
        if(args.length != 3)
        {
            System.out.println("Bad array length!");
            System.exit(0);
        }
        Double a = Double.valueOf(args[0]);
        Double b = Double.valueOf(args[1]);
        Double c = Double.valueOf(args[2]);
        System.out.println(a + " x^2 + " + b + " x + " + c);

        double[] result = pierwiastki(a,b,c);

        switch(result.length)
        {
            case 0:
                System.out.println("0 results");
                break;
            case 1:
                System.out.println("1 result");
                break;
            case 2:
                System.out.println("2 results");
                break;
            default:
                System.out.println("Something went wrong!");
        }

        for(int i=0; i<result.length; i++)
        {
            System.out.println(result[i]);
        }
    }
}