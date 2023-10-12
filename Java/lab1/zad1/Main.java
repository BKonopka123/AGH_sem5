public class Main
{
    public static void main(String[] args)
    {
        if(args.length != 3)
        {
            System.out.println("Bad array length!");
            System.exit(0);
        }
        Double first_number = Double.valueOf(args[0]);
        Double second_number = Double.valueOf(args[1]);
        String symbol = args[2];
        System.out.println(first_number + " " + second_number + " " +symbol);
        Double result = 0.0;
        switch(symbol)
        {
            case "+":
                result = first_number + second_number;
                break;
            case "-":
                result = first_number - second_number;
                break;
            case ".*":
                result = first_number * second_number;
                break;
            case "/":
                result = first_number / second_number;
                break;
            default:
                System.out.println("Bad symbol!");
                System.exit(0);
        }
        System.out.println(result);
    }
}