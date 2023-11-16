import java.util.Arrays;
import java.util.Objects;
import java.lang.StringBuilder;

public class BigInt{
    
    private final byte[] number;
    private final boolean sign;

    public static final BigInt ZERO = new BigInt(0);
    public static final BigInt ONE = new BigInt(1);
    public static final BigInt TWO = new BigInt(2);
    public static final BigInt TEN = new BigInt(10);

    public BigInt(int number){
        if(number < 0){
            this.sign = false;
            this.number = new byte[Integer.toString(number).length() - 1];
            number = -number;
        }
        else{
            this.sign = true;
            this.number = new byte[Integer.toString(number).length()];
        }
        for(int i=0; i<this.number.length; i++){
            this.number[i] = (byte) (number % 10);
            number /= 10;
        }
    }

    public BigInt(String number){
        this(Integer.parseInt(number));
    }

    private BigInt(BigInt obj, boolean s){
        this.sign = s;
        this.number = obj.number;
    }

    public byte[] getNumber(){
        return this.number;
    }

    public boolean getSign(){
        return this.sign;
    }

    public String toString(){
        StringBuilder str = new StringBuilder();
        if(!this.sign)
            str.append("-");
        for (int i = 0; i < number.length; i++) {
            str.append(number[number.length - i - 1]);
        }
        return str.toString();
    }

    @Override
    public boolean equals(Object obj){
        if(obj == this) return true;
        if(!(obj instanceof BigInt)) return false;
        BigInt tmp = (BigInt) obj;
        if(this.sign != tmp.sign) return false;
        if(this.number.length != tmp.number.length) return false;
        for(int i=0; i<this.number.length; i++)
            if(this.number[i] != tmp.number[i]) return false;
        return true;
    }

    @Override
    public int hashCode(){
        return Objects.hash(this.sign) + Arrays.hashCode(this.number);
    }

    public static BigInt valueOf(String val){
        if(val.compareTo("0") == 0)
            return ZERO;
        if(val.compareTo("1") == 0)
            return ONE;
        if(val.compareTo("2") == 0)
            return TWO;
        if(val.compareTo("10") == 0)
            return TEN;

        return new BigInt(val);
    }

    public BigInt negate(){
        return new BigInt(this, !this.sign);
    }
}